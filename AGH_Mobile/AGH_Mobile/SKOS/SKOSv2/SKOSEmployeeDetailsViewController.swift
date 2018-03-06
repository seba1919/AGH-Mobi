//
//  SKOSEmployeeDetailsViewController.swift
//  AGH_Mobile
//
//  Created by Filip Kamiński on 17.03.2016.
//  Copyright © 2016 MacKN. All rights reserved.
//

import UIKit

class SKOSEmployeeDetailsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var employee:SKOSEmployee?
    @IBOutlet var tableView: UITableView!
    
    @IBOutlet weak var backBtn: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource=self
        self.tableView.delegate=self
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 300
        
        if let employee=employee{
            SKOS.wyswietlOsobe(employee, vc: self)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
          return 10.0;
    }
   
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view=UIView()
        view.backgroundColor=UIColor.clear
        return view
    }
  
  
    func tableView(_ tableView: UITableView,
        cellForRowAt indexPath: IndexPath) -> UITableViewCell{
            if let employee=employee{
            if (indexPath.section==0){
            let cell:SKOSTableViewCell=tableView.dequeueReusableCell(withIdentifier: "Employee") as! SKOSTableViewCell
                cell.textLabel?.textAlignment = .center
                cell.setLabels(left: "\(employee.employeeName ?? "brak" )"+"\(employee.degree ?? "brak" )", right: "")
         
            return cell
            }
            else if (indexPath.section==1){
                
                if(employee.basicData[indexPath.row].first!.0=="Telefon"){
                    let cell:SKOSPhoneTableViewCell=tableView.dequeueReusableCell(withIdentifier: "PhoneNumber") as! SKOSPhoneTableViewCell
                    cell.setLabels(left: self.employee!.basicData[indexPath.row].first!.0, right: self.employee!.basicData[indexPath.row].first!.1)
                    return cell
              
                }else if(self.employee!.basicData[indexPath.row].first!.0=="Jednostka"){
                    let cell:SKOSDepartmentTableViewCell=tableView.dequeueReusableCell(withIdentifier: "Department") as! SKOSDepartmentTableViewCell
                    cell.setLabel(left: self.employee!.basicData[indexPath.row].first!.0, right: self.employee!.basicData[indexPath.row].first!.1)
                    return cell
                    
                }
                let cell:SKOSTableViewCell=tableView.dequeueReusableCell(withIdentifier: "Employee") as! SKOSTableViewCell
                cell.setLabels(left: self.employee!.basicData[indexPath.row].first!.0, right:self.employee!.basicData[indexPath.row].first!.1)
               
                return cell
            }
            
            else if (indexPath.section==2){
               
                if(employee.additionalData[indexPath.row].first!.0=="E-mail"){
                    let cell:SKOSMailTableViewCell=tableView.dequeueReusableCell(withIdentifier: "Mail") as! SKOSMailTableViewCell
                    cell.setLabels(left: self.employee!.additionalData[indexPath.row].first!.0, right: self.employee!.additionalData[indexPath.row].first!.1)
                    return cell
                }else if(employee.additionalData[indexPath.row].first!.0=="Dodatkowy telefon"){
                    let cell:SKOSPhoneTableViewCell=tableView.dequeueReusableCell(withIdentifier: "PhoneNumber") as! SKOSPhoneTableViewCell
                    cell.setLabels(left: self.employee!.additionalData[indexPath.row].first!.0, right: self.employee!.additionalData[indexPath.row].first!.1)
                    return cell
                }else if(employee.additionalData[indexPath.row].first!.0=="Inne"){
                    let cell:SKOSDepartmentTableViewCell=tableView.dequeueReusableCell(withIdentifier: "Department") as! SKOSDepartmentTableViewCell
                    cell.setLabel(left: self.employee!.additionalData[indexPath.row].first!.0, right: self.employee!.additionalData[indexPath.row].first!.1)
                    return cell
                    
                }
                let cell:SKOSTableViewCell=tableView.dequeueReusableCell(withIdentifier: "Employee") as! SKOSTableViewCell
                cell.setLabels(left: self.employee!.additionalData[indexPath.row].first!.0, right:self.employee!.additionalData[indexPath.row].first!.1)
                return cell
                }
            
            else{
                    if(employee.jobTitle[indexPath.row].first!.0=="Telefon"){
                        let cell:SKOSPhoneTableViewCell=tableView.dequeueReusableCell(withIdentifier: "PhoneNumber") as! SKOSPhoneTableViewCell
                        cell.setLabels(left: self.employee!.jobTitle[indexPath.row].first!.0, right: self.employee!.jobTitle[indexPath.row].first!.1)
                        return cell
                        
                    }else if(employee.jobTitle[indexPath.row].first!.0=="Jednostka"){
                        let cell:SKOSDepartmentTableViewCell=tableView.dequeueReusableCell(withIdentifier: "Department") as! SKOSDepartmentTableViewCell
                        cell.setLabel(left: self.employee!.jobTitle[indexPath.row].first!.0, right: self.employee!.jobTitle[indexPath.row].first!.1)
                        return cell
                        
                    }
                    let cell:SKOSTableViewCell=tableView.dequeueReusableCell(withIdentifier: "Employee") as! SKOSTableViewCell
                cell.setLabels(left: employee.jobTitle[indexPath.row].first!.0, right:employee.jobTitle[indexPath.row].first!.1)
                    
                    return cell
                }
            }
            
        
            return UITableViewCell()
    }
    

    
    func numberOfSections(in tableView: UITableView) -> Int{
           if let employee=employee{
             var count=1;
        
                if((employee.basicData).count>0){
                        count += 1
                    }
                if((employee.additionalData).count>0){
                        count += 1
                    }
                    if((employee.jobTitle).count>0){
                        count += 1
                    }
            
            return count;
            }
        
        return 0
        }
    func tableView(_ tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int{
         if let employee=employee{
            if (section==0){
                return 1
            }
            else if (section==1){
                return employee.basicData.count
                
            }else if (section==2){
                return employee.additionalData.count
                
            }
            else if (section==3){
                return employee.jobTitle.count
            }
        }
        
            return 0
            
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func showIt(employee:SKOSEmployee){
        self.employee = employee
        SKOS.wyswietlOsobe(employee, vc: self)
    }
    
    func reloadData(){
        viewWillAppear(true)
        self.tableView.reloadData()
    }
    

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
