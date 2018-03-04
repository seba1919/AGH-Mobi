//
//  TableViewController.swift
//  AGH_Mobile
//
//  Created by Kamil Szelag on 3/4/18.
//  Copyright © 2018 mackn. All rights reserved.
//

import UIKit

class AlphabetCells:UITableViewCell{
    
    var master:TableViewController = TableViewController()
    var cellElem:CellElements = CellElements()
    var txt:String = ""
    
    @IBAction func btnClick(_ sender: Any) {
        
        if(cellElem.isClicked){
            cellElem.isClicked = false;
            btn.setTitle("Rozwiń", for: .normal)
            master.removeElements(letter: txt)
        }else {
            cellElem.isClicked = true
            btn.setTitle("Zwiń", for: .normal)
            master.addElements(letter: txt)
        }
    }
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var btn: UIButton!

}

class CellElements{
    
    var name:String="";
    var isClicked:Bool = false;
    var isMaster:Bool = false;
    var subElements:Int = 0;
}

class TableViewController: UITableViewController {
    
    var alphabet = [String]()
    var alphabetCell = [CellElements]()
    var alphabetDictionary = [String:[String]]()
    var clickedDict = [String:Bool]()
    let skos = SKOS()
    var isFinished = false;
    var shouldGo:Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        alphabet = ["A","B","C","Ć","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","Z"];
        for i in 0...24 {
            let cell = CellElements()
            cell.name = alphabet[i]
            cell.isClicked = false
            cell.isMaster = true
            alphabetCell.append(cell)
            clickedDict[alphabet[i]] = false
        }
        alphabetDictionary["A"] = ["Ac","Ad","Al","Am","An","Ap","Ar","Au","Av"]
        alphabetDictionary["B"] = ["Ba","Bą","Be","Bę","Bi","Bl","Bł","Bo","Bó","Br","Bu","By","Bz"]
        alphabetDictionary["C"] = ["Ca","Ce","Ch","Ci","Co","Cu","Cy","Cz"]
        alphabetDictionary["Ć"] = ["Ćm","Ćw"]
        alphabetDictionary["D"] = ["Da","Dą","De","Dę","Di","Dl","Dł","Dm","Do","Dr","Du","Dw","Dy","Dz"]
        alphabetDictionary["E"] = ["Ec","Ek","Er","Ew"]
        alphabetDictionary["F"] = ["Fa","Fą","Fe","Fi","Fl","Fo","Fr","Fu"]
        alphabetDictionary["G"] = ["Ga","Gą","Gd","Gę","Gi","Gl","Gł","Gn","Go","Gó","Gr","Gu","Gw"]
        alphabetDictionary["H"] = ["Ha","He","Hl","Hn","Ho","Hr","Hu","Hw","Hy"]
        alphabetDictionary["I"] = ["Id","Ig","Im","In","Is","Iv","Iw","Iz"]
        alphabetDictionary["J"] = ["Ja","Je","Ję","Jo","Jó","Ju"]
        alphabetDictionary["K"] = ["Ka","Ką","Kę","Ki","Kl","Kł","Km","Kn","Ko","Kr","Ks","Ku","Kw","Ky"]
        alphabetDictionary["L"] = ["La","Le","Li","Lo","Lu"]
        alphabetDictionary["M"] = ["Ma","Mą","Mc","Me","Mi","Ml","Mł","Mo","Mó","Mr","Mu","My"]
        alphabetDictionary["N"] = ["Na","Ne","Nę","Ng","Ni","No","Nu","Ny"]
        alphabetDictionary["O"] = ["Ob","Oc","Od","Oe","Ok","Ol","On","Op","Or","Os","Ot","Ow","Oz","Oż"]
        alphabetDictionary["P"] = ["Pa","Pe","Pę","Ph","Pi","Pl","Pł","Po","Pó","Pr","Ps","Pt","Pu","Py"]
        alphabetDictionary["Q"] = ["Qu"]
        alphabetDictionary["R"] = ["Ra","Rą","Re","Rę","Ri","Ro","Ró","Ry","Ry","Rz"]
        alphabetDictionary["S"] = ["Sa","Są","Se","Sę","Sc","Se","Si","Sk","Sł","Sm","Sn","So","Sp","Sr","St","Su","Sv","Sw","Sy","Sz"]
        alphabetDictionary["T"] = ["Ta","Te","Tę","Tk","To","Tr","Ts","Tu","Tw","Ty"]
        alphabetDictionary["U"] = ["Uc","Uh","Ur","Ut","Uz"]
        alphabetDictionary["V"] = ["Va","Vl","Vo"]
        alphabetDictionary["W"] = ["Wa","Wą","Wc","Wd","We","Wę","Wi","Wl","Wł","Wn","Wo","Wó","Wr","Ws","Wś","Wy"]
        alphabetDictionary["Z"] = ["Za","Zą","Zb","Zd","Ze","Zę","Zn","Zi","Zl","Zł","Zm","Zn","Zo","Zu","Zw","Zy"]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alphabet.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! AlphabetCells

        cell.txt = alphabet[indexPath.row]
        cell.master = self
        let cellElem = alphabetCell[indexPath.row]
        cell.cellElem = cellElem
        if(cell.cellElem.isClicked){
            cell.btn.setTitle("Zwiń", for: .normal)
        } else {
            cell.btn.setTitle("Rozwiń", for: .normal)
        }
        if(cell.cellElem.isMaster){
            cell.label1?.text = alphabet[indexPath.row];
            cell.label2?.text = ""
            cell.btn.isHidden = false;
        } else {
            cell.label2?.text = alphabet[indexPath.row];
            cell.label1?.text = ""
            cell.btn.isHidden = true;
        }
        
        return cell
    }
    
    func addElements(letter:String){
        let index:Int? = alphabet.index(of: letter)
        if let index=index{
            clickedDict[letter] = true;
            let array:[String] = alphabetDictionary[letter]!
            
            alphabetCell[index].isClicked = true;
            let size = array.count-1
            alphabetCell[index].subElements = size
            
            for i in 0...size {
                alphabet.insert(array[size-i], at: index+1)
                let cellElem = CellElements()
                cellElem.name = array[size-i]
                cellElem.isMaster = false
                cellElem.isClicked = false;
                alphabetCell.insert(cellElem, at: index+1)
                
                tableView.beginUpdates()
                tableView.insertRows(at: [IndexPath(row: index+1, section: 0)], with: .automatic)
                tableView.endUpdates()
            }
            //let indexPath = IndexPath(row: index+1,section: 0)
            //tableView.insertRows(at: [indexPath], with: .automatic)
        }
    }
    
    func removeElements(letter:String){
        let index:Int? = alphabet.index(of: letter)
        if let index=index{
            
            clickedDict[letter] = false;
            alphabetCell[index].isClicked = false;
            let size = alphabetCell[index].subElements
            
            for _ in 0...size{
                alphabetCell.remove(at: index+1)
                alphabet.remove(at: index+1)
                let indexPath = IndexPath(row: index+1,section: 0)
                tableView.deleteRows(at: [indexPath], with: .automatic)
            }
            
        }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String?, sender: Any?)-> Bool {
        
        let indexPath = tableView.indexPathForSelectedRow!.row
        let value:String = alphabet[indexPath]
        if(identifier == "EmployeeList" && self.shouldGo == true){
            return true
        }
        self.shouldGo = true
        skos.searchByName("", nazwisko: value, degree:"",viewController: self);
        return false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        self.shouldGo = false;
        if(segue.identifier=="EmployeeList"){
            let ctrl = segue.destination as! AlphabetViewController
            ctrl.result = sender as! [SKOSEmployee]
        } else {
            let vc=segue.destination as! SKOSEmployeeDetailsViewController
            vc.employee=SKOSEmployee(_link:String(describing: sender as! URL))
        }
        let backItem = UIBarButtonItem()
        backItem.title = "Wstecz"
        self.navigationItem.backBarButtonItem = backItem
        
    }

}
