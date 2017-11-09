//
//  SKOSPhoneTableViewCell.swift
//  AGH_Mobile
//
//  Created by Filip Kamiński on 24.03.2016.
//  Copyright © 2016 MacKN. All rights reserved.
//

import UIKit

class SKOSPhoneTableViewCell: UITableViewCell {
    @IBOutlet var leftLabel: UILabel!
    @IBOutlet weak var numberButton: UIButton!
    private var number:String?

    
    func setLabels(left:String?,right:String?){
        leftLabel.text=left
        number=right
        numberButton.setTitle(right, for: .normal)
        numberButton.isUserInteractionEnabled=true
        

        

    
        
    }
    @IBAction func callSomebody(_ sender: AnyObject) {
        if let number=number{
            if let url = URL(string: "tel://\(number.replacingOccurrences(of: " ", with: ""))"){
                UIApplication.shared.openURL(url)
            }
        }
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
