//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.

import UIKit
import SnapKit

class SettingsView: UIView {

    // MARK: - Instance properties
    // Private
    private lazy var screenHeight = self.frame.height
    private lazy var screenWidth = self.frame.width
    private lazy var topPadding = self.frame.height * 0.0225
    // Public
    public static let userProfileHightMultipliValue = 0.07
    public var pushLoginPageVC: (() -> Void)?

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup view methods
    public func setupUI() {
        setupView()
        setupConstraints()
    }
    
    private func setupView() {
        self.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.addSubview(tabBarTitleLabel)
        self.addSubview(userWDProfile)
        self.addSubview(sectionTitleLabel)
        self.addSubview(settingsContent)
        self.addSubview(logoutButton)
    }
    
    // MARK: - Components of View
    // TabBar Title
    private lazy var tabBarTitleLabel: UILabel = {
        let tabBarPageTitle = TabBarPageTitleLabel(
            title: NSLocalizedString("SettingsView_UserSettings", comment: ""))
            .build()
        return tabBarPageTitle
    }()
    
    // User Profile
    public private(set) lazy var userWDProfile: UserWDProfile = {
        let profile = UserWDProfile()
        profile.translatesAutoresizingMaskIntoConstraints = false
        profile.setupProfileImage(named: "user_small_About")
        return profile
    }()
    
    // Section Title
    private lazy var sectionTitleLabel: UILabel = {
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
    
    // MARK: - Setup Constraints
    private func setupConstraints() {
        
        // TabBar Title
        tabBarTitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(topPadding)
            make.centerX.equalTo(safeAreaLayoutGuide.snp.centerX)
        }
        
        // User Profile
        userWDProfile.snp.makeConstraints { (make) in
            make.top.equalTo(tabBarTitleLabel.snp.bottom).offset(screenHeight * 0.04)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(Double(screenHeight) * SettingsView.userProfileHightMultipliValue)
        }
        
        // Section Title
        sectionTitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(userWDProfile.snp.bottom).offset(screenHeight * 0.052)
            make.left.equalToSuperview().offset(20)
        }
        
        // Settings
        settingsContent.snp.makeConstraints { (make) in
            make.top.equalTo(sectionTitleLabel.snp.bottom)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(logoutButton.snp.top).offset(screenHeight * -0.052)
        }
        
        // Logout Button
        logoutButton.snp.makeConstraints { (make) in
            // Adaptation to the iPhone SE
            if UIScreen.isSmallSize() {
                make.bottom.equalToSuperview().offset(screenHeight * -0.11)
            } else {
                make.bottom.equalToSuperview().offset(screenHeight * -0.125)
            }
            make.centerX.equalTo(safeAreaLayoutGuide.snp.centerX)            
            make.left.equalTo(self.snp.left).offset(screenWidth * 0.18)
            make.right.equalTo(self.snp.right).offset(screenWidth * -0.18)
        }
        
    }
    
    // MARK: - Selectors
    @objc private func onPressPushLoginPage() {
        pushLoginPageVC?()
    }
    
}
