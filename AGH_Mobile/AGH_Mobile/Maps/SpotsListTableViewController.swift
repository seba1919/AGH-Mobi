//
//  SpotsListTableViewController.swift
//  AGH_Mobile
//
//  Created by patrycja on 17.11.2017.
//  Copyright © 2017 mackn. All rights reserved.
//

import UIKit

class SpotsListTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var spotType: String = ""
    var listOfSpots: [Spot] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (spotType == "Wydziały" || spotType == "Akademiki") {
            listOfSpots = SpotDataSource.getSpotList(spotType: spotType)
        } else {
            listOfSpots = SpotDataSource.sortByLocation(spotsList: SpotDataSource.getSpotList(spotType: spotType),
                                                    userLocation: MapViewController.getCurrentUserLocation())
        }
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

     func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return listOfSpots.count + 1
    }

    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "list", for: indexPath) as! SpotsListTableViewCell

        if (indexPath.row == 0) {
            cell.label.text = "pokaż wszystkie"
        } else {
            cell.label.text = listOfSpots[indexPath.row - 1].name
        }

        return cell
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destController = segue.destination as? MapViewController {
            let choice = (sender as! SpotsListTableViewCell).label.text!
            switch choice {
                case "pokaż wszystkie":
                    destController.spots = listOfSpots
                    destController.spotType = "all"
                default:
                    destController.spots = SpotDataSource.getParticularSpot(spotName: choice)
                    destController.spotType = spotType
            }
        }
    }
 

}
