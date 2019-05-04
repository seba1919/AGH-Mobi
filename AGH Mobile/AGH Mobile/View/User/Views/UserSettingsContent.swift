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
    private lazy var screenHeight = self.frame.height
    private lazy var screenWidth =  self.frame.width
    private let separatorFreeSpace: CGFloat = 3
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
        self.addSubview(separatorNo1)
        self.addSubview(rowNo1)
        self.addSubview(separatorNo2)
        self.addSubview(rowNo2)
        self.addSubview(separatorNo3)
        self.addSubview(rowNo3)
        self.addSubview(separatorNo4)
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
    
    // Separator no. 1
    private lazy var separatorNo1: UIView = {
        let view = SeparatorView().build()
        return view
    }()
    
    // Row no. 1
    private lazy var rowNo1: RowView = {
        let view = RowView(style: .normal)
        view.setupTitle(as: "Wirtualna Uczelnia")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // Separator no. 2
    private lazy var separatorNo2: UIView = {
        let view = SeparatorView().build()
        return view
    }()
    
    // Row no. 2
    private lazy var rowNo2: RowView = {
        let view = RowView(style: .normal)
        view.setupTitle(as: "UPEL")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // Separator no. 3
    private lazy var separatorNo3: UIView = {
        let view = SeparatorView().build()
        return view
    }()
    
    // Row no. 3
    private lazy var rowNo3: RowView = {
        let view = RowView(style: .normal)
        view.setupTitle(as: "Panel Usług Sieciowych")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // Separator no. 4
    private lazy var separatorNo4: UIView = {
        let view = SeparatorView().build()
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
        
        // Separator no. 1
        separatorNo1.snp.makeConstraints { (make) in
            make.top.equalTo(sectionTitle.snp.bottom).offset(separatorFreeSpace)
            make.width.equalToSuperview()
        }
        
        // Row no. 1
        rowNo1.snp.makeConstraints { (make) in
            make.top.equalTo(separatorNo1.snp.bottom).offset(separatorFreeSpace)
            make.width.equalToSuperview()
        }
        
        // Separator no. 2
        separatorNo2.snp.makeConstraints { (make) in
            make.top.equalTo(rowNo1.snp.bottom).offset(separatorFreeSpace)
            make.width.equalToSuperview()
        }
        
        // Row no. 2
        rowNo2.snp.makeConstraints { (make) in
            make.top.equalTo(separatorNo2.snp.bottom).offset(separatorFreeSpace)
            make.width.equalToSuperview()
        }
        
        // Separator no. 3
        separatorNo3.snp.makeConstraints { (make) in
            make.top.equalTo(rowNo2.snp.bottom).offset(separatorFreeSpace)
            make.width.equalToSuperview()
        }
        
        // Row no. 3
        rowNo3.snp.makeConstraints { (make) in
            make.top.equalTo(separatorNo3.snp.bottom).offset(separatorFreeSpace)
            make.width.equalToSuperview()
        }
        
        // Separator no. 4
        separatorNo4.snp.makeConstraints { (make) in
            make.top.equalTo(rowNo3.snp.bottom).offset(separatorFreeSpace)
            make.width.equalToSuperview()
        }
        
    }
    
}


