//
//  FacultyDetailViewControllerTableViewCell.swift
//  AGH Mobile
//
//  Created by Bartosz Kunat on 19/05/2019.
//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.
//

// ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
// MARK: - Imports

import UIKit

// ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
// MARK: - Implementation

class FacultyDetailTableViewCell: UITableViewCell {
    
    private struct Constants {
        static let horizontalPadding: CGFloat = 42
        static let horizontalSpacing: CGFloat = 10
        static let verticalPadding: CGFloat = 16
        static let verticalSpacing: CGFloat = 2
        
        static let titleFontSize: CGFloat = 18
    }
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Static Properties
    
    static let reuseIdentifier: String = {
        return String.init(describing: self)
    }()
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - UI components
    
    private var titleLbl: UILabel!
    private var arrowImageView: UIImageView!
    var separatorView: UIView! 
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Instance porperties
    
    var viewModel: FacultyDetailTableViewCellDummyViewModel! {
        didSet {
            separatorView.isHidden = false 
            titleLbl.text = viewModel.title
            titleLbl.sizeToFit()
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
        titleLbl.textColor = .black
        titleLbl.numberOfLines = 0
        titleLbl.font = UIFont.systemFont(ofSize: Constants.titleFontSize, weight: .regular)
        addSubview(titleLbl)
        titleLbl.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(Constants.horizontalPadding)
            make.right.lessThanOrEqualTo(arrowImageView.snp.left).offset(-Constants.horizontalPadding)
            make.top.equalToSuperview().offset(Constants.verticalPadding)
            //make.bottom.equalToSuperview().offset(-Constants.verticalPadding)
        }
        
        // Separator view
        separatorView = UIView()
        separatorView.backgroundColor = #colorLiteral(red: 0.9293302894, green: 0.929463923, blue: 0.9293010831, alpha: 1)
        addSubview(separatorView)
        separatorView.snp.makeConstraints { (make) in
            make.height.equalTo(1)
            make.left.equalToSuperview().offset(Constants.horizontalPadding / 2)
            make.right.equalToSuperview().offset(-Constants.horizontalPadding / 2)
            make.top.equalTo(titleLbl.snp.bottom).offset(Constants.verticalPadding)
            make.bottom.equalToSuperview()
        }
    }
}

// ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
// MARK: - Delete this when view model for Syllabus is available


struct FacultyDetailTableViewCellDummyViewModel {
    let title: String
}
