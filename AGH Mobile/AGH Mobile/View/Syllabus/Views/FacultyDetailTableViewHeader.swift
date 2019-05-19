//
//  FacultyDetailTableViewHeader.swift
//  AGH Mobile
//
//  Created by Bartosz Kunat on 19/05/2019.
//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.
//

import UIKit
import SnapKit

class FacultyDetailTableViewHeader: UITableViewHeaderFooterView {
    
    private struct Constants {
        static let horizontalPadding: CGFloat = 48
        static let horizontalSpacing: CGFloat = 10
        static let verticalPadding: CGFloat = 16
        static let verticalSpacing: CGFloat = 2
        
        // Font sizes
        static let titleFontSize: CGFloat = 30
        static let subtitleFontSize: CGFloat = 14
    }
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Static properties
    
    static let reuseIdentifier: String = {
        return String.init(describing: self)
    }()
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Instance properties
    
    
    // Only first seciton has faculty name label
    var isFirstSectionHeader = false {
        didSet {
            setUpView(forFirstSection: isFirstSectionHeader)
        }
    }
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - UI components
    
    var titleLbl: UILabel!
    var subtitleLbl: UILabel!
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Init
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - View setup
    
    private func setUpView(forFirstSection: Bool) {
        
        // Subtitle label
        subtitleLbl = UILabel()
        subtitleLbl.textColor = .customGrayText
        subtitleLbl.font = UIFont.systemFont(ofSize: Constants.subtitleFontSize, weight: .regular)
        subtitleLbl.numberOfLines = 0
        addSubview(subtitleLbl)
        
        // Only the first section has a titleLbl
        if forFirstSection {
            
            // Title label
            titleLbl = UILabel()
            titleLbl.textColor = .mainRed
            titleLbl.numberOfLines = 0
            titleLbl.font = UIFont.systemFont(ofSize: Constants.titleFontSize, weight: .bold)
            addSubview(titleLbl)
            titleLbl.snp.makeConstraints { (make) in
                make.left.equalToSuperview().offset(Constants.horizontalPadding)
                make.right.equalToSuperview().offset(-Constants.horizontalPadding)
                make.top.equalToSuperview().offset(Constants.verticalPadding)
            }
            
            subtitleLbl.snp.makeConstraints { (make) in
                make.top.equalTo(titleLbl.snp.bottom).offset(Constants.verticalSpacing)
                make.bottom.equalToSuperview().offset(-Constants.verticalPadding)
                make.right.equalToSuperview().offset(-Constants.horizontalPadding)
                make.left.equalToSuperview().offset(Constants.horizontalPadding)
            }
        } else {
            subtitleLbl.snp.makeConstraints { (make) in
                make.top.equalToSuperview().offset(Constants.verticalSpacing)
                make.bottom.equalToSuperview().offset(-Constants.verticalPadding)
                make.right.equalToSuperview().offset(-Constants.horizontalPadding)
                make.left.equalToSuperview().offset(Constants.horizontalPadding)
            }
        }
    }
}
