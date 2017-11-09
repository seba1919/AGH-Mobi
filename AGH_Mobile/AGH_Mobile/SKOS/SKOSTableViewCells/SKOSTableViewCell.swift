//
//  SKOSTableViewCell.swift
//  AGH_Mobile
//
//  Created by Filip Kamiński on 25.03.2016.
//  Copyright © 2016 MacKN. All rights reserved.
//

import UIKit

class SKOSTableViewCell: UITableViewCell {

    @IBOutlet var leftLabel: UILabel!
    @IBOutlet var rightLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setLabels(left:String?,right:String?){
        leftLabel.text=left
        rightLabel.text=right
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
