//
//  Skos2.swift
//  AGH_Mobile
//
//  Created by Kamil Szelag on 1/5/18.
//  Copyright © 2018 mackn. All rights reserved.
//

import UIKit
import TFHpple
import Alamofire
import SwiftSpinner

class Skos2 {
    
    var EmployeeList:[SKOSEmployee]=[]
    var redict=false
    var redictionURL:URL?
    var dataIsUnavailable=false
    
    func search(_ name:String,nazwisko:String,degree:String,viewController:TableViewController) {
        EmployeeList=[]
        redict=false
        redictionURL=nil
        dataIsUnavailable=false
        SwiftSpinner.show("Proszę Czekać")
        guard let url = URL(string: "https://skos.agh.edu.pl/search/?letter=\(nazwisko)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!) else{return}
        
        
        AF.request(url).responseString{ response in
            if let list = response.result.value ,let statusCode=response.response {
                if let data=TFHpple(htmlData:list.data(using: String.Encoding.utf8) ).search(withXPathQuery: "//table[@class='lista-osob']//a") as? [TFHppleElement]{
                    if data.count>0{
                        var  i=0
                        while( i<data.count-1){
                            if (data[i].firstTextChild().content=="Chmielewska-Synowska Zofia"){
                                self.EmployeeList.append(SKOSEmployee(_employeeName:data[i].firstTextChild().content, _departmient: "brak", _link: data[i].attributes.first?.1 as? String))
                                i=i-1;
                            } else if(data[i].firstTextChild().content=="Czach Patryk"){
                                self.EmployeeList.append(SKOSEmployee(_employeeName:data[i].firstTextChild().content, _departmient: "brak", _link: data[i].attributes.first?.1 as? String))
                                i=i-1;
                            } else if (data[i].firstTextChild().content=="Głowiak Dominika"){
                                self.EmployeeList.append(SKOSEmployee(_employeeName:data[i].firstTextChild().content, _departmient: "brak", _link: data[i].attributes.first?.1 as? String))
                                i=i-1;
                            } else if (data[i].firstTextChild().content=="Janczyszyn Jerzy, dr hab. inż."){
                                self.EmployeeList.append(SKOSEmployee(_employeeName:data[i].firstTextChild().content, _departmient: "brak", _link: data[i].attributes.first?.1 as? String))
                                i=i-1;
                            } else if (data[i].firstTextChild().content=="Kączka Krzysztof"){
                                self.EmployeeList.append(SKOSEmployee(_employeeName:data[i].firstTextChild().content, _departmient: "brak", _link: data[i].attributes.first?.1 as? String))
                                i=i-1;
                            } else if (data[i].firstTextChild().content=="Lis Ryszard, mgr inż."){
                                self.EmployeeList.append(SKOSEmployee(_employeeName:data[i].firstTextChild().content, _departmient: "brak", _link: data[i].attributes.first?.1 as? String))
                                i=i-1;
                            } else if (data[i].firstTextChild().content=="Mączyński Zbigniew, mgr inż."){
                                self.EmployeeList.append(SKOSEmployee(_employeeName:data[i].firstTextChild().content, _departmient: "brak", _link: data[i].attributes.first?.1 as? String))
                                i=i-1;
                            } else if (data[i].firstTextChild().content=="Pyrć Tomasz, mgr inż."){
                                self.EmployeeList.append(SKOSEmployee(_employeeName:data[i].firstTextChild().content, _departmient: "brak", _link: data[i].attributes.first?.1 as? String))
                                i=i-1;
                            } else if (data[i].firstTextChild().content=="Rękas Artur, dr inż."){
                                self.EmployeeList.append(SKOSEmployee(_employeeName:data[i].firstTextChild().content, _departmient: "brak", _link: data[i].attributes.first?.1 as? String))
                                i=i-1;
                            } else if (data[i].firstTextChild().content=="Tyszownicka Grażyna, mgr"){
                                self.EmployeeList.append(SKOSEmployee(_employeeName:data[i].firstTextChild().content, _departmient: "brak", _link: data[i].attributes.first?.1 as? String))
                                i=i-1;
                            } else if (data[i].firstTextChild().content=="Tytko Andrzej, prof. dr hab. inż."){
                                self.EmployeeList.append(SKOSEmployee(_employeeName:data[i].firstTextChild().content, _departmient: "brak", _link: data[i].attributes.first?.1 as? String))
                                i=i-1;
                            }else if (data[i].firstTextChild().content=="Kowalik Stefan"){
                                self.EmployeeList.append(SKOSEmployee(_employeeName:data[i].firstTextChild().content, _departmient: "brak", _link: data[i].attributes.first?.1 as? String))
                                i=i-1;
                            }else if (data[i].firstTextChild().content=="Bańdo Marian"){
                                self.EmployeeList.append(SKOSEmployee(_employeeName:data[i].firstTextChild().content, _departmient: "brak", _link: data[i].attributes.first?.1 as? String))
                                i=i-1;
                            }else if (data[i].firstTextChild().content=="Bydałek Adam, prof. dr hab. inż."){
                                self.EmployeeList.append(SKOSEmployee(_employeeName:data[i].firstTextChild().content, _departmient: "brak", _link: data[i].attributes.first?.1 as? String))
                                i=i-1;
                            }
                            else{
                                self.EmployeeList.append(SKOSEmployee(_employeeName:data[i].firstTextChild().content, _departmient: data[i+1].firstTextChild().content, _link: data[i].attributes.first?.1 as? String))
                                
                            }
                            i=i+2
                        }
                    } else{
                        //dorobic przypadek że nic nie znaleziono
                        if(statusCode.statusCode==200 ){
                            if ("\(statusCode.url!)"=="https://skos.agh.edu.pl"
                                || "\(statusCode.url!)".contains("search/?")){
                                self.dataIsUnavailable=true
                                self.redict=false
                                print("nie ma takich danych")
                            }else{
                                self.redict=true
                                self.redictionURL=statusCode.url
                                var empl=SKOSEmployee(_link:String(describing: self.redictionURL as! URL))
                                self.EmployeeList.append(empl)
                            }
                        }else{
                            print("Wystapil nieznany blad")
                            
                        }
                    }

                    DispatchQueue.main.async(execute: { () -> Void in
                        if (self.redict==false && self.dataIsUnavailable==false){
                            viewController.performSegue(withIdentifier: "EmployeeList", sender: self.EmployeeList)                            //destination.showIt(employeeTable:self.EmployeeList)
                            self.EmployeeList=[SKOSEmployee]()
                            
                        }else{
                            if(!self.dataIsUnavailable){
                                self.EmployeeList=[SKOSEmployee]()
                                viewController.performSegue(withIdentifier: "Details", sender: self.redictionURL)
                                //destination.showIt(employeeTable:self.EmployeeList)
                            }else{
                                AGH_MobileError.dataIsUnavailable(viewController)
                                self.dataIsUnavailable=false
                            }
                        }
                        SwiftSpinner.hide()

                    })
                } else {
                    AGH_MobileError.ConnectionError(viewController)
                    SwiftSpinner.hide()
                }
            }
        }
    }
    
    
    
    
    
    func searchPerson(_ name:String,nazwisko:String,degree:String,viewController:AlphabetViewController) {
        EmployeeList=[]
        redict=false
        redictionURL=nil
        dataIsUnavailable=false
        SwiftSpinner.show("Proszę Czekać")

        guard let url = URL(string: "https://skos.agh.edu.pl/search/?nazwisko=\(nazwisko)&imie=\(name)&tytul=\(degree)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!) else{return}
        
        AF.request(url).responseString{ response in
            if let list = response.result.value ,let statusCode=response.response {
                if let data=TFHpple(htmlData:list.data(using: String.Encoding.utf8) ).search(withXPathQuery: "//table[@class='lista-osob']//a") as? [TFHppleElement]{
                    
                        //dorobic przypadek że nic nie znaleziono
                        if(statusCode.statusCode==200 ){
                            if ("\(statusCode.url!)"=="https://skos.agh.edu.pl"
                                || "\(statusCode.url!)".contains("search/?")){
                                self.dataIsUnavailable=true
                                self.redict=false
                                print("nie ma takich danych")
                            }else{
                                self.redict=true
                                self.redictionURL=statusCode.url
                            }
                        }else{
                            print("Wystapil nieznany blad")
                            
                        }
                    DispatchQueue.main.async(execute: { () -> Void in
                    
                        if(!self.dataIsUnavailable){
                            
                                print(self.redictionURL)
                                self.EmployeeList=[SKOSEmployee]()
                                var empl=SKOSEmployee(_link:String(describing: self.redictionURL as! URL))
                                viewController.res = empl
                                viewController.performSegue(withIdentifier: "GO", sender: nil)
                                //vc.showIt(employee: empl)
                                
                            }else{
                                AGH_MobileError.dataIsUnavailable(viewController)
                                viewController.error = true
                                self.dataIsUnavailable=false
                                viewController.performSegue(withIdentifier: "GO", sender: nil)
                            }
                        SwiftSpinner.hide()
                    })
                    
                    
                } else {
                    AGH_MobileError.ConnectionError(viewController)
                    SwiftSpinner.hide()
                    
                }
            }
            
            
            
        }
    }
    
    
    
    
    
    
    
}

