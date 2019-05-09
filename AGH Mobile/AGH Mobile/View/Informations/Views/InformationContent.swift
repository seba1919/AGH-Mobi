//
//  InformationContent.swift
//  AGH Mobile
//
//  Created by Mateusz Bąk on 09/05/2019.
//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.
//

// ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
// MARK: - Import

import UIKit
import SnapKit

// ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
// MARK: - Implementation

class InformationContent: UIView {
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Instance Variables
    
    // Private
    private lazy var screenHeight = UIScreen.main.bounds.size.height
    private lazy var screenWidth =  UIScreen.main.bounds.size.width
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
        self.addSubview(rowNo1)
        self.addSubview(rowNo2)
        self.addSubview(rowNo3)
        self.addSubview(rowNo4)
    }
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Components of View
    
    // Row no. 1
    private lazy var rowNo1: RowView = {
        let view = RowView(style: .withLeftAccessory,
                           separatorPosition: .top)
        view.setupTitle(as: "Syllabus")
        return view
    }()
    
    // Row no. 2
    private lazy var rowNo2: RowView = {
        let view = RowView(style: .withLeftAccessory,
                           separatorPosition: .top)
        view.setupTitle(as: "Pracownicy Uczelni")
        return view
    }()
    
    // Row no. 3
    private lazy var rowNo3: RowView = {
        let view = RowView(style: .withLeftAccessory,
                           separatorPosition: .top)
        view.setupTitle(as: "Regulamin Studiów")
        return view
    }()
    
    // Row no. 4
    private lazy var rowNo4: RowView = {
        let view = RowView(style: .withLeftAccessory,
                           separatorPosition: .topAndBottom)
        view.setupTitle(as: "Rok Akademicki")
        return view
    }()
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Setup Constraints
    
    private func setupConstraints() {
        
        // Row no. 1, 2, 3, 4
        rowNo1.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.top)
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
        
        rowNo4.snp.makeConstraints { (make) in
            make.top.equalTo(rowNo3.snp.bottom)
            make.width.equalToSuperview()
            make.bottom.equalTo(self.snp.bottom)
        }
        
    }
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Actions
    
    
    
}
