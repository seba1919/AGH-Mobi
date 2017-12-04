//
//  DegreeTableViewDataSource.swift
//  AGH_Mobile_2.0
//
//  Created by Filip Kamiński on 05.04.2017.
//  Copyright © 2017 MacKN. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
class DegreeTableViewDataSource: SyllabusDataSource,UITableViewDataSource {
   
    var list:[[Degree]]=[]
    var nameList:[String]=[]
    var delegate:SyllabusViewControllerProtocol?
    var cellName="Degree_Cell"
    var slag:String?
    init(url:String){
        slag=url
        
    }
 
    
    func getData(){
        guard let validUrl = slag else{
            print("Error with syllabus Department URL, Degree Table View Data Source")
            return
    }
        
        guard let url = URL(string: "https://syllabuskrk.agh.edu.pl/\(year)/magnesite/api/faculties/\(validUrl)/study_plans".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!) else {return}
       
        Alamofire.request(url, headers: ["Accept":"application/vnd.syllabus.agh.edu.pl.v2+json", "Accept-Language":language]).responseJSON{ response in
            
                        switch response.result {
                        case .success:
                        self.handleJSON(response: response.result.value)
                        case .failure(let error):
                            self.handleError(error: error)
                        }
            
        }
    }
    
    
    
   private func handleJSON(response:Any?){
        guard let responseData = response else{
            handleJSONerror()
            return
        }
        var json = JSON(responseData)["syllabus"]

    
    
        var StacjonarneIstopnia:[Degree]=[]
        var StacjonarneIIstopnia:[Degree]=[]
        var StacjonarneIIIstopnia:[Degree]=[]
        var NieStacjonarneIstopnia:[Degree]=[]
        var NieStacjonarneIIstopnia:[Degree]=[]
        let S1=json["study_types"][0]["levels"][0]["study_programmes"]
        let N1=json["study_types"][1]["levels"][0]["study_programmes"]
        let S2=json["study_types"][0]["levels"][1]["study_programmes"]
        let N2=json["study_types"][1]["levels"][1]["study_programmes"]
        let S3=json["study_types"][0]["levels"][2]["study_programmes"]
        
        for (_,elements):(String, JSON) in S1{
            StacjonarneIstopnia.append(Degree(name: elements["name"].stringValue, syllabusName: elements["url"].stringValue,department:slag))
        }
        for (_,elements):(String, JSON) in S2{
            StacjonarneIIstopnia.append(Degree(name: elements["name"].stringValue, syllabusName: elements["url"].stringValue,department:slag))
            
        }
        for (_,elements):(String, JSON) in N1{
            NieStacjonarneIstopnia.append(Degree(name: elements["name"].stringValue, syllabusName: elements["url"].stringValue,department:slag))
            
        }
        for (_,elements):(String, JSON) in N2{
            NieStacjonarneIIstopnia.append(Degree(name: elements["name"].stringValue, syllabusName: elements["url"].stringValue,department:slag))
            
        }
        for (_,elements):(String, JSON) in S3{
            StacjonarneIIIstopnia.append(Degree(name: elements["name"].stringValue, syllabusName: elements["url"].stringValue,department:slag))
            
        }

        if (StacjonarneIstopnia.count>0) {list.append(StacjonarneIstopnia);nameList.append("Stacjonarne I stopnia")}
        if (StacjonarneIIstopnia.count>0){list.append(StacjonarneIIstopnia);nameList.append("Stacjonarne II stopnia")}
        if (StacjonarneIIIstopnia.count>0){list.append(StacjonarneIIIstopnia);nameList.append("Stacjonarne III stopnia")}
        if (NieStacjonarneIstopnia.count>0){list.append(NieStacjonarneIstopnia);nameList.append("Niestacjonarne I stopnia")}
        if (NieStacjonarneIIstopnia.count>0){list.append(NieStacjonarneIIstopnia);nameList.append("Niestacjonarne II stopnia")}
    
        if let deleg=delegate{
            deleg.relodData()
        }else{
            delegateNotSet()
        }
    }


    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell:UITableViewCell=tableView.dequeueReusableCell(withIdentifier: cellName)!
        
        cell.textLabel!.text=list[indexPath.section][indexPath.row].name
        return cell
        
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return nameList[section]
    }
    func numberOfSections(in tableView: UITableView) -> Int{
        return list.count
    }
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int{
        return list[section].count
    }
    

}
