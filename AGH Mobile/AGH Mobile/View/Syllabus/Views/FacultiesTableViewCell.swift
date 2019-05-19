//
//  FacultiesTableViewCell.swift
//  AGH Mobile
//
//  Created by Bartosz Kunat on 19/05/2019.
//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.
//

// ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
// MARK: - Import

import UIKit
import SnapKit

// ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
// MARK: - Implementation

class FacultiesTableViewCell: UITableViewCell {
    
    private struct Constants {
        static let horizontalPadding: CGFloat = 20
        static let horizontalSpacing: CGFloat = 10
        static let verticalPadding: CGFloat = 20
        static let verticalSpacing: CGFloat = 10
    }
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Static Variables
    
    static let reuseIdentifier: String = {
        return String.init(describing: self)
    }()
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - UI components
    
    var titleLbl: UILabel!
    var subtitleLbl: UILabel!
    private var arrowImageView: UIImageView!
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUpView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - View setup methods
    
    private func setUpView() {
        
        // Right arrow image view
        arrowImageView = UIImageView(image: #imageLiteral(resourceName: "arrow_right"))
        arrowImageView.contentMode = .scaleAspectFit
        addSubview(arrowImageView)
        arrowImageView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(Constants.verticalPadding)
            make.bottom.equalToSuperview().offset(-Constants.verticalPadding)
            make.right.equalToSuperview().offset(-Constants.horizontalPadding)
        }
        
        // Title label
        titleLbl = UILabel()
        titleLbl.textColor = .mainRed
        titleLbl.font = UIFont.preferredFont(forTextStyle: .headline)
        addSubview(titleLbl)
        titleLbl.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(Constants.verticalPadding)
            make.right.lessThanOrEqualTo(arrowImageView.snp.left).offset(-Constants.horizontalPadding)
            make.top.equalToSuperview().offset(Constants.verticalPadding)
        }
        
        // Subtitle label
        subtitleLbl = UILabel()
        subtitleLbl.textColor = .customGrayText
        subtitleLbl.font = UIFont.preferredFont(forTextStyle: .body)
        addSubview(subtitleLbl)
        subtitleLbl.snp.makeConstraints { (make) in
            make.top.equalTo(titleLbl.snp.bottom).offset(Constants.verticalSpacing)
            make.bottom.lessThanOrEqualToSuperview().offset(-Constants.verticalPadding)
            make.leading.equalTo(titleLbl.snp.leading)
            make.right.lessThanOrEqualTo(arrowImageView.snp.left).offset(-Constants.horizontalSpacing)
        }
    }
}

