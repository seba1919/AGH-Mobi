//
//  SKOSDepartmentTableViewCell.swift
//  AGH_Mobile
//
//  Created by Filip Kamiński on 24.03.2016.
//  Copyright © 2016 MacKN. All rights reserved.
//

import UIKit

class SKOSDepartmentTableViewCell: UITableViewCell {

    @IBOutlet var leftLabel: UILabel!
    @IBOutlet var departmentLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setLabel(left:String?,right:String?){
        leftLabel.text=left
        departmentLabel.text=right
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
