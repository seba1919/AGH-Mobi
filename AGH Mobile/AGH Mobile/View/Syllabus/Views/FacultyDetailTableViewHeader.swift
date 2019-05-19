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
        static let titleFontSize: CGFloat = 18
    }
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Static properties
    
    static let reuseIdentifier: String = {
        return String.init(describing: self)
    }()
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - UI components
    
    var titleLbl: UILabel!
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Init
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setUpView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - View setup
    
    private func setUpView() {
        titleLbl = UILabel()
        titleLbl.textColor = .mainRed
        titleLbl.numberOfLines = 0
        titleLbl.font = UIFont.systemFont(ofSize: Constants.titleFontSize, weight: .bold)
        addSubview(titleLbl)
        titleLbl.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(Constants.horizontalPadding)
            make.right.equalToSuperview().offset(-Constants.horizontalPadding)
            make.top.equalToSuperview().offset(Constants.verticalPadding)
            make.bottom.equalToSuperview().offset(-Constants.verticalPadding)
        }
    }
}
