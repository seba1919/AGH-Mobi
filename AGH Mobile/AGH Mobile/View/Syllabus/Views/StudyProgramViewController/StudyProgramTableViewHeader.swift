//
//  StudyProgramTableViewHeader.swift
//  AGH Mobile
//
//  Created by Bartosz Kunat on 20/05/2019.
//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.
//

import UIKit

class StudyProgramTableViewHeader: UITableViewHeaderFooterView {
    
    private struct Constants {
        static let horizontalPadding: CGFloat = 24
        static let verticalPadding: CGFloat = 12
        
        // Font sizes
        static let subtitleFontSize: CGFloat = 14
    }
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Static properties
    
    static let reuseIdentifier: String = {
        return String.init(describing: self)
    }()
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Instance properties
    
    var sectionTitle: String? {
        didSet {
            subtitleLbl.text = sectionTitle
            subtitleLbl.sizeToFit()
        }
    }
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - UI components
    
    var subtitleLbl: UILabel!
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Init
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        backgroundColor = .white
        setUpView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - View setup
    
    private func setUpView() {
        // Subtitle label
        subtitleLbl = UILabel()
        subtitleLbl.textColor = .customGrayText
        subtitleLbl.font = UIFont.systemFont(ofSize: Constants.subtitleFontSize, weight: .regular)
        subtitleLbl.numberOfLines = 0
        addSubview(subtitleLbl)
        
        // Only the first section has a titleLbl
        subtitleLbl.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(Constants.verticalPadding)
            make.bottom.equalToSuperview().offset(-Constants.verticalPadding).priority(.medium)
            make.right.equalToSuperview().offset(-Constants.horizontalPadding)
            make.left.equalToSuperview().offset(Constants.horizontalPadding)
        }
    }
}
