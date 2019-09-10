//
//  SettingsView.swift
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

class SettingsView: UIView {
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Properties
    
    // Private
    private lazy var screenHeight = self.frame.height
    private lazy var screenWidth = self.frame.width
    private lazy var topPadding = self.frame.height * 0.0225
    // Public
    public static let userProfileHightMultipliValue = 0.07
    public var pushLoginPageVC: (() -> Void)?
    
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
        self.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.addSubview(tabBarTitle)
        self.addSubview(userProfile)
        self.addSubview(sectionTitle)
        self.addSubview(settingsContent)
        self.addSubview(logoutButton)
    }
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Components of View
    
    // TabBar Title
    private lazy var tabBarTitle: UILabel = {
        let tabBarPageTitle = TabBarPageTitleLabel(
            title: NSLocalizedString("SettingsView_UserSETTINGS", comment: ""))
            .build()
        return tabBarPageTitle
    }()
    
    // User Profile
    public private(set) lazy var userProfile: UserWDProfile = {
        let profile = UserWDProfile()
        profile.translatesAutoresizingMaskIntoConstraints = false
        profile.setupProfileImage(named: "user_small_About")
        return profile
    }()
    
    // Section Title
    private lazy var sectionTitle : UILabel = {
        let label = SectionTitle(
            title: NSLocalizedString("SettingsView_AccountIntegration", comment: ""))
            .build()
        return label
    }()
    
    // Settings
    public private(set) lazy var settingsContent: SettingsContent = {
        let view = SettingsContent()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // Logout Button
    private lazy var logoutButton: UIButton = {
        let button = AGHButton(
            title: NSLocalizedString("SettingsView_SignOut", comment: ""))
            .build()
        button.addTarget(self, action: #selector(onPressPushLoginPage), for: .touchUpInside)
        return button
    }()
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Setup Constraints
    
    private func setupConstraints() {
        
        // TabBar Title
        tabBarTitle.snp.makeConstraints { (make) in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(topPadding)
            make.centerX.equalTo(safeAreaLayoutGuide.snp.centerX)
        }
        
        // User Profile
        userProfile.snp.makeConstraints { (make) in
            make.top.equalTo(tabBarTitle.snp.bottom).offset(screenHeight * 0.04)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(Double(screenHeight) * SettingsView.userProfileHightMultipliValue)
        }
        
        // Section Title
        sectionTitle.snp.makeConstraints { (make) in
            make.top.equalTo(userProfile.snp.bottom).offset(screenHeight * 0.052)
            make.left.equalToSuperview().offset(20)
        }
        
        // Settings
        settingsContent.snp.makeConstraints { (make) in
            make.top.equalTo(sectionTitle.snp.bottom)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(logoutButton.snp.top).offset(screenHeight * -0.052)
        }
        
        // Logout Button
        logoutButton.snp.makeConstraints { (make) in
            // Adaptation to the iPhone SE
            if (UIScreen.main.bounds.height < 569) {
                make.bottom.equalToSuperview().offset(screenHeight * -0.11)
            } else {
                make.bottom.equalToSuperview().offset(screenHeight * -0.125)
            }
            make.centerX.equalTo(safeAreaLayoutGuide.snp.centerX)            
            make.left.equalTo(self.snp.left).offset(screenWidth * 0.18)
            make.right.equalTo(self.snp.right).offset(screenWidth * -0.18)
        }
        
    }
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Selectors
    
    @objc private func onPressPushLoginPage() {
        pushLoginPageVC?()
    }
    
}
