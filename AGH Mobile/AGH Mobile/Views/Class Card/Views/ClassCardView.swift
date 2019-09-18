//
//  ClassCardView.swift
//  AGH Mobile
//
//  Created by Macbook on 18/09/2019.
//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.
//

// MARK: - Import

import UIKit

// MARK: - Implementation

class ClassCardView: UIView {
    
    // MARK: - Private properties
    
    private lazy var screenHeight = self.frame.height
    private lazy var screenWidth = self.frame.width
    private lazy var spacing = screenHeight * 0.03
    private lazy var spacingInRows = screenHeight * 0.0125
    private let leftMargin: CGFloat = 20
    private let rightMargin: CGFloat = -20

    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup view methods
    
    public func setupUI() {
        setupViews()
        setupConstraints()
    }

    private func setupViews() {
        self.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        [subjectName,
         separator,
         subjectType,
         rowStackView].forEach({addSubview($0)})
        
        [classHourRowView,
         teacherRowView,
         buildingRowView,
         ectsNumberRowView].forEach({rowStackView.addArrangedSubview($0)})
    }
    
    // MARK: - Components of View

    private lazy var subjectName: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.systemFont(ofSize: 35, weight: .bold)
        lbl.textColor = .black
        lbl.textAlignment = .left
        lbl.text = "Bazy Danych"
        return lbl
    }()
    
    private lazy var separator: UIView = {
        let v = SeparatorView().build()
        return v
    }()
    
    private lazy var subjectType: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        lbl.textColor = .mainRed
        lbl.textAlignment = .left
        lbl.text = "Wykład"
        return lbl
    }()
    

    private lazy var classHourRowView: RowView = {
        let view = RowView(style: .withDescription, separatorPosition: .none, accessory: .withoutRightAccessory)
        view.setupTitle(as: "Poniedziałek 9.30-11.00")
        view.setupDescription(as: "Grupa W")
        view.setupLeftAccessory(named: "clock_Classes")
        view.setupTextColor(as: .customDarkGrayText)
        return view
    }()
    
    private lazy var teacherRowView: RowView = {
        let view = RowView(style: .withLeftAccessory, separatorPosition: .none)
        view.setupTitle(as: "prof.dr.hab.Jan Kowalski")
        view.setupLeftAccessory(named: "human_Classes")
        view.setupTextColor(as: .customDarkGrayText)
        return view
    }()
    
    private lazy var buildingRowView: RowView = {
        let view = RowView(style: .withDescription, separatorPosition: .none)
        view.setupTitle(as: "Budynek C2")
        view.setupDescription(as: "224")
        view.setupLeftAccessory(named: "location_Classes")
        view.setupTextColor(as: .customDarkGrayText)
        return view
    }()

    private lazy var ectsNumberRowView: RowView = {
        let view = RowView(style: .withDescription, separatorPosition: .none)
        view.setupTitle(as: "4ECTS")
        view.setupDescription(as: "Syllabus")
        view.setupLeftAccessory(named: "book_Classes")
        view.setupTextColor(as: .customDarkGrayText)
        
        return view
    }()
    
    private lazy var rowStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        stack.spacing = 0.0
        return stack
    }()

    // MARK: - Constraints
    
    private func setupConstraints() {
        
        subjectName.snp.makeConstraints { (make) in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(spacing)
            make.left.right.equalToSuperview().offset(leftMargin)
        }
        
        separator.snp.makeConstraints { (make) in
            make.top.equalTo(subjectName.snp.bottom).offset(spacing)
            make.left.right.equalToSuperview().offset(leftMargin)
        }
        
        subjectType.snp.makeConstraints { (make) in
            make.top.equalTo(separator.snp.bottom).offset(spacingInRows)
            make.left.right.equalToSuperview().offset(leftMargin)
        }
        
        rowStackView.snp.makeConstraints { (make) in
            make.top.equalTo(subjectType.snp.bottom).offset(spacingInRows)
            make.left.right.equalToSuperview()
        }
        
    }
    

}
