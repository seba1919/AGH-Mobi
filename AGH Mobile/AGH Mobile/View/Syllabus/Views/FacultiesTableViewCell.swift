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
        static let horizontalPadding: CGFloat = 48
        static let horizontalSpacing: CGFloat = 10
        static let verticalPadding: CGFloat = 16
        static let verticalSpacing: CGFloat = 2
        
        // Font sizes
        static let titleFontSize: CGFloat = 30
        static let subtitleFontSize: CGFloat = 14
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
    // MARK: - Instance porperties
    
    var viewModel: FacultiesTableViewCellDummyViewModel! {
        didSet {
            titleLbl.text = viewModel.title
            titleLbl.sizeToFit()
            subtitleLbl.text = viewModel.subtitle
            subtitleLbl.sizeToFit()
        }
    }
    
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
            make.right.equalToSuperview().offset(-Constants.horizontalPadding / 2)
            make.width.equalTo(arrowImageView.frame.width)
        }
        
        // Title label
        titleLbl = UILabel()
        titleLbl.textColor = .mainRed
        titleLbl.numberOfLines = 0
        titleLbl.font = UIFont.systemFont(ofSize: Constants.titleFontSize, weight: .semibold)
        addSubview(titleLbl)
        titleLbl.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(Constants.horizontalPadding)
            make.right.lessThanOrEqualTo(arrowImageView.snp.left).offset(-Constants.horizontalPadding)
            make.top.equalToSuperview().offset(Constants.verticalPadding)
        }
        
        // Subtitle label
        subtitleLbl = UILabel()
        subtitleLbl.textColor = .customGrayText
        subtitleLbl.font = UIFont.systemFont(ofSize: Constants.subtitleFontSize, weight: .regular)
        subtitleLbl.numberOfLines = 0
        addSubview(subtitleLbl)
        subtitleLbl.snp.makeConstraints { (make) in
            make.top.equalTo(titleLbl.snp.bottom).offset(Constants.verticalSpacing)
            make.bottom.lessThanOrEqualToSuperview().offset(-Constants.verticalPadding)
            make.leading.equalTo(titleLbl.snp.leading)
            make.right.lessThanOrEqualTo(arrowImageView.snp.left).offset(-Constants.horizontalSpacing)
        }
    }
}

// ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
// MARK: - Delete this when view model for Syllabus will be available

struct FacultiesTableViewCellDummyViewModel {
    let title: String
    let subtitle: String
}
