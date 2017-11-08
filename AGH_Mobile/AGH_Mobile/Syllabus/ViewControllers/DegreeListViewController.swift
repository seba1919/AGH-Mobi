//
//  FacultyListViewController.swift
//  AGH_Mobile_2.0
//
//  Created by Filip Kamiński on 05.04.2017.
//  Copyright © 2017 MacKN. All rights reserved.
//

import UIKit

class DegreeListViewController: SyllabusViewController, SyllabusViewControllerProtocol , UITableViewDelegate{
    
    var url:String?
    
    var degreeList:DegreeTableViewDataSource?
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url=url{
        degreeList=DegreeTableViewDataSource(url:url)
       
        tableView.dataSource=degreeList
        tableView.delegate=self
        degreeList?.delegate=self
        degreeList?.getData()
        }

        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        degreeList?.delegate=self
           degreeList?.getData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func relodData() {
        tableView.reloadData()
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let list = degreeList else{
            print("Segway Error")
            return
        }
        if let controler=segue.destination as? ModuleViewController{
            controler.degree=list.list[self.tableView.indexPath(for: sender as! UITableViewCell)!.section][self.tableView.indexPath(for: sender as! UITableViewCell)!.row]
        }
    }

}
