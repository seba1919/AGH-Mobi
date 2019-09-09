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
            CustomNotifications.showCustomSpinnerAlert()

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
                CustomNotifications.hideCustomSpinnerAlert()
            }
            .catch(on: DispatchQueue.global(qos: .background)) { error in
                print(error)
                
                DispatchQueue.main.async { CustomNotifications.setupAlertOnServerConnectionFailture() }
        }
    }
    
    public func navigateTo(url withPart: UrlType = .OcenyP, loadingHandler: @escaping (Bool) -> Void) {
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
                        loadingHandler(isLoggedIn)
                    }
                } else {
                    CustomNotifications.hideCustomSpinnerAlert()
                    loadingHandler(true)
                }
            }
            .catch(on: DispatchQueue.global(qos: .background)) { error in
                print(error)
                DispatchQueue.main.async { CustomNotifications.setupAlertOnServerConnectionFailture() }
        }
    }
    
    public func logout(logoutHandler: @escaping (Bool) -> Void)  {
        
        let url = "https://dziekanat.agh.edu.pl/Wyloguj.aspx"
        
        AF.request(url, method: .post)
            .responseString {  response in
                
                switch response.result {
                    
                case .success(_):
                    logoutHandler(true)
                case .failure(let error):
                    print(error)
                    logoutHandler(false)
                }
                
                if let headerFields = response.response?.allHeaderFields as? [String: String], let URL = response.request?.url
                {
                    let cookies = HTTPCookie.cookies(withResponseHeaderFields: headerFields, for: URL)
                    Alamofire.Session.default.session.configuration.httpCookieStorage?.setCookies(cookies, for: URL, mainDocumentURL: nil)
                }
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
                    
                    if let headerFields = response.response?.allHeaderFields as? [String: String], let URL = response.request?.url
                    {
                        let cookies = HTTPCookie.cookies(withResponseHeaderFields: headerFields, for: URL)
                        Alamofire.Session.default.session.configuration.httpCookieStorage?.setCookies(cookies, for: URL, mainDocumentURL: nil)
                    }
            }
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
