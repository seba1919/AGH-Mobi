
//  SKOSViewController.swift
//  AGH_Mobile
//
//  Created by Filip Kamiński on 10.03.2016.
//  Copyright © 2016 MacKN. All rights reserved.
//

import UIKit

class SKOSViewController: UIViewController, UITableViewDelegate, UIPickerViewDataSource,UIPickerViewDelegate {
       let titles=[["wszystkie":-1],["brak":1],["inż,":8],["dypl. ek.":7],["mgr":9],["mgr inż.":10],["mgr inż. arch.":11],["dr":2],["dr inż.":5],["dr hab.":3],["dr hab. inż":4],["dr inż. architek":6],["prof.":20],["prof. dr hab.":12],["prof. dr hab. inż.":13],["prof. nadzw. dr hab.":15],["prof. nadzw. dr hab. inż.":16],["prof. zw. dr inż":19],["prof. zw. dr hab.":17],["prof. zw. dr hab. inż":18],["licencjat":24],["dr n. techn. lek. med.":22]]
    @IBOutlet var degreeField: UITextField!
    @IBOutlet var nameFiel: UITextField!
    @IBOutlet var surnameField: UITextField!
    var titleNumber:String!=""
    var skos=SKOS()
    override func viewDidAppear(_ animated: Bool) {
       degreeField.text=""
       surnameField.text=""
       nameFiel.text=""

    }
    override func viewDidLoad() {
        
        super.viewDidLoad()

        let picker: UIPickerView = UIPickerView();
        
        picker.delegate = self;
        picker.dataSource = self;
        degreeField.inputView=picker
    
        // Do any additional setup after loading the view.
    }
    
    @IBAction func search(_ sender: AnyObject) {
        view.endEditing(true)
        if (nameFiel.text==nil){
            nameFiel.text=""
        }
        if (surnameField.text==nil){
            surnameField.text=""
        }
        if (degreeField.text==nil){
            degreeField.text=""
        }
        skos.search(nameFiel.text!, nazwisko: surnameField.text!, degree:titleNumber!,viewController: self)
        
    }
   


    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfComponents( in pickerView: UIPickerView) -> Int{
        return 1
        
    }
    func pickerView( _ pickerView: UIPickerView,
        numberOfRowsInComponent component: Int) -> Int{
            return titles.count
            
    }
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let titleData = titles[row].first!.0
        let myTitle = NSAttributedString(string: titleData, attributes: [NSAttributedStringKey.font:UIFont.systemFont(ofSize: 10.0),NSAttributedStringKey.foregroundColor:UIColor.black])
        return myTitle
    }
    func pickerView( _ pickerView: UIPickerView,
        didSelectRow row: Int,
        inComponent component: Int){
            degreeField.text=String(titles[row].first!.0)
            if (titles[row].first!.1 != -1){
            titleNumber=String(titles[row].first!.1)
            }else{
             titleNumber=""
            }
            
    }
    
  



  
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     
        if(segue.identifier! == "EmployeeList"){
            let vc=segue.destination as! SKOSEmployeeListViewController
            vc.EmployeeList=sender as! [SKOSEmployee]
        }else if(segue.identifier! == "Details"){
            let vc=segue.destination as! SKOSEmployeeDetailsViewController
            vc.employee=SKOSEmployee(_link:String(describing: sender as! URL))

            
        }
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
