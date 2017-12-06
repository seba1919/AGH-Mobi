//
//  DepartmentsList.swift
//  AGH_Mobile_2.0
//
//  Created by Filip Kamiński on 05.04.2017.
//  Copyright © 2017 MacKN. All rights reserved.
//

import UIKit

class DepartmentTableViewDataSource:SyllabusDataSource,UITableViewDataSource{
    var cellName="Department_Cell"
    var list=[
   
        
        Department(shortcut: "WMS",name: "Matematyki Stosowanej"),
        Department(shortcut: "WH",name: "Humanistyczny"),
        Department(shortcut: "WIMiIP",name: "Inżynierii Metali i Informatyki Przemysłowej"),
        Department(shortcut: "WEiP",name: "Energetyki i Paliw"),
        Department(shortcut: "WZ",name: "Zarządzania"),
        Department(shortcut:"WGGiIŚ",name: "Geodezji Górniczej i Inżynierii Środowiska"),
        Department(shortcut: "WMN",name: "Metali Nieżelaznych"),
        Department(shortcut: "WEAIiIB",name: "Elektrotechniki Automatyki, Informatyki i Inżynierii Biomedycznej"),
        Department(shortcut: "WIMiR",name: "Inżynierii Mechanicznej i Robotyki"),
        Department(shortcut: "WIEiT",name: "Informatyki, Elektroniki i Telekomunikacji"),
        Department(shortcut: "WGiG",name: "Górnictwa i Geoinżynierii"),
        Department(shortcut: "WGGiOŚ",name: "Geologii, Geofizyki i Ochrony Środowiska"),
        Department(shortcut: "WWNiG",name: "Wiertnictwa, Nafty i Gazu"),
        Department(shortcut: "WIMiC",name: "Inżynierii Materiałowej i Ceramiki"),
        Department(shortcut: "WFiIS",name: "Fizyki i Informatyki Stosowanej")
        
        
        
        
        
        
    ]
    
    override init() {
        list=list.sorted(by: {$0.shortcut!<$1.shortcut!})
        
        
    }
    
    
    
    
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell:UITableViewCell=tableView.dequeueReusableCell(withIdentifier: cellName)!
        cell.textLabel?.text=list[indexPath.row].name
        return cell
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int{
        return 1
    }
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int{
        return list.count
        
    }
    
    
    
    
    
    
    
}
