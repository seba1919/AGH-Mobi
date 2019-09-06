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

//MARK: - Implementation
class WDRouterNetworking {
    
    //MARK: - Singleton Instance
    static let sharedInstance = WDRouterNetworking()
    
    //MARK: - Private Properties
    private var viewState = ""
    private var viewGenerator = ""
    private var  eventValidation = ""
    
    
    //Mark: - Public methods
    public func performLoginAction(userWDLogin: String, userWDPassword: String, withPart: UrlType = .OcenyP , completion: @escaping (Bool) -> Void) {
        
        
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
                        
                        if let headerFields = response.response?.allHeaderFields as? [String: String], let URL = response.request?.url
                        {
                            let cookies = HTTPCookie.cookies(withResponseHeaderFields: headerFields, for: URL)
                            Alamofire.Session.default.session.configuration.httpCookieStorage?.setCookies(cookies, for: URL, mainDocumentURL: nil)
                        }
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
                isLoggedIn ? completion(true) : completion(false)
            }
            .catch(on: DispatchQueue.global(qos: .background)) { error in
                print(error)
        }
    }
    
    enum UrlType: String {
        case Ogloszenia
        case Wynik2
        case OcenyP
        case Stypendia
        case PracaDyp
        case PodzGodz
    }
    
    
    func navigateTo(_ partOfUrl: UrlType = .OcenyP) -> Promise<Void> {
        
        let url = "https://dziekanat.agh.edu.pl/" + partOfUrl.rawValue + ".aspx"
        return Promise{ resolver in
            AF.request(url, method: .post)
                .responseString {  response in
                    
                    switch response.result {
                        
                    case .success(_):
                        resolver.fulfill_()
                    case .failure(let error):
                        resolver.reject(error)
                    }
                    
                    if let headerFields = response.response?.allHeaderFields as? [String: String], let URL = response.request?.url
                    {
                        let cookies = HTTPCookie.cookies(withResponseHeaderFields: headerFields, for: URL)
                        Alamofire.Session.default.session.configuration.httpCookieStorage?.setCookies(cookies, for: URL, mainDocumentURL: nil)
                    }
            }
        }
    }
    
    func checkIfLoggedIn() -> Promise<Bool> {
        
        return Promise { resolver in
            guard let cookies = Alamofire.Session.default.session.configuration.httpCookieStorage?.cookies else { resolver.reject(PromiseErrors.userIsNotLoggedIn); return }
            let validationCookie = cookies.filter({$0.name == ".ASPXUSERWU"})
            return validationCookie.count == 1  ? resolver.fulfill(true) : resolver.reject(PromiseErrors.userIsNotLoggedIn)
        }

    }
    
    
    func checkIfSessionIsValid(completion: @escaping (Bool) -> Void) {
        firstly {
            navigateTo()
            }
            .then(on: DispatchQueue.global(qos: .background)) {
                self.checkIfLoggedIn()// == true ? completion(true) : completion(false)
            }
            .catch(on: DispatchQueue.global(qos: .background)) { error in
                print(error)
        }
    }
    
    func navigateTo(url withPart: UrlType = .OcenyP, completion: @escaping (Bool) -> Void) {
        firstly {
            navigateTo(withPart)
            }
            .then(on: DispatchQueue.global(qos: .background)) {
                self.checkIfLoggedIn()
            }
            .catch(on: DispatchQueue.global(qos: .background)) { _ in
                UIView.showSpinnerToast(message: NSLocalizedString("WDRouterNetworking_Reauthenticate", comment: ""))
                self.performLoginAction(userWDLogin: "keychain.user", userWDPassword: "kaychain.password", withPart: withPart) { isLoggedIn in
                    UIView.hideAllToasts()
                    isLoggedIn ? completion(true) /* w ViewControllerze ladujemy nowy widok */ : completion(false) /* w ViewControllerze ladujemy widok Logowania */
                }
        }
    }
    
    enum PromiseErrors: Error {
        case userIsNotLoggedIn
        case conditionBInvalid
    }
    
}
