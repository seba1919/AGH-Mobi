//
//  ModuleDetailsViewController.swift
//  AGH_Mobile_2.0
//
//  Created by Filip Kamiński on 05.04.2017.
//  Copyright © 2017 MacKN. All rights reserved.
//

import UIKit

class ModuleDetailsViewController: SyllabusViewController, SyllabusViewControllerProtocol{
    var module:Module?
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
self.loadData()
        // Do any additional setup after loading the view.
    }
    func loadData(){
        titleLabel.text=module?.name
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func relodData() {
       // tableView.reloadData()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
