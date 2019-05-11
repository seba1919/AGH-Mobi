//
//  LoginPageView.swift
//  AGH Mobile
//
//  Created by Mateusz Bąk on 07/05/2019.
//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.
//

// ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
// MARK: - Import

import UIKit
import SnapKit

// ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
// MARK: - Implementation

class LoginPageView: UIView {

    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Instance Variables
    
    // Private
    private lazy var screenHeight = self.frame.height
    private lazy var screenWidth =  self.frame.width
    private lazy var topPadding = self.frame.height * 0.0225
    private let leftMarginMultiplier: CGFloat = 0.18
    private let rightMarginMultiplier: CGFloat = -0.18
    
    // Public
    public var pushAboutAsVC: (() -> Void)?
    public var pushUserVC: (() -> Void)?
    public var openRemindPasswordWeb: (() -> Void)?
    
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
        self.setupView()
        self.setupConstraints()
    }
    
    private func setupView() {
        self.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.addSubview(tabBarTitle)
        self.addSubview(AGHLogo)
        self.addSubview(infoLabel)
        self.addSubview(IDTextField)
        self.addSubview(passwordTextField)
        self.addSubview(loginButton)
        self.addSubview(remindPasswordButton)
        self.addSubview(MacKNLogo)
        self.addSubview(aboutAsButton)
    }
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Components of View
    
    // TabBar title
    private lazy var tabBarTitle: UILabel = {
        let tabBarPageTitle = TabBarPageTitleLabel(
            title: "Ustawienia Użytkownika")
            .build()
        tabBarPageTitle.translatesAutoresizingMaskIntoConstraints = false
        return tabBarPageTitle
    }()
    
    // AGH logo
    private lazy var AGHLogo: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "agh_znak")
        image.backgroundColor = .mainRed
        return image
    }()
    
    // Information label
    private lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.textColor = .black
        label.textAlignment = .center
        label.text = """
        Aby przejść dalej, musisz zalogować
        się do Wirtualnej Uczelni
        """
        return label
    }()
    
    // ID TextField
    private lazy var IDTextField: AGHTextField = {
        let textField = AGHTextField(placeholder: "Identyfikator")
        textField.keyboardType = UIKeyboardType.numberPad
        return textField
    }()
    
    // Password TextField
    private lazy var passwordTextField: AGHTextField = {
        let textField = AGHTextField(placeholder: "Hasło")
        return textField
    }()
    
    // Login Button
    private lazy var loginButton: UIButton = {
        let button = AGHButton(
            title: "Zaloguj się")
            .build()
        button.addTarget(self, action: #selector(onPressPushUserVC), for: .touchUpInside)
        return button
    }()
    
    // Remind Password Button
    private lazy var remindPasswordButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Zapomniałeś hasła?", for: .normal)
        button.setTitleColor(UIColor.mainRed, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        button.titleLabel?.textAlignment = .center
        button.addTarget(self, action: #selector(onPressOpenRemindPasswordWeb), for: .touchUpInside)
        return button
    }()

    // MacKN Logo
    private lazy var MacKNLogo: UIImageView = {
        let image = UIImage(named: "MacKNIcon")
        let logo = UIImageView(image: image)
        logo.translatesAutoresizingMaskIntoConstraints = false
        let tapOnMacKNLogo = UITapGestureRecognizer(target: self, action: #selector(self.onPressPushAboutAsVC))
        logo.addGestureRecognizer(tapOnMacKNLogo)
        logo.isUserInteractionEnabled = true
        return logo
    }()
    
    // About As Button
    private lazy var aboutAsButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("O nas", for: .normal)
        button.setTitleColor(UIColor.mainRed, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        button.titleLabel?.textAlignment = .center
        button.addTarget(self, action: #selector(onPressPushAboutAsVC), for: .touchUpInside)
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
        
        // AGH logo
        AGHLogo.snp.makeConstraints { (make) in
            make.top.equalTo(tabBarTitle.snp.bottom).offset(screenHeight * 0.030)
            make.centerX.equalTo(safeAreaLayoutGuide.snp.centerX)
            make.height.equalTo(screenHeight * 0.252)
            make.width.equalTo(AGHLogo.snp.height).multipliedBy(0.633)
        }
        
        // Information label
        infoLabel.snp.makeConstraints { (make) in
            make.top.equalTo(AGHLogo.snp.bottom).offset(screenHeight * 0.030)
            make.centerX.equalTo(safeAreaLayoutGuide.snp.centerX)
            make.bottom.equalTo(IDTextField.snp.top).offset(screenHeight * -0.028)
        }
        
        // ID TextField
        IDTextField.snp.makeConstraints { (make) in
            make.centerX.equalTo(safeAreaLayoutGuide.snp.centerX)
            make.top.equalTo(infoLabel.snp.bottom).offset(screenHeight * 0.028)
            make.left.equalTo(self.snp.left).offset(screenWidth * leftMarginMultiplier)
            make.right.equalTo(self.snp.right).offset(screenWidth * rightMarginMultiplier)
        }
        
        // Password TextField
        passwordTextField.snp.makeConstraints { (make) in
            make.centerX.equalTo(safeAreaLayoutGuide.snp.centerX)
            make.top.equalTo(IDTextField.snp.bottom).offset(screenHeight * 0.016)
            make.left.equalTo(self.snp.left).offset(screenWidth * leftMarginMultiplier)
            make.right.equalTo(self.snp.right).offset(screenWidth * rightMarginMultiplier)
        }
        
        // Login Button
        loginButton.snp.makeConstraints { (make) in
            make.centerX.equalTo(safeAreaLayoutGuide.snp.centerX)
            make.top.equalTo(passwordTextField.snp.bottom).offset(screenHeight * 0.037)
            make.left.equalTo(self.snp.left).offset(screenWidth * leftMarginMultiplier)
            make.right.equalTo(self.snp.right).offset(screenWidth * rightMarginMultiplier)
            make.bottom.equalTo(remindPasswordButton.snp.top).offset(-3)
        }
        
        // Remind Password Button
        remindPasswordButton.snp.makeConstraints { (make) in
            make.centerX.equalTo(safeAreaLayoutGuide.snp.centerX)
        }
        
        // MacKN Logo
        MacKNLogo.snp.makeConstraints { (make) in
            make.centerX.equalTo(safeAreaLayoutGuide.snp.centerX)
            make.top.greaterThanOrEqualTo(remindPasswordButton.snp.bottom).offset(screenHeight * 0.036)
            make.height.equalTo(screenHeight * 0.062)
            make.width.equalTo(MacKNLogo.snp.height).multipliedBy(MacKNLogo.frame.width / MacKNLogo.frame.height)
            make.bottom.equalTo(aboutAsButton.snp.top).offset(-3)
        }
        
        // About As Button
        aboutAsButton.snp.makeConstraints { (make) in
            make.centerX.equalTo(safeAreaLayoutGuide.snp.centerX)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(screenHeight * -0.019)
        }
    }
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Selectors
    
    @objc private func onPressPushAboutAsVC() {
        pushAboutAsVC?()
    }
    
    @objc private func onPressPushUserVC() {
        pushUserVC?()
    }
    
    @objc private func onPressOpenRemindPasswordWeb() {
        openRemindPasswordWeb?()
    }
}
