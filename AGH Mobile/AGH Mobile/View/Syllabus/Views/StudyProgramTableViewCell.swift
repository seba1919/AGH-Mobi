//
//  StudyProgramTableViewCell.swift
//  AGH Mobile
//
//  Created by Bartosz Kunat on 20/05/2019.
//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.
//

import UIKit

class StudyProgramTableViewCell: UITableViewCell {

    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Static Variables
    
    static let reuseIdentifier: String = {
        return String.init(describing: self)
    }()
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Init
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

// ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
// MARK: - Delete this when view model for Syllabus is available

struct StudyProgramTableViewCellDummyViewModel {
    let ects: Int
    let courseName: String
    let courseType: String
    let totalHours: Int
    let hasExam: Bool
}
