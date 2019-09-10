//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.

import UIKit
import SnapKit

class SettingsView: UIView {
    
    // MARK: - Public Properties
    static let userProfileHightMultipliValue = 0.07
    var pushLoginPageVC: (() -> Void)?
    // MARK: - Private Properties
    private lazy var screenHeight = self.frame.height
    private lazy var screenWidth = self.frame.width
    private lazy var topPadding = self.frame.height * 0.0225
    
    // MARK: - Components of View
    private lazy var tabBarTitleLabel: UILabel = {
        let tabBarPageTitle = TabBarPageTitleLabel(
            title: NSLocalizedString("SettingsView_UserSettings", comment: ""))
            .build()
        return tabBarPageTitle
    }()
    
    private(set) lazy var userProfileView: UserWDProfile = {
        let profile = UserWDProfile()
        profile.translatesAutoresizingMaskIntoConstraints = false
        profile.setupProfileImage(named: "user_small_About")
        return profile
    }()
    
    private lazy var sectionTitleLabel: UILabel = {
        let label = SectionTitle(
            title: NSLocalizedString("SettingsView_AccountIntegration", comment: ""))
            .build()
        return label
    }()
    
    private(set) lazy var settingsContentView: SettingsContent = {
        let view = SettingsContent()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var logoutButton: UIButton = {
        let button = AGHButton(
            title: NSLocalizedString("SettingsView_SignOut", comment: ""))
            .build()
        button.addTarget(self, action: #selector(onPressPushLoginPage), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SettingsView {
    
    // MARK: - Setup View
    public func setupUI() {
        setupView()
        setupConstraints()
    }
    
    private func setupView() {
        self.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.addSubview(tabBarTitleLabel)
        self.addSubview(userProfileView)
        self.addSubview(sectionTitleLabel)
        self.addSubview(settingsContentView)
        self.addSubview(logoutButton)
    }

    // MARK: - Setup Constraints
    private func setupConstraints() {
        
        tabBarTitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(topPadding)
            make.centerX.equalTo(safeAreaLayoutGuide.snp.centerX)
        }
        
        userProfileView.snp.makeConstraints { (make) in
            make.top.equalTo(tabBarTitleLabel.snp.bottom).offset(screenHeight * 0.04)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(Double(screenHeight) * SettingsView.userProfileHightMultipliValue)
        }
        
        sectionTitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(userProfileView.snp.bottom).offset(screenHeight * 0.052)
            make.left.equalToSuperview().offset(20)
        }
        
        settingsContentView.snp.makeConstraints { (make) in
            make.top.equalTo(sectionTitleLabel.snp.bottom)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(logoutButton.snp.top).offset(screenHeight * -0.052)
        }
        
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
