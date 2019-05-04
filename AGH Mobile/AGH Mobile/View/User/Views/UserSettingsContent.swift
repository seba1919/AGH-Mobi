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
    // MARK: - Instance Variables
    
    // Private
    private lazy var screenHeight = UIScreen.main.bounds.size.height
    private lazy var screenWidth =  UIScreen.main.bounds.size.width
    private let rowFreeSpace: CGFloat = 3
    // Public
    
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
        self.addSubview(sectionTitle)
        self.addSubview(rowNo1)
        self.addSubview(rowNo2)
        self.addSubview(rowNo3)
        self.addSubview(rowNo4)
        self.addSubview(rowNo5)
        self.addSubview(rowNo6)
    }
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Components of View
    
    // Section Title
    private lazy var sectionTitle : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = .customGrayText
        label.text = "INTEGRACJA KONT".uppercased()
        label.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        return label
    }()
    
    // Row no. 1
    private lazy var rowNo1: RowView = {
        let view = RowView(style: .normalWithIndentation,
                           separatorPosition: .top)
        view.setupTitle(as: "Wirtualna Uczelnia")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // Row no. 2
    private lazy var rowNo2: RowView = {
        let view = RowView(style: .normalWithIndentation,
                           separatorPosition: .top)
        view.setupTitle(as: "UPEL")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // Row no. 3
    private lazy var rowNo3: RowView = {
        let view = RowView(style: .normalWithIndentation,
                           separatorPosition: .topAndBottom)
        view.setupTitle(as: "Panel Usług Sieciowych")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // Row no. 4
    private lazy var rowNo4: RowView = {
        let view = RowView(style: .withSwitch,
                           separatorPosition: .topAndBottom)
        view.setupTitle(as: "Powiadomienia o ocenach")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // Row no. 5
    private lazy var rowNo5: RowView = {
        let view = RowView(style: .normal,
                           separatorPosition: .topAndBottom)
        view.setupTitle(as: "O nas")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // Row no. 6
    private lazy var rowNo6: RowView = {
        let view = RowView(style: .empty,
                           separatorPosition: .bottom)
        view.setupTitle(as: "Skontaktuj się z nami")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Setup Constraints
    
    private func setupConstraints() {
        
        // Section Title
        sectionTitle.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.top)
            make.left.equalTo(self.snp.left)
        }
        
        // Row no. 1, 2, 3
        rowNo1.snp.makeConstraints { (make) in
            make.top.equalTo(sectionTitle.snp.bottom).offset(rowFreeSpace)
            make.width.equalToSuperview()
        }
        
        rowNo2.snp.makeConstraints { (make) in
            make.top.equalTo(rowNo1.snp.bottom)
            make.width.equalToSuperview()
        }
        
        rowNo3.snp.makeConstraints { (make) in
            make.top.equalTo(rowNo2.snp.bottom)
            make.width.equalToSuperview()
        }
        
        // Row no. 4
        rowNo4.snp.makeConstraints { (make) in
            make.top.equalTo(rowNo3.snp.bottom).offset(screenHeight * 0.063)
            make.width.equalToSuperview()
        }
        
        // Row no. 5, 6
        rowNo5.snp.makeConstraints { (make) in
            make.top.equalTo(rowNo4.snp.bottom).offset(screenHeight * 0.063)
            make.width.equalToSuperview()
        }
        
        rowNo6.snp.makeConstraints { (make) in
            make.top.equalTo(rowNo5.snp.bottom)
            make.width.equalToSuperview()
        }
        
    }
    
}

