//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.

import PromiseKit
import Alamofire

class WDRouterNetworking {
    
    // MARK: - Instance Properties
    fileprivate var viewState = ""
    fileprivate var viewGenerator = ""
    fileprivate var eventValidation = ""
    fileprivate let cookiesName = ".ASPXUSERWU"

    public func performWDLoginAction(userLogin: String,
                                     userPassword: String,
                                     withWDSubpageURLType
        subpageType: WDSubpageURLType = WDSubpageURLType.defaultSubpage(),
                                     requestHandler: @escaping (WDRequestResponseType) -> Void) {
        
        CustomNotifications.showCustomSpinnerAlert()
        
        let loginURL = WDRequestComponentsGenerator.getLoginURL(withWDSubpageURLType: subpageType)
        var request = URLRequest(url: loginURL)
        request.httpMethod = "POST"
        let parametersToSend = WDRequestComponentsGenerator
            .getParameters(withViewState: viewState,
                           withViewGenerator: viewGenerator,
                           withUserLogin: userLogin,
                           withUserPassword: userPassword,
                           withEventValidation: eventValidation)
        
        performLoginProcedure(withLoginURL: loginURL,
                              withParametersToSend: parametersToSend,
                              withRequestHandler: requestHandler)
    }
    
    // MARK: - performNavigationProcedureToWDSubpage Method Description
    /**
     
     For making above method working please **type your user and password**
     instead of ` "keychain.user" ` and ` "keychain.password" ` in line **124**
     
     # Use example for performNavigationProcedureToWDSubpage method:
     
     ```
     loginPageView.pushAboutUsVC = {
         WDRouterNetworking().performNavigationProcedureToWDSubpage(with: .gradesECTSPoints) { requestResult in
             if requestResult == .success {
                 self.navigationController?.pushViewController(AboutAsViewController(), animated: true)
             } else if requestResult == .credentialsFailiture {
                 // Return to LoginPageViewController will be added here after coordinator implementation
                 print("Could not login. Please try again")
             }
         }
     }
     ```
     */
    public func performNavigationProcedureToWDSubpage(with subpageType: WDSubpageURLType = .gradesECTSPoints,
                                                      requestHandler: @escaping (WDRequestResponseType) -> Void) {
        
        firstly {
            navigationToSubpage(with: subpageType)
        }
        .then(on: DispatchQueue.global(qos: .background)) {
            self.checkIfLoggedIn()
        }
        .done { validation in
            if !validation {
                //TODO: - KEYCHAIN IMPLEMENTATION
                self.performWDLoginAction(userLogin: "keychain.user",
                                          userPassword: "keychain.password",
                                          withWDSubpageURLType: subpageType) { isLoggedIn in
                                            requestHandler(isLoggedIn)
                }
            } else {
                CustomNotifications.hideCustomSpinnerAlert()
                requestHandler(.success)
            }
        }
        .catch(on: DispatchQueue.global(qos: .background)) { error in
            print(error)
            DispatchQueue.main.async { CustomNotifications.setupAlertOnServerConnectionFailture() }
        }
    }
    
    public func performLogoutAction(logoutHandler: @escaping () -> Void) {
        
        logoutHandler()
        
        //clean cookies
        guard let cookiesStorage = Alamofire.Session.default.session
            .configuration.httpCookieStorage else { return }
        
        if let cookies = cookiesStorage.cookies {
            for cookie in cookies {
                cookiesStorage.deleteCookie(cookie)
            }
        }
    }
    
    fileprivate func performLoginProcedure(withLoginURL loginURL: URL,
                                           withParametersToSend parametersToSend: Parameters,
                                           withRequestHandler
        requestHandler: @escaping (WDRequestResponseType) -> Void) {
        
        func initialWDLoginRequest() -> Promise<Void> {
            return Promise { resolver in
                AF.request(loginURL, method: .post, parameters: parametersToSend)
                    .responseString {  response in
                        
                        switch response.result {
                        case .success:
                            resolver.fulfill_()
                        case .failure(let error):
                            resolver.reject(error)
                        }
                        self.saveCookiesToStorage(from: response)
                }
            }
        }
        
        firstly {
            initialWDLoginRequest()
        }
        .then(on: DispatchQueue.global(qos: .background)) {
            self.checkIfLoggedIn()
        }
        .done { isLoggedIn in
            isLoggedIn ? requestHandler(.success) : requestHandler(.credentialsFailiture)
            CustomNotifications.hideCustomSpinnerAlert()
        }
        .catch(on: DispatchQueue.global(qos: .background)) { error in
            print(error)
            DispatchQueue.main.async {
                CustomNotifications.hideCustomSpinnerAlert()
                CustomNotifications.setupAlertOnServerConnectionFailture()
                requestHandler(.serverFailiture)
            }
        }
    }
    
    // MARK: - Fileprivate Methods
    fileprivate func navigationToSubpage(with subpageWDURLType: WDSubpageURLType = .gradesECTSPoints) -> Promise<Void> {
        
        let url = WDRequestComponentsGenerator.getURLToSubpage(with: subpageWDURLType)
        CustomNotifications.showCustomSpinnerAlert()
        return Promise { resolver in
            AF.request(url, method: .post)
                .responseString {  response in
                    
                    switch response.result {
                        
                    case .success:
                        resolver.fulfill_()
                    case .failure(let error):
                        resolver.reject(error)
                    }
                    self.saveCookiesToStorage(from: response)
            }
        }
    }
    
    fileprivate func saveCookiesToStorage(from response: DataResponse<String>) {
        if let headerFields = response.response?.allHeaderFields as? [String: String], let URL = response.request?.url {
            let cookies = HTTPCookie.cookies(withResponseHeaderFields: headerFields, for: URL)
            Alamofire.Session.default.session
                .configuration.httpCookieStorage?.setCookies(cookies, for: URL, mainDocumentURL: nil)
        }
    }
    
    fileprivate func checkIfLoggedIn() -> Promise<Bool> {
        return Promise { resolver in
            
            guard let allCookies = Alamofire.Session.default.session
                .configuration.httpCookieStorage?.cookies
                else {
                    resolver.fulfill(false)
                    return
            }
            
            let validationCookie = allCookies.filter({$0.name == cookiesName})
           
            if validationCookie.isEmpty {
                resolver.fulfill(false)
            } else {
                resolver.fulfill(true)
            }
        }
    }
}
