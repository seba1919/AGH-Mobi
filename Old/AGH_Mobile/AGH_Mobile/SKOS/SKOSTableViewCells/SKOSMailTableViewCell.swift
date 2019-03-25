//
//  SKOSMailTableViewCell.swift
//  AGH_Mobile
//
//  Created by Filip Kamiński on 24.03.2016.
//  Copyright © 2016 MacKN. All rights reserved.
//

import UIKit

class SKOSMailTableViewCell: UITableViewCell {

    @IBOutlet var leftLabel: UILabel!
    @IBOutlet weak var mailButton: UIButton!
    private var mail:String?
    
    
    func setLabels(left:String?,right:String?){
        leftLabel.text=left
        mail=right
        mailButton.setTitle(right, for: .normal)
        mailButton.isUserInteractionEnabled = true;

    }
    
    @IBAction func newEmali(_ sender: AnyObject) {
        if let mail=mail{
            if let url = URL(string: "mailto://\(mail)") {
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
