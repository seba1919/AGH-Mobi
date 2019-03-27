//
//  ModuleViewController.swift
//  AGH_Mobile_2.0
//
//  Created by Filip Kamiński on 05.04.2017.
//  Copyright © 2017 MacKN. All rights reserved.
//

import UIKit

class ModuleViewController: SyllabusViewController,SyllabusViewControllerProtocol,UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    var degree:Degree?
    var modules:ModuleTableViewDataSource?
    override func viewDidLoad() {
        super.viewDidLoad()
        if let degree=degree{
            modules=ModuleTableViewDataSource(DegreeName: degree)
            
            tableView.dataSource=modules
            tableView.delegate=self
            modules?.delegate=self
            modules?.getData()
        }
        title="Przedmioty"
        navigationItem.title=title

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func relodData() {
        tableView.reloadData()
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let modules = modules else{
            print("Segway Error")
            return
        }
        if let controler=segue.destination as? ModuleDetailsViewController{
            controler.module=modules.modulesList[self.tableView.indexPath(for: sender as! UITableViewCell)!.section][self.tableView.indexPath(for: sender as! UITableViewCell)!.row]
        }
    }
    
 

}
