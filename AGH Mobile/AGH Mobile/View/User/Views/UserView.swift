//
//  UserView.swift
//  AGH Mobile
//
//  Created by Mateusz Bąk on 01/04/2019.
//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.
//

// ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
// MARK: - Import

import UIKit
import SnapKit

// ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
// MARK: - Implementation

class UserView: UIView {
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Instance Variables
    
    // Private
    private lazy var screenHeight = self.frame.height
    private lazy var screenWidth =  self.frame.width
    private lazy var topPadding = self.frame.height * 0.0225
    // Public
    public static let userProfileHightMultipliValue = 0.07
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Setup view methods
    
    public func setupUI() {
        setupView()
        setupConstraints()
    }
    
    private func setupView() {
        self.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        self.addSubview(userTabBarTitle)
        self.addSubview(userProfile)
    }
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Components of View
    
    // User TabBar Title
    private lazy var userTabBarTitle: UILabel = {
        let tabBarPageTitle = TabBarPageTitle(
            title: "Ustawienia Użytkownika")
            .build()
        tabBarPageTitle.translatesAutoresizingMaskIntoConstraints = false
        return tabBarPageTitle
    }()
    
    // User Profile
    private lazy var userProfile: UserWDProfile = {
        let profile = UserWDProfile()
        profile.translatesAutoresizingMaskIntoConstraints = false
        return profile
    }()
    
    
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Setup Constraints
    
    private func setupConstraints() {
        
        // User TabBar Title
        userTabBarTitle.snp.makeConstraints { (make) in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(topPadding)
            make.centerX.equalTo(safeAreaLayoutGuide.snp.centerX)
        }
        
        // User Profile
        userProfile.snp.makeConstraints { (make) in
            make.top.equalTo(userTabBarTitle.snp.bottom).offset(screenHeight * 0.036)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(Double(screenHeight) * UserView.userProfileHightMultipliValue)
        }
    }
    
}
