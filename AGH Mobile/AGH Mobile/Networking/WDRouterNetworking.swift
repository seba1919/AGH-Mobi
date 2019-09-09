//
//  WDRouterNetworking.swift
//  AGH Mobile
//
//  Created by Mateusz Wagner on 06/09/2019.
//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.
//

//MARK: - Imports
import Foundation
import PromiseKit
import SwiftSoup
import Alamofire

//MARK: - Global struct
struct WDRequestData {
    var viewState: String?
    var viewGenerator: String?
    var eventValidation: String?
}

//MARK: - Global enumeration for navigation in WD
enum UrlType: String {
    case Ogloszenia
    case Wynik2
    case OcenyP
    case Stypendia
    case PracaDyp
    case PodzGodz
}

//MARK: - Global enumeration for handling request response
enum requestResponseType {
    case success
    case credentialsFailiture
    case serverFailiture
}

//MARK: - Implementation
class WDRouterNetworking {
    
    //MARK: - Singleton Instance
    static let sharedInstance = WDRouterNetworking()
    
    //MARK: - Private Properties
    private var viewState = ""
    private var viewGenerator = ""
    private var  eventValidation = ""
    
    
    //Mark: - Public methods
    public func performLoginAction(userWDLogin: String, userWDPassword: String, withPart: UrlType = .OcenyP , requestHandler: @escaping (requestResponseType) -> Void) {
        
        CustomNotifications.showCustomSpinnerAlert()
        let loginURL = URL(string: "https://dziekanat.agh.edu.pl/Logowanie2.aspx?ReturnUrl=%2f" + withPart.rawValue + ".aspx")!
        
        var request = URLRequest(url: loginURL)
        
        request.httpMethod = "POST"
        
        let headers: HTTPHeaders? = [
            "Content-Type": "application/x-www-form-urlencoded"
        ]
        
        var parametersToSend: Parameters = [
            "__VIEWSTATE": viewState,
            "__VIEWSTATEGENERATOR": viewGenerator,
            "ctl00$ctl00$ContentPlaceHolder$MiddleContentPlaceHolder$txtIdent": userWDLogin,
            "ctl00$ctl00$ContentPlaceHolder$MiddleContentPlaceHolder$txtHaslo": userWDPassword,
            "ctl00$ctl00$ContentPlaceHolder$MiddleContentPlaceHolder$butLoguj": "Zaloguj",
            "ctl00$ctl00$ContentPlaceHolder$MiddleContentPlaceHolder$rbKto": "student",
            "__EVENTVALIDATION": eventValidation,
        ]
        
        
        func initialLoginRequest() -> Promise<Void> {

            return Promise{ resolver in
                AF.request(loginURL, method: .post, parameters: parametersToSend)
                    .responseString {  response in
                        
                        switch response.result {
                            
                        case .success(_):
                            resolver.fulfill_()
                        case .failure(let error):
                            resolver.reject(error)
                        }
                        self.saveCookiesToStorage(from: response)
                }
            }
        }
        
        firstly {
            initialLoginRequest()
            }
            .then(on: DispatchQueue.global(qos: .background)) {
                self.checkIfLoggedIn()
            }
            .done() { isLoggedIn in
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
    
    //MARK: - NavigateTo Method Description
    /**
     
    For making above method working please **type your user and password**
    instead of ` "keychain.user" ` and ` "keychain.password" ` in line **124**
     
     # Use example for navigateTo method:
     
     ```
     loginPageView.pushAboutUsVC = {
         WDRouterNetworking().navigateTo(url: .Stypendia) { requestResult in
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
    public func navigateTo(url withPart: UrlType = .OcenyP, requestHandler: @escaping (requestResponseType) -> Void) {
        firstly {
            navigation(withPart)
            }
            .then(on: DispatchQueue.global(qos: .background)) {
                self.checkIfLoggedIn()
            }
            .done() { validation in
                if !validation {
                    //TODO: - KEYCHAIN IMPLEMENTATION
                    self.performLoginAction(userWDLogin: "keychain.user", userWDPassword: "keychain.password", withPart: withPart) { isLoggedIn in
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
    
    public func performLogoutAction(requestHandler: @escaping (Bool) -> Void)  {

        let url = "https://dziekanat.agh.edu.pl/Wyloguj.aspx"
        
        AF.request(url, method: .post)
            .responseString {  response in
                
                switch response.result {
                case .success(_):
                    requestHandler(true)
                case .failure(let error):
                    print(error)
                    requestHandler(false)
                }
                self.saveCookiesToStorage(from: response)
        }
        
    }
    
    //MARK: - Fileprivate Methods
    fileprivate func navigation(_ partOfUrl: UrlType = .OcenyP) -> Promise<Void> {
        
        let url = "https://dziekanat.agh.edu.pl/" + partOfUrl.rawValue + ".aspx"
        CustomNotifications.showCustomSpinnerAlert()
        return Promise{ resolver in
            AF.request(url, method: .post)
                .responseString {  response in
                    
                    switch response.result {
                        
                    case .success(_):
                        resolver.fulfill_()
                    case .failure(let error):
                        resolver.reject(error)
                    }
                    self.saveCookiesToStorage(from: response)
            }
        }
    }
    
    fileprivate func saveCookiesToStorage(from response: DataResponse<String>) {
        if let headerFields = response.response?.allHeaderFields as? [String: String], let URL = response.request?.url
        {
            let cookies = HTTPCookie.cookies(withResponseHeaderFields: headerFields, for: URL)
            Alamofire.Session.default.session.configuration.httpCookieStorage?.setCookies(cookies, for: URL, mainDocumentURL: nil)
        }
    }
    
    fileprivate func checkIfLoggedIn() -> Promise<Bool> {
        return Promise { resolver in
            guard let cookies = Alamofire.Session.default.session.configuration.httpCookieStorage?.cookies else { resolver.fulfill(false) ; return }
            let validationCookie = cookies.filter({$0.name == ".ASPXUSERWU"})
            validationCookie.count == 1  ? resolver.fulfill(true) : resolver.fulfill(false)
        }
    }
}
