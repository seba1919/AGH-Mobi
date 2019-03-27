//
//  SyllabusFacultyListCollectionViewController.swift
//  AGH_Mobile
//
//  Created by Filip Kamiński on 05.08.2018.
//  Copyright © 2018 mackn. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class SyllabusFacultyListCollectionViewController: UICollectionViewController,UICollectionViewDelegateFlowLayout {
    @IBOutlet weak var year: UIBarButtonItem!
    let itemsPerRow: CGFloat = 3
    let sectionInsets = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)

    var list=[

        Department(shortcut: "WMS",name: "Matematyki Stosowanej",image: #imageLiteral(resourceName: "csm_wydzial_matematyki_stosowanej_agh_logo_98bcbc30da")),
        Department(shortcut: "WH",name: "Humanistyczny",image: #imageLiteral(resourceName: "wydzial_humanistyczny_agh_logo")),
        Department(shortcut: "WIMiIP",name: "Inżynierii Metali i Informatyki Przemysłowej",image: #imageLiteral(resourceName: "logo_wimip_")),
        Department(shortcut: "WEiP",name: "Energetyki i Paliw",image: #imageLiteral(resourceName: "weip_agh_logo_01")),
        Department(shortcut: "WZ",name: "Zarządzania",image: #imageLiteral(resourceName: "agh_wydzial_zarzadzania_logo")),
        Department(shortcut:"WGGiIŚ",name: "Geodezji Górniczej i Inżynierii Środowiska",image: #imageLiteral(resourceName: "wggiis_agh_logo")),
        Department(shortcut: "WMN",name: "Metali Nieżelaznych",image: #imageLiteral(resourceName: "wmn_agh_logo_01")),
        Department(shortcut: "WEAIiIB",name: "Elektrotechniki Automatyki, Informatyki i Inżynierii Biomedycznej",image: #imageLiteral(resourceName: "weaiiib_agh_logo_01")),
        Department(shortcut: "WIMiR",name: "Inżynierii Mechanicznej i Robotyki",image: #imageLiteral(resourceName: "wimir_agh_logo_01")),
        Department(shortcut: "WIEiT",name: "Informatyki, Elektroniki i Telekomunikacji",image: #imageLiteral(resourceName: "csm_wiet_agh_logo_53ec904dca")),
        Department(shortcut: "WGiG",name: "Górnictwa i Geoinżynierii",image: #imageLiteral(resourceName: "wgig_agh_logo_01")),
        Department(shortcut: "WGGiOŚ",name: "Geologii, Geofizyki i Ochrony Środowiska",image: #imageLiteral(resourceName: "logo_ggios")),
        Department(shortcut: "WWNiG",name: "Wiertnictwa, Nafty i Gazu",image: #imageLiteral(resourceName: "csm_wwnig_agh_logo_6d8a16aa5a")),
        Department(shortcut: "WIMiC",name: "Inżynierii Materiałowej i Ceramiki",image: #imageLiteral(resourceName: "wimic_agh_logo")),
        Department(shortcut: "WFiIS",name: "Fizyki i Informatyki Stosowanej",image: #imageLiteral(resourceName: "wfiis_agh_logo")),
        Department(shortcut: "WO",name: "Odlewnictwa",image: #imageLiteral(resourceName: "wo_agh_logotyp_"))

    ].sorted(by: {$0.shortcut!<$1.shortcut!})
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title="Syllabus"
        year.title=UserData.year
        navigationItem.title=title
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func changeYear(_ sender: UIBarButtonItem) {
        
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     if let controler=segue.destination as? DegreeListViewController{
        var url=(sender as! SyllabusFacultyCollectionViewCell).textLabel.text!.lowercased()
        url = url.replacingOccurrences(of: "ś", with: "s")
        controler.url=url
     }
    }
 

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell=collectionView.dequeueReusableCell(withReuseIdentifier: "Faculty", for: indexPath) as! SyllabusFacultyCollectionViewCell
        cell.textLabel.text=list[indexPath.row].shortcut?.uppercased()
        cell.imageView.image=list[indexPath.row].image
        return cell
    }
    

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        //2
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = view.frame.width + paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    //3
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    // 4
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
    
    
}
