//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.

import UIKit
import SnapKit

class LoginPageView: UIView {
    
    // MARK: - Public Properties
    public var pushAboutUsVC: (() -> Void)?
    public var pushSettingsVC: (() -> Void)?
    public var openRemindPasswordWeb: (() -> Void)?
    
    // MARK: - Private Properties
    private lazy var screenHeight = self.frame.height
    private lazy var screenWidth = self.frame.width
    private lazy var topPadding = self.frame.height * 0.0225
    private let leftMarginMultiplier: CGFloat = 0.18
    private let rightMarginMultiplier: CGFloat = -0.18
    
    // MARK: - Components of View
    private lazy var tabBarTitleLabel: UILabel = {
        let tabBarPageTitle = TabBarPageTitleLabel(
            title: NSLocalizedString("LoginPageView_UserSettings", comment: ""))
            .build()
        tabBarPageTitle.translatesAutoresizingMaskIntoConstraints = false
        return tabBarPageTitle
    }()
    
    private lazy var aghIconImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "agh_znak")
        image.backgroundColor = .mainRed
        return image
    }()
    
    private lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.textColor = .black
        label.textAlignment = .center
        label.text = NSLocalizedString("LoginPageView_YouHaveToSignInDescription", comment: "")
        return label
    }()
    
    private(set) lazy var idTextField: AGHTextField = {
        let textField = AGHTextField(placeholder: NSLocalizedString("LoginPageView_Identificator", comment: ""))
        textField.keyboardType = UIKeyboardType.numberPad
        return textField
    }()
    
    private(set) lazy var passwordTextField: AGHTextField = {
        let textField = AGHTextField(placeholder: NSLocalizedString("LoginPageView_Password", comment: ""))
        textField.isSecureTextEntry = true
        textField.autocapitalizationType = .none
        return textField
    }()
    
    private(set) lazy var loginButton: UIButton = {
        let button = AGHButton(
            title: NSLocalizedString("LoginPageView_SignIn", comment: ""))
            .build()
        button.addTarget(self, action: #selector(onPressPushSettingsVC), for: .touchUpInside)
        return button
    }()
    
    private lazy var remindPasswordButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(NSLocalizedString("LoginPageView_ForgotPassword", comment: ""), for: .normal)
        button.setTitleColor(UIColor.mainRed, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        button.titleLabel?.textAlignment = .center
        button.addTarget(self, action: #selector(onPressOpenRemindPasswordWeb), for: .touchUpInside)
        return button
    }()
    
    private lazy var macKnIconImageView: UIImageView = {
        let image = UIImage(named: "MacKNIcon")
        let logo = UIImageView(image: image)
        logo.translatesAutoresizingMaskIntoConstraints = false
        let tapOnMacKNLogo = UITapGestureRecognizer(target: self, action: #selector(self.onPressPushAboutUsVC))
        logo.addGestureRecognizer(tapOnMacKNLogo)
        logo.isUserInteractionEnabled = true
        return logo
    }()
    
    private lazy var aboutUsButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(NSLocalizedString("SettingsContent_AboutUs", comment: ""), for: .normal)
        button.setTitleColor(UIColor.mainRed, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        button.titleLabel?.textAlignment = .center
        button.addTarget(self, action: #selector(onPressPushAboutUsVC), for: .touchUpInside)
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

extension LoginPageView {
    
    // MARK: - Setup view methods
    public func setupUI() {
        self.setupView()
        self.setupConstraints()
    }
    
    private func setupView() {
        self.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.addSubview(tabBarTitleLabel)
        self.addSubview(aghIconImageView)
        self.addSubview(infoLabel)
        self.addSubview(idTextField)
        self.addSubview(passwordTextField)
        self.addSubview(loginButton)
        self.addSubview(remindPasswordButton)
        self.addSubview(macKnIconImageView)
        self.addSubview(aboutUsButton)
    }
    
    // MARK: - Setup Constraints
    private func setupConstraints() {
        tabBarTitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(topPadding)
            make.centerX.equalTo(safeAreaLayoutGuide.snp.centerX)
        }
        
        aghIconImageView.snp.makeConstraints { (make) in
            make.top.equalTo(tabBarTitleLabel.snp.bottom).offset(screenHeight * 0.030)
            make.centerX.equalTo(safeAreaLayoutGuide.snp.centerX)
            make.height.equalTo(screenHeight * 0.252)
            make.width.equalTo(aghIconImageView.snp.height).multipliedBy(0.633)
        }
        
        infoLabel.snp.makeConstraints { (make) in
            make.top.equalTo(aghIconImageView.snp.bottom).offset(screenHeight * 0.030)
            make.centerX.equalTo(safeAreaLayoutGuide.snp.centerX)
            make.bottom.equalTo(idTextField.snp.top).offset(screenHeight * -0.028)
        }
        
        idTextField.snp.makeConstraints { (make) in
            make.centerX.equalTo(safeAreaLayoutGuide.snp.centerX)
            make.top.equalTo(infoLabel.snp.bottom).offset(screenHeight * 0.028)
            make.left.equalTo(self.snp.left).offset(screenWidth * leftMarginMultiplier)
            make.right.equalTo(self.snp.right).offset(screenWidth * rightMarginMultiplier)
        }
        
        passwordTextField.snp.makeConstraints { (make) in
            make.centerX.equalTo(safeAreaLayoutGuide.snp.centerX)
            make.top.equalTo(idTextField.snp.bottom).offset(screenHeight * 0.016)
            make.left.equalTo(self.snp.left).offset(screenWidth * leftMarginMultiplier)
            make.right.equalTo(self.snp.right).offset(screenWidth * rightMarginMultiplier)
        }
        
        loginButton.snp.makeConstraints { (make) in
            make.centerX.equalTo(safeAreaLayoutGuide.snp.centerX)
            make.top.equalTo(passwordTextField.snp.bottom).offset(screenHeight * 0.037)
            make.left.equalTo(self.snp.left).offset(screenWidth * leftMarginMultiplier)
            make.right.equalTo(self.snp.right).offset(screenWidth * rightMarginMultiplier)
            make.bottom.equalTo(remindPasswordButton.snp.top).offset(-3)
        }
        
        remindPasswordButton.snp.makeConstraints { (make) in
            make.centerX.equalTo(safeAreaLayoutGuide.snp.centerX)
        }
        
        macKnIconImageView.snp.makeConstraints { (make) in
            make.centerX.equalTo(safeAreaLayoutGuide.snp.centerX)
            make.top.greaterThanOrEqualTo(remindPasswordButton.snp.bottom).offset(screenHeight * 0.036)
            make.height.equalTo(screenHeight * 0.062)
            make.width.equalTo(macKnIconImageView.snp.height)
                .multipliedBy(macKnIconImageView.frame.width / macKnIconImageView.frame.height)
            make.bottom.equalTo(aboutUsButton.snp.top).offset(-3)
        }
        
        aboutUsButton.snp.makeConstraints { (make) in
            make.centerX.equalTo(safeAreaLayoutGuide.snp.centerX)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(screenHeight * -0.019)
        }
    }
    
    // MARK: - Selectors
    @objc private func onPressPushAboutUsVC() {
        pushAboutUsVC?()
    }
    
    @objc private func onPressPushSettingsVC() {
        pushSettingsVC?()
    }
    
    @objc private func onPressOpenRemindPasswordWeb() {
        openRemindPasswordWeb?()
    }
    
}
