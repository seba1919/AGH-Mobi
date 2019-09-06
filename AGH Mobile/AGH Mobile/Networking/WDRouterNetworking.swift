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
    public func performLoginAction(userWDLogin: String, userWDPassword: String, completion: @escaping (Bool) -> Void) {
        
        
        let loginURL = URL(string: "https://dziekanat.agh.edu.pl/Logowanie2.aspx?ReturnUrl=%2fOcenyP.aspx")!
        var validationURL: URL?
        
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
        
        
        func initialLoginRequest() -> Promise<String> {
            
            return Promise{ resolver in
                AF.request(loginURL, method: .post, parameters: parametersToSend)
                    .responseString {  response in
                        
                        switch response.result {
                            
                        case .success(let data):
                            resolver.fulfill(data)
                            validationURL = response.response?.url
                        case .failure(let error):
                            resolver.reject(error)
                        }
                        
                        if let headerFields = response.response?.allHeaderFields as? [String: String], let URL = response.request?.url
                        {
                            let cookies = HTTPCookie.cookies(withResponseHeaderFields: headerFields, for: URL)
                            print(cookies)
                            Alamofire.Session.default.session.configuration.httpCookieStorage?.setCookies(cookies, for: URL, mainDocumentURL: nil)
                            response.response?.url == loginURL ? completion(false) : completion(true)
                        }
                }
            }
        }
        
        func getViewStateFromHTML(innerHTML: String) -> Promise<WDRequestData> {
            return Promise { resolver in
                
                let data: Document = try SwiftSoup.parse(innerHTML)
                let requestData = WDRequestData(viewState: try data.getElementById("__VIEWSTATE")?.val(),
                                                viewGenerator: try data.getElementById("__VIEWSTATEGENERATOR")?.val(),
                                                eventValidation: try data.getElementById("__EVENTVALIDATION")?.val())
                
                resolver.fulfill(requestData)
            }
        }
        
        firstly {
            initialLoginRequest()
            }
            .then(on: DispatchQueue.global(qos: .background)) { innerHTML in
                getViewStateFromHTML(innerHTML: innerHTML)
            }
            .catch(on: DispatchQueue.global(qos: .background)) { error in
                print(error)
        }
        
    }
    
}
