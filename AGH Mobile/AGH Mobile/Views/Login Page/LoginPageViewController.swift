//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.

import UIKit

class LoginPageViewController: UIViewController {
    // MARK: - Private Properties
    private lazy var screenHeight = UIScreen.main.bounds.height
    private lazy var screenWidth = UIScreen.main.bounds.width
    private lazy var topPadding = UIScreen.main.bounds.height * 0.0225
    private let remindPasswordWebURL = "https://dziekanat.agh.edu.pl/OdzyskiwanieHasla.aspx"
    
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
}

extension LoginPageViewController {
    // MARK: - Selectors
    @objc private func onPressPushAboutUsVC() {
        self.navigationController?.pushViewController(AboutUsViewController(), animated: true)
    }
    
    @objc private func onPressPushSettingsVC() {
        guard let userWDLogin = self.idTextField.text else { return }
        guard let userWDPassword = self.passwordTextField.text else { return}
        if userWDLogin.isEmpty || userWDPassword.isEmpty {
            self.loginButton.shake()
            CustomNotifications.setupAlertOnMissingLoginCredentials()
            return
        }
        self.loginButton.isUserInteractionEnabled = false
        WDRouterNetworking()
            .performWDLoginAction(userLogin: userWDLogin,
                                  userPassword: userWDPassword) { isLoggedIn in
                                    if isLoggedIn == .success {
                                        CustomNotifications.showLoginSuccessAlert()
                                        self.navigationController?
                                            .pushViewController(SettingsViewController(), animated: true)
                                    } else if isLoggedIn == .credentialsFailiture {
                                        CustomNotifications.showLoginFailitureAlert()
                                    }
                                    self.loginButton.isUserInteractionEnabled = true
        }
    }
    
    @objc private func onPressOpenRemindPasswordWeb() {
        if let url = URL(string: self.remindPasswordWebURL) {
            UIApplication.shared.open(url)
        }
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        hideKeyboardWhenTappedAround()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupNavigationAttributs()
    }
    
    // MARK: - Setup view methods
    public func setupUI() {
        self.setupView()
        self.setupConstraints()
    }
    
    private func setupView() {
        self.view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.view.addSubview(tabBarTitleLabel)
        self.view.addSubview(aghIconImageView)
        self.view.addSubview(infoLabel)
        self.view.addSubview(idTextField)
        self.view.addSubview(passwordTextField)
        self.view.addSubview(loginButton)
        self.view.addSubview(remindPasswordButton)
        self.view.addSubview(macKnIconImageView)
        self.view.addSubview(aboutUsButton)
    }
    
    // MARK: - Setup Constraints
    private func setupConstraints() {
        tabBarTitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(topPadding)
            make.centerX.equalTo(view.safeAreaLayoutGuide.snp.centerX)
        }
        
        aghIconImageView.snp.makeConstraints { (make) in
            make.top.equalTo(tabBarTitleLabel.snp.bottom).offset(screenHeight * 0.030)
            make.centerX.equalTo(view.safeAreaLayoutGuide.snp.centerX)
            make.height.equalTo(screenHeight * 0.252)
            make.width.equalTo(aghIconImageView.snp.height).multipliedBy(0.633)
        }
        
        infoLabel.snp.makeConstraints { (make) in
            make.top.equalTo(aghIconImageView.snp.bottom).offset(screenHeight * 0.030)
            make.centerX.equalTo(view.safeAreaLayoutGuide.snp.centerX)
            make.bottom.equalTo(idTextField.snp.top).offset(screenHeight * -0.028)
        }
        
        idTextField.snp.makeConstraints { (make) in
            make.centerX.equalTo(view.safeAreaLayoutGuide.snp.centerX)
            make.top.equalTo(infoLabel.snp.bottom).offset(screenHeight * 0.028)
            make.left.equalTo(self.view.snp.left).offset(screenWidth * leftMarginMultiplier)
            make.width.equalTo(passwordTextField)
        }
        
        passwordTextField.snp.makeConstraints { (make) in
            make.centerX.equalTo(view.safeAreaLayoutGuide.snp.centerX)
            make.top.equalTo(idTextField.snp.bottom).offset(screenHeight * 0.016)
            make.left.equalTo(self.view.snp.right).offset(screenWidth * rightMarginMultiplier)
        }
        
        loginButton.snp.makeConstraints { (make) in
            make.centerX.equalTo(view.safeAreaLayoutGuide.snp.centerX)
            make.top.equalTo(passwordTextField.snp.bottom).offset(screenHeight * 0.037)
            make.left.equalTo(self.view.snp.left).offset(screenWidth * leftMarginMultiplier)
            make.right.equalTo(self.view.snp.right).offset(screenWidth * rightMarginMultiplier)
            make.bottom.equalTo(remindPasswordButton.snp.top).offset(-3)
        }
        
        remindPasswordButton.snp.makeConstraints { (make) in
            make.centerX.equalTo(view.safeAreaLayoutGuide.snp.centerX)
        }
        
        macKnIconImageView.snp.makeConstraints { (make) in
            make.centerX.equalTo(view.safeAreaLayoutGuide.snp.centerX)
            make.top.greaterThanOrEqualTo(remindPasswordButton.snp.bottom).offset(screenHeight * 0.036)
            make.height.equalTo(screenHeight * 0.062)
            make.width.equalTo(macKnIconImageView.snp.height)
                .multipliedBy(macKnIconImageView.frame.width / macKnIconImageView.frame.height)
            make.bottom.equalTo(aboutUsButton.snp.top).offset(-3)
        }
        
        aboutUsButton.snp.makeConstraints { (make) in
            make.centerX.equalTo(view.safeAreaLayoutGuide.snp.centerX)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(screenHeight * -0.019)
        }
    }
}

extension LoginPageViewController {
    
    // MARK: - Setup
    private func setupNavigationAttributs() {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    // MARK: - Hide Keyboard When Tapped Around
    private func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self,
                                                                 action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
}
