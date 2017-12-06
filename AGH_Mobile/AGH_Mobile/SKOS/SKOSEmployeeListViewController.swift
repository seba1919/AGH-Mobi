//
//  SKOSEmployeeListViewController.swift
//  AGH_Mobile
//
//  Created by Filip Kamiński on 16.03.2016.
//  Copyright © 2016 MacKN. All rights reserved.
//

import UIKit

class SKOSEmployeeListViewController: UIViewController, UITableViewDelegate,UITableViewDataSource{
    var EmployeeList:[SKOSEmployee]=[]
    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate=self
        tableView.dataSource=self
        // Do any additional setup after loading the view.
    }
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView,
        cellForRowAt indexPath: IndexPath) -> UITableViewCell{
            let cell:UITableViewCell=tableView.dequeueReusableCell(withIdentifier: "Skos")!
            cell.textLabel!.text=self.EmployeeList[indexPath.row].employeeName!+self.EmployeeList[indexPath.row].degree!
            return cell
            
    }
    
    func numberOfSections(in tableView: UITableView) -> Int{
        return 1
    }
    func tableView(_ tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int{
            return self.EmployeeList.count
    }
    
    
    
    

   
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if ((sender! as AnyObject).isKind(of: UITableViewCell.self)){
            let vc=segue.destination as! SKOSEmployeeDetailsViewController
            vc.employee=self.EmployeeList[self.tableView.indexPath(for: sender as! UITableViewCell)!.row]
        }
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
   

}
