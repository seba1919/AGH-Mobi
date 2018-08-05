//
//  ModuleActivityViewController.swift
//  AGH_Mobile
//
//  Created by Filip Kamiński on 05.08.2018.
//  Copyright © 2018 mackn. All rights reserved.
//

import UIKit

class ModuleActivityViewController: UITableViewController {

    @IBOutlet weak var timeCell: UITableViewCell!
    @IBOutlet weak var descriptionCell: UITableViewCell!
    var moduleDetails:ModuleActivity?
    
    func showData(){
        guard let data=moduleDetails else{return}
        navigationItem.title=moduleDetails?.type
        timeCell.textLabel?.text="\(data.hours ?? 0) godzin"
        guard let topics=data.classesTopic, let description=data.classesDescription else{return }
        descriptionCell.textLabel?.text=topics+"\n \n" + description
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        showData()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        showData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
