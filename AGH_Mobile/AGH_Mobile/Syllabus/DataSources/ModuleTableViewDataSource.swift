//
//  ModuleTableViewDataSource.swift
//  AGH_Mobile_2.0
//
//  Created by Filip Kamiński on 06.04.2017.
//  Copyright © 2017 MacKN. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
class ModuleTableViewDataSource: SyllabusDataSource, UITableViewDataSource {
    var degreeName:Degree?
    var modulesList:[[Module]]=[]
    var modulesNamesList:[String]=[]
    var cellName="Module_Cell"
    var delegate:SyllabusViewControllerProtocol?
     init(DegreeName:Degree){
        degreeName=DegreeName
    }
    
    func getData(){
        if let validUrl = degreeName?.syllabusName,let department = degreeName?.department{
        let url = URL(string: "https://syllabuskrk.agh.edu.pl/\(year)/magnesite/api/faculties/\(department)/study_plans/\(validUrl)/modules/".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)!
        
        Alamofire.request(url, headers: ["Accept":"application/vnd.syllabus.agh.edu.pl.v2+json", "Accept-Language":language]).responseJSON{ response in
            
            switch response.result {
            case .success:
                self.handleJSON(response: response.result.value)
                
            case .failure(let error):
                self.handleError(error: error)
            }
            
        }
    }
    }
    
     private func handleJSON(response:Any?){
        
        guard let responseData = response else{
            handleJSONerror()
            return
        }
        
        
        var semestr0:[Module]=[]
        var semestr1:[Module]=[]
        var semestr2:[Module]=[]
        var semestr3:[Module]=[]
        var semestr4:[Module]=[]
        var semestr5:[Module]=[]
        var semestr6:[Module]=[]
        var semestr7:[Module]=[]
        var semestr8:[Module]=[]
        var semestr9:[Module]=[]
        var semestr10:[Module]=[]
        
        var json = JSON(responseData)["syllabus"]["assignments"]
        
        for (_,degree):(String, JSON) in json{
            let p2=degree["assignment"]
            
            let person=p2["module"]["module_owner"]
            let moduleOwner=UniversityTeacher(name: person["name"].stringValue, surname: person["surname"].stringValue, email: person["email"].stringValue,title: person["employee_title"].stringValue)
            
            var teachers:[UniversityTeacher]=[]
            for (_,teacher):(String, JSON) in p2["module"]["teachers"]{
                teachers.append(UniversityTeacher(name: teacher["teacher"]["name"].stringValue, surname: teacher["teacher"]["surname"].stringValue, email: teacher["teacher"]["email"].stringValue,title: teacher["teacher"]["employee_title"].stringValue))
            }
            
            
            var moduleActivites:[ModuleActivity]=[]
            for (_,activity):(String, JSON) in p2["module"]["module_activities"]{
                let tmp=activity["module_activity"]
                if( tmp["classes_hours"]>0){
                    moduleActivites.append(ModuleActivity(type: tmp["type"].stringValue, hours: tmp["classes_hours"].intValue, classesTopic: tmp["module_classes"][0]["module_class"]["topic"].stringValue, classesDescription: tmp["module_classes"][0]["module_class"]["description"].stringValue))
                }
            }

            
            let currentDegree=Module(name: p2["module"]["name"].stringValue, ectsPoints: p2["module"]["ects_points"].intValue, creditConditions: p2["module"]["credit_conditions"].stringValue, prerequisites: p2["module"]["prerequisites"].stringValue, notices: p2["module"]["notices"].stringValue, literature: p2["module"]["literature"].stringValue, moduleOwner:moduleOwner, teachers: teachers, moduleActivities: moduleActivites, moduleUrl: p2["module_url"].stringValue, moduleCode: p2["module_code"].stringValue)
           
            
            switch (currentDegree.semester){
            case 0:semestr0.append(currentDegree)
                break
            case 1:semestr1.append(currentDegree)
                break
            case 2:semestr2.append(currentDegree)
                break
            case 3:semestr3.append(currentDegree)
                break
            case 4:semestr4.append(currentDegree)
                break
            case 5:semestr5.append(currentDegree)
                break
            case 6:semestr6.append(currentDegree)
                break
            case 7:semestr7.append(currentDegree)
                break
            case 8:semestr8.append(currentDegree)
                break
            case 9:semestr9.append(currentDegree)
                break
            case 10:semestr10.append(currentDegree)
                break
            default:
                handleJSONerror()
                break
            }
            
            
        }
        if (semestr1.count>0){modulesList.append(semestr1); modulesNamesList.append("Semestr 1")}
        if (semestr2.count>0){modulesList.append(semestr2); modulesNamesList.append("Semestr 2")}
        if (semestr3.count>0){modulesList.append(semestr3); modulesNamesList.append("Semestr 3")}
        if (semestr4.count>0){modulesList.append(semestr4); modulesNamesList.append("Semestr 4")}
        if (semestr5.count>0){modulesList.append(semestr5); modulesNamesList.append("Semestr 5")}
        if (semestr6.count>0){modulesList.append(semestr6); modulesNamesList.append("Semestr 6")}
        if (semestr7.count>0){modulesList.append(semestr7); modulesNamesList.append("Semestr 7")}
        if (semestr8.count>0){modulesList.append(semestr8); modulesNamesList.append("Semestr 8")}
        if (semestr9.count>0){modulesList.append(semestr9); modulesNamesList.append("Semestr 9")}
        if (semestr10.count>0){modulesList.append(semestr10); modulesNamesList.append("Semestr 10")}
        if (semestr0.count>0){modulesList.append(semestr0); modulesNamesList.append("Inne")}
        delegate?.relodData()
        

    }
    
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell:UITableViewCell=tableView.dequeueReusableCell(withIdentifier:cellName)!
        
        cell.textLabel!.text=modulesList[indexPath.section][indexPath.row].name
        
        return cell
        
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return modulesNamesList[section]
    }
    func numberOfSections(in tableView: UITableView) -> Int{
        return modulesList.count
    }
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int{
        return modulesList[section].count
    }

}
