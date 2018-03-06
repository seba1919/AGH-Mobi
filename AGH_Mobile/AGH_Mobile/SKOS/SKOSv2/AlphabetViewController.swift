//
//  AlphabetViewController.swift
//  AGH_Mobile
//
//  Created by Kamil Szelag on 1/5/18.
//  Copyright © 2018 mackn. All rights reserved.
//

import UIKit

class AlphabetViewController: UITableViewController {
    
    var letter:String=""
    var result = [SKOSEmployee]()
    var shouldGo:Bool = false;
    var res:SKOSEmployee = SKOSEmployee();
    var skos = SKOS()
    var error:Bool = false;
    
    @IBOutlet weak var backBtn: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return result.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "alphabetCell", for: indexPath)
        cell.textLabel?.text = result[indexPath.row].employeeName;
        return cell
    }
    
    
    
    override func shouldPerformSegue(withIdentifier identifier: String?, sender: Any?)-> Bool {
        
        if(error){
            return false;
        }
        if(shouldGo){
            return true;
        } else {
            shouldGo = true
            let indexPath = tableView.indexPathForSelectedRow
            let value = result[indexPath!.row]
            var skos = Skos2()
            let fullName = value.employeeName
            if let fullName=fullName{
                let arr = fullName.characters.split{$0 == " "}.map(String.init)
                print("\(arr[0])")
                let imie = arr[1].replacingOccurrences(of: ",", with: "")
                print("\(imie)")
                skos.searchPerson(imie, nazwisko: arr[0], degree: "", viewController: self)
            }
            //performSegue(withIdentifier: "GO", sender: nil)
            return false;
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(!error){
        let ctrl = segue.destination as! SKOSEmployeeDetailsViewController
        shouldGo = false;
        ctrl.employee = res
        } else {
            error = false;
            shouldGo = false;
        }
        let backItem = UIBarButtonItem()
        backItem.title = "Wstecz"
        self.navigationItem.backBarButtonItem = backItem
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
//    func showIt(employeeTable:[SKOSEmployee]){
//        result = employeeTable
//        viewWillAppear(true)
//        //let indexPathForSection = NSIndexSet(index: 0)
//        self.tableView.reloadData()
//    }
    
    

    

}
