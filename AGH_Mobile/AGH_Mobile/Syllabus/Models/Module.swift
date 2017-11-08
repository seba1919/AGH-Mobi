//
//  Module.swift
//  AGH_Mobile_2.0
//
//  Created by Filip Kamiński on 05.04.2017.
//  Copyright © 2017 MacKN. All rights reserved.
//

import UIKit

class Module: NSObject {
    var    name:String?//- nazwa modułu;
    var    ectsPoints: Int? //- liczba punktów ECTS;
    var    creditConditions :String?//- zasady zaliczenia;
    var    prerequisites:String? //- wymagania wstępne i dodatkowe;
    var    notices:String?//- uwagi;
    var    literature:String?//- literatura;
    var    moduleOwner:UniversityTeacher? //- osoba odpowiedzialna za moduł;
    var    teachers:[UniversityTeacher]?//- prowadzący zajęcia w module;
    var    moduleActivities :[ModuleActivity]?// - formy zajęć modułu (wykład, laboratoria itp.);
    var    moduleUrl :String?//- bezpośredni odnośnik do karty modułu;
    var    moduleCode :String?//- kod/sygnatura modułu
    var    semester:Int{
        get{
            guard let code=moduleCode else{
                print("Error converting semester value")
                return -1
            }
            guard let tmp=Int(code.components(separatedBy: "-")[2])else{
                print("Error converting semester value")
                return -1
            }
                switch(tmp){
                case 0..<100:
                    return 0;
                case 100..<200:
                    return 1;
                case 200..<300:
                    return 2;
                case 300..<400:
                    return 3;
                case 400..<500:
                    return 4;
                case 500..<600:
                    return 5;
                case 600..<700:
                    return 6;
                case 700..<800:
                    return 7;
                case 800..<900:
                    return 8;
                case 900..<1000:
                    return 9;
                case 1000..<1200:
                    return 10;
                default:
                    return -1;
                }
        
        }
    }
    
    init(name:String,ectsPoints:Int?,creditConditions:String?,prerequisites:String?,notices:String?,literature:String?,moduleOwner:UniversityTeacher?,teachers:[UniversityTeacher]?,moduleActivities:[ModuleActivity]?,moduleUrl:String?,moduleCode:String?){
       self.name=name
       self.ectsPoints=ectsPoints
       self.creditConditions=creditConditions
       self.prerequisites=prerequisites
       self.notices=notices
       self.literature=literature
       self.moduleOwner=moduleOwner
       self.teachers=teachers
       self.moduleActivities=moduleActivities
       self.moduleUrl=moduleUrl
       self.moduleCode=moduleCode
    }
 
  

}
