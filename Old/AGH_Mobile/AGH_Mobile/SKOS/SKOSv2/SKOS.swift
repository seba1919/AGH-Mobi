//
//  SKOS.swift
//  AGH_Mobile
//
//  Created by Filip Kamiński on 10.03.2016.
//  Copyright © 2016 MacKN. All rights reserved.
//

import UIKit
import TFHpple
import Alamofire
import SwiftSpinner
class SKOS {
    
    var EmployeeList:[SKOSEmployee]=[]
    var redict=false
    var redictionURL:URL?
    var dataIsUnavailable=false
    
    
    func searchByName(_ name:String,nazwisko:String,degree:String,viewController:TableViewController) {
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
                //0,2,... osoby 1,3,... miejsce prawcy
                  var  i=0
                while( i<data.count-1){
                    
                    
                    if (data[i].firstTextChild().content=="Chmielewska-Synowska Zofia"){
                        self.EmployeeList.append(SKOSEmployee(_employeeName:data[i].firstTextChild().content, _departmient: "brak", _link: data[i].attributes.first?.1 as? String))
                        i=i-1;
                    }else if(data[i].firstTextChild().content=="Czach Patryk"){
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
                    }else
                    {
                        self.EmployeeList.append(SKOSEmployee(_employeeName:data[i].firstTextChild().content, _departmient: data[i+1].firstTextChild().content, _link: data[i].attributes.first?.1 as? String))
                    }
                i=i+2
                    }
                }else{
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
                }
                DispatchQueue.main.async(execute: { () -> Void in
                    
                    if (self.redict==false && self.dataIsUnavailable==false){
                    viewController.performSegue(withIdentifier: "EmployeeList", sender: self.EmployeeList)
                        self.EmployeeList=[SKOSEmployee]()

                    }else{
                        if(!self.dataIsUnavailable){
                            self.EmployeeList=[SKOSEmployee]()
                            viewController.performSegue(withIdentifier: "Details", sender: self.redictionURL)
                        }else{
                            ///Wyswietl komunikat o bledzie
                            AGH_MobileError.dataIsUnavailable(viewController)
                            self.dataIsUnavailable=false
                        }
                    
                    }
                    SwiftSpinner.hide()

                })
                
                
            } else {
                SwiftSpinner.hide()
                AGH_MobileError.ConnectionError(viewController)
                
            }
        }
        
      
        
        }
    }
    func wyswietlLitere(_ litera:String, viewController:UIViewController){
        SwiftSpinner.show("Proszę Czekać")
        guard let url = URL(string: "https://skos.agh.edu.pl/search/?letter=\(litera)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!) else{return}
      
        AF.request(url).responseString{ response in
            if let list = response.result.value ,let statusCode=response.response {
                if let data=TFHpple(htmlData: list.data(using: String.Encoding.utf8)).search(withXPathQuery: "//table[@class='lista-osob']//a") as? [TFHppleElement]{
                    if data.count>0{
                    //0,2,... osoby 1,3,... miejsce prawcy
                    var i=0
                    while (i<data.count-1){
                
                        self.EmployeeList.append(SKOSEmployee(_employeeName:data[i].firstTextChild().content, _departmient: data[i+1].firstTextChild().content, _link: data[i].attributes.first?.1 as? String))
                        i=i+2
                    }
                    
                }else{
                    
                    self.redict=true
                    self.redictionURL=statusCode.url
                }
                SwiftSpinner.hide()
                
                
            } else {
                AGH_MobileError.ConnectionError(viewController)
                SwiftSpinner.hide()
         
            }
        }
        }
        
        
    }
    static func wyswietlOsobe(_ employeeName:SKOSEmployee, vc:SKOSEmployeeDetailsViewController){
        
        guard let url = URL(string: ((employeeName.link)?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)!) else {return}
       SwiftSpinner.show("Proszę Czekać")
        AF.request(url).responseString{ response in
            if let list = response.result.value ,let statusCode=response.response {
                if let tmp=TFHpple(htmlData: list.data(using: String.Encoding.utf8)){
                            if  let name=tmp.search(withXPathQuery: "//div[@class='c-col vcard']/h1") as? [TFHppleElement]{
                                if name.count>0{
                                    employeeName.employeeName=name[0].firstChild.content
                                    
                                    if name[0].children.count>1, let degree=(name[0].children[1] as AnyObject).content{
                                                employeeName.degree=degree
                                            if(employeeName.degree?.contains("/* <![CDATA["))!{
                                                employeeName.degree=""
                                    }
                                }else{
                                    employeeName.degree=""
                                }
                                }
                            }
                    if  let data=tmp.search(withXPathQuery: "//table[@class='info-osoba']") as? [TFHppleElement]{
                        if (data.count>0){
                            if let info=data[0].firstChild.children, info.count>0{
                                for element in info{
                                    if let tmp=(element as AnyObject).children{
                                    var i=0
                                        while(i<tmp!.count-1){
                                    
                                            employeeName.basicData.append([(tmp![i] as AnyObject).content : (tmp?[i+1] as AnyObject).content!.replacingOccurrences(of: "w Krakowie", with: "w Krakowie\n").replacingOccurrences(of: "Katedra", with: "\nKatedra").replacingOccurrences(of: "Zespół", with: "\nZespół").replacingOccurrences(of: "Zespół", with: "\nZespół").replacingOccurrences(of: "Sekcja", with: "\nSekcja").replacingOccurrences(of: "Dział", with: "\nDział").replacingOccurrences(of: "Komisja", with: "\nKomisja").replacingOccurrences(of: "Centrum", with: "\nCentrum").replacingOccurrences(of: "Biuro", with: "\nBiuro")])
                                        i=i+2
                                    }
                                }
                            }
                            }
                            if(data.count>1){

                                if  let specialRole=data[1].firstChild.children,specialRole.count>0{
                                    for element in specialRole{
                                        if let tmp=(element as? AnyObject)!.children{
                                            var i=0
                                            while(i<tmp!.count-1){
                                                employeeName.jobTitle.append([(tmp![i] as AnyObject).content : (tmp?[i+1] as AnyObject).content!.replacingOccurrences(of: "w Krakowie", with: "w Krakowie\n").replacingOccurrences(of: "Katedra", with: "\nKatedra").replacingOccurrences(of: "Zespół", with: "\nZespół").replacingOccurrences(of: "Zespół", with: "\nZespół").replacingOccurrences(of: "Sekcja", with: "\nSekcja").replacingOccurrences(of: "Dział", with: "\nDział").replacingOccurrences(of: "Komisja", with: "\nKomisja").replacingOccurrences(of: "Centrum", with: "\nCentrum").replacingOccurrences(of: "Biuro", with: "\nBiuro")])
                                                i+=2
                                            }
                                    }
                                }
                                }
                            }

                }
                    }
                
                    if let additionalData=tmp.search(withXPathQuery: "//div[@class='c-col vcard']/ul/li") as? [TFHppleElement], additionalData.count>0{
                    
                        for i in 0 ..< additionalData.count{
                            if (additionalData[i].firstChild.content == "\n          Proszę włączyć JavaScript aby zobaczyć\n        "){
                            // Mail
                                print(additionalData[i].raw)
                                 var adres=additionalData[i].raw.components(separatedBy: "&gt;a/&lt;")[1].components(separatedBy: "otliam:")[0].components(separatedBy: "&gt")[0]
                                print (adres)
                                adres=String(adres.reversed()).replacingOccurrences(of: "#", with: "@")
                                employeeName.additionalData.append(["E-mail":adres])
                                
                            }
                            else{
                                // inne (telefon prytwanty)
                                if  let tmp=additionalData[i].firstChild.content{
                                if (tmp.contains("+")){
                            
                                employeeName.additionalData.append(["Dodatkowy telefon":additionalData[i].firstChild.content])
                                
                                }else if (tmp.contains("ul.")){
                                
                                employeeName.additionalData.append(["Adres prywatny":additionalData[i].firstChild.content])
                                
                            }else{
                                 employeeName.additionalData.append(["Inne":additionalData[i].firstChild.content])
                            }
                                }
                        }
                    
                }
                   
                }
                DispatchQueue.main.async(execute: { () -> Void in
               SwiftSpinner.hide()
                    vc.reloadData()
                    })
                
                
            } else {
                AGH_MobileError.ConnectionError(vc)
                    SwiftSpinner.hide()

            }
        }
    
        
        

    }
    }
    
    
    

}
