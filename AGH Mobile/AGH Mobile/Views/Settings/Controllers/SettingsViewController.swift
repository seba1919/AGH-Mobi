//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.

import UIKit

class SettingsViewController: UIViewController {
    
    // MARK: - Instance properties
    // Private
    private lazy var screenHeight = UIScreen.main.bounds.height
    private lazy var screenWidth = UIScreen.main.bounds.width
    private lazy var topPadding = UIScreen.main.bounds.height * 0.0225
    private let topPaddingContent: CGFloat = 3
    private let spaceBetweenLabelAndPhoto: CGFloat = 15
    private lazy var viewHight = Double(screenHeight) * SettingsViewController.userProfileHightMultipliValue
    // Public
    public static let userProfileHightMultipliValue = 0.07
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
    
    // MARK: - Initialisation
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.setupActions()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.setupNavigationAttributs()
    }
    public func setupUI() {
        setupView()
        setupConstraints()
    }
    
    private func setupView() {
        self.view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.view.addSubview(tabBarTitleLabel)
        self.view.addSubview(userWDProfile)
        self.view.addSubview(sectionTitleLabel)
        self.view.addSubview(settingsContent)
        self.view.addSubview(logoutButton)
    }
    
    // MARK: - Setup Constraints
    private func setupConstraints() {
        
        // TabBar Title
        tabBarTitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(topPadding)
            make.centerX.equalTo(view.safeAreaLayoutGuide.snp.centerX)
        }
        
        // User Profile
        userWDProfile.snp.makeConstraints { (make) in
            make.top.equalTo(tabBarTitleLabel.snp.bottom).offset(screenHeight * 0.04)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(Double(screenHeight) * SettingsViewController.userProfileHightMultipliValue)
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
            make.centerX.equalTo(view.safeAreaLayoutGuide.snp.centerX)
            make.left.equalTo(view.snp.left).offset(screenWidth * 0.18)
            make.right.equalTo(view.snp.right).offset(screenWidth * -0.18)
        }
        
    }
    
    // MARK: - Selectors
    @objc private func onPressPushLoginPage() {
            self.navigationController?.popViewController(animated: true)
    }
    
        
    // MARK: - Setup navigation controller
    private func setupNavigationAttributs() {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    // MARK: - Actions
    private func setupActions() {
        
        self.settingsContent.pushAboutAsVC = {
            let viewController = AboutUsViewController()
            self.navigationController?.pushViewController(viewController, animated: true)
        }
        
        settingsContent.openMailApp = {
            let email = "mackn@agh.edu.pl"
            // Doesn't work in simulator
            if let url = URL(string: "mailto:\(email)") {
                UIApplication.shared.open(url)
            }
        }
        
    }
    
}
