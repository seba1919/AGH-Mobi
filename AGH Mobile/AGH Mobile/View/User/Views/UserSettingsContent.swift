//
//  UserSettingsContent.swift
//  AGH Mobile
//
//  Created by Mateusz Bąk on 03/05/2019.
//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.
//

// ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
// MARK: - Import

import UIKit
import SnapKit

// ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
// MARK: - Implementation

class UserSettingsContent: UIView {
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Properties
    
    // Private
    private lazy var screenHeight = UIScreen.main.bounds.size.height
    private lazy var screenWidth =  UIScreen.main.bounds.size.width
    private let topPadding: CGFloat = 3
    // Public
    public var pushAboutAsVC: (() -> Void)?
    public var openMailApp: (() -> Void)?
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Setup view methods
    
    private func setupUI() {
        setupView()
        setupConstraints()
    }
    
    private func setupView() {
        self.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.addSubview(rowNo4)
        setupStackViews()
    }
    
    private func setupStackViews() {
        // First StackView
        stackViewNo1.addArrangedSubview(rowNo1)
        stackViewNo1.addArrangedSubview(rowNo2)
        stackViewNo1.addArrangedSubview(rowNo3)
        self.addSubview(stackViewNo1)
        // Second StackView
        stackViewNo2.addArrangedSubview(rowNo5)
        stackViewNo2.addArrangedSubview(rowNo6)
        self.addSubview(stackViewNo2)
    }
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Components of View
    
    // Row no. 1 - "Wirtualna Uczelnia"
    private lazy var rowNo1: RowView = {
        let view = RowView(style: .normalWithIndentation,
                           separatorPosition: .top)
        view.setupTitle(as: "Wirtualna Uczelnia")
        return view
    }()
    
    // Row no. 2 - "UPEL"
    private lazy var rowNo2: RowView = {
        let view = RowView(style: .normalWithIndentation,
                           separatorPosition: .top)
        view.setupTitle(as: "UPEL")
        return view
    }()
    
    // Row no. 3 - "Panel Usług Sieciowych"
    private lazy var rowNo3: RowView = {
        let view = RowView(style: .normalWithIndentation,
                           separatorPosition: .topAndBottom)
        view.setupTitle(as: "Panel Usług Sieciowych")
        return view
    }()
    
    // Row no. 4 - "Powiadomienia o ocenach"
    private lazy var rowNo4: RowView = {
        let view = RowView(style: .withSwitch,
                           separatorPosition: .topAndBottom)
        view.setupTitle(as: "Powiadomienia o ocenach")
        return view
    }()
    
    // Row no. 5 - "O nas"
    private lazy var rowNo5: RowView = {
        let view = RowView(style: .normal,
                           separatorPosition: .topAndBottom)
        view.setupTitle(as: "O nas")
        view.setAction = { self.onPressPushAboutAsVC() }
        return view
    }()
    
    // Row no. 6 - "Skontaktuj się z nami"
    private lazy var rowNo6: RowView = {
        let view = RowView(style: .empty,
                           separatorPosition: .bottom)
        view.setupTitle(as: "Skontaktuj się z nami")
        view.setAction = { self.onPressOpenMailApp() }
        return view
    }()
    
    // StackView for Row no. 1 - 3
    private lazy var stackViewNo1: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        stack.spacing = 0.0
        return stack
    }()
    
    // StackView for Row no. 5 - 6
    private lazy var stackViewNo2: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        stack.spacing = 0.0
        return stack
    }()
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Setup Constraints
    
    private func setupConstraints() {
        
        // StackView for Row no. 1 - 3
        stackViewNo1.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.top).offset(topPadding)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(rowNo4.snp.top).offset(screenHeight * -0.063)
        }
        
        // Row no. 4
        rowNo4.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
        }
        
        // StackView for Row no. 5 - 6
        stackViewNo2.snp.makeConstraints { (make) in
            make.top.equalTo(rowNo4.snp.bottom).offset(screenHeight * 0.063)
            make.left.right.equalToSuperview()
            //make.bottom.equalTo(self.snp.bottom)
        }

    }
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Actions
    
     private func onPressPushAboutAsVC() {
        pushAboutAsVC?()
    }
    
    private func onPressOpenMailApp() {
        openMailApp?()
    }
    
}


