//
//  AGHNavigationController.swift
//  
//
//  Created by Filip Kamiński on 03.08.2018.
//

import UIKit

class AGHNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.barTintColor=AGHColours.getNavigationBarColour()
        let textAttributes = [NSAttributedStringKey.foregroundColor:UIColor.white]
        self.navigationBar.titleTextAttributes = textAttributes
        self.navigationBar.tintColor=UIColor.white
        // Do any additional setup after loading the view.
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
