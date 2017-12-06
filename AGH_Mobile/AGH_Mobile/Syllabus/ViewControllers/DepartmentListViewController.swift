
//
//  DepartmentListViewController.swift
//  AGH_Mobile_2.0
//
//  Created by Filip Kamiński on 05.04.2017.
//  Copyright © 2017 MacKN. All rights reserved.
//

import UIKit

class DepartmentListViewController: SyllabusViewController, UITableViewDelegate , SyllabusViewControllerProtocol{
    
    @IBOutlet weak var tableView: UITableView!
    let departmentList:DepartmentTableViewDataSource=DepartmentTableViewDataSource()
   
    override func viewDidLoad() {
    
    super.viewDidLoad()
    title="Syllabus"
   
    tableView.dataSource=departmentList
    tableView.delegate=self
    // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controler=segue.destination as? DegreeListViewController{
            controler.url=departmentList.list[tableView.indexPath(for: sender as! UITableViewCell)!.row].shortcut
        }
        
    }
    func relodData() {
        tableView.reloadData()
    }

}
