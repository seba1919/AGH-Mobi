//
//  StudiesView.swift
//  AGH Mobile
//
//  Created by Mateusz Bąk on 01/04/2019.
//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.
//

// ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
// MARK: - Import

import UIKit
import SnapKit

// ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
// MARK: - Implementation

class StudiesView: UIView {
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Properties
    
    // Private
    private lazy var screenHeight = self.frame.height
    private lazy var screenWidth = self.frame.width
    private lazy var spacing = screenHeight * 0.01
    private lazy var topPadding = self.frame.height * 0.0225
    private lazy var bottomPadding = -topPadding
    private let leftMargin: CGFloat = 30.0
    private var isClassesTableViewExpand = false
    // Public
    public var pushScheduleVC: (() -> Void)?
    public var pushAssessmentVC: (() -> Void)?
    public var pushSyllabusVC: (() -> Void)?
    public var pushLecturersVC: (() -> Void)?
    public var pushMyFieldsOfStudiesVC: (() -> Void)?
    
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
        setupViews()
        setupConstraints()
        setMoreButton()
    }
    
    private func setupViews() {
        self.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        // Scroll View
        self.addSubview(scrollView)
        // Content View
        scrollView.addSubview(contentView)
        // Components
        self.addSubview(tabBatTitle)
        contentView.addSubview(titleImage)
        contentView.addSubview(mainTitle)
        contentView.addSubview(separatorNo1)
        contentView.addSubview(sectionTitle)
        contentView.addSubview(classesTabelView)
        // Stack View of Rows
        setupStackView()
    }
    
    private func setupStackView() {
        stackViewContent.addArrangedSubview(rowNo1)
        stackViewContent.addArrangedSubview(rowNo2)
        stackViewContent.addArrangedSubview(rowNo3)
        stackViewContent.addArrangedSubview(rowNo4)
        stackViewContent.addArrangedSubview(rowNo5)
        contentView.addSubview(stackViewContent)
    }
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Components of view
    
    // ScrollView
    private lazy var scrollView: UIScrollView = {
        let view = UIScrollView(frame: UIScreen.main.bounds)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        view.isScrollEnabled = true
        return view
    }()
    
    // Content View
    private lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    
    // TabBar Title
    private lazy var tabBatTitle: UILabel = {
        let label = TabBarPageTitleLabel(
            title: "Moje studia")
            .build()
        return label
    }()
    
    // Title Image
    private lazy var titleImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "studies_big_Studies")
        return image
    }()
    
    // Main Title
    private lazy var mainTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
        label.textColor = .black
        label.textAlignment = .left
        label.text = "Moje studia"
        return label
    }()
    
    // Separator no. 1
    private lazy var separatorNo1: UIView = {
        let view = SeparatorView().build()
        return view
    }()
    
    // Section Title
    private lazy var sectionTitle : UILabel = {
        let label = SectionTitle(
            title: "Dzisiejsze zajęcia")
            .build()
        return label
    }()
    
    // Classes TabelView
    public private(set) lazy var classesTabelView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        tableView.isScrollEnabled = false
        tableView.separatorColor = .clear
        tableView.allowsSelection = false
        return tableView
    }()
    
    // More Button
    private lazy var moreButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("● ● ●", for: .normal)
        button.setTitleColor(.shortcutDarkGray, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 8)
        button.addTarget(self, action: #selector(onPressExpandClassesTV), for: .touchUpInside)
        return button
    }()
    
    // StackView Content
    private lazy var stackViewContent: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        stack.spacing = 0.0
        return stack
    }()
    
    // Row no. 1 - "Plan zajęć"
    private lazy var rowNo1: RowView = {
        let view = RowView(style: .withLeftAccessory,
                           separatorPosition: .top)
        view.setupTitle(as: "Plan zajęć")
        view.setupLeftAccessory(named: "calendar_Studies")
        view.setAction = { self.onPressPushScheduleVC() }
        return view
    }()
    
    // Row no. 2 - "Oceny"
    private lazy var rowNo2: RowView = {
        let view = RowView(style: .withLeftAccessory,
                           separatorPosition: .top)
        view.setupTitle(as: "Oceny")
        view.setupLeftAccessory(named: "grades_Studies")
        view.setAction = { self.onPressPushAssessmentVC() }
        return view
    }()
    
    // Row no. 3 - "Sylabus"
    private lazy var rowNo3: RowView = {
        let view = RowView(style: .withLeftAccessory,
                           separatorPosition: .top)
        view.setupTitle(as: "Syllabus")
        view.setupLeftAccessory(named: "sheets_Info")
        view.setAction = { self.onPressPushSyllabusVC() }
        return view
    }()
    
    // Row no. 4 - "Prowadzący"
    private lazy var rowNo4: RowView = {
        let view = RowView(style: .withLeftAccessory,
                           separatorPosition: .top)
        view.setupTitle(as: "Prowadzący")
        view.setupLeftAccessory(named: "human_Studies")
        view.setAction = { self.onPressPushLecturersVC() }
        return view
    }()
    
    // Row no. 5 - "Moje kierunki"
    private lazy var rowNo5: RowView = {
        let view = RowView(style: .withLeftAccessory,
                           separatorPosition: .topAndBottom)
        view.setupTitle(as: "Moje kierunki")
        view.setupLeftAccessory(named: "studies_Studies")
        view.setAction = { self.onPressPushMyFieldsOfStudiesVC() }
        return view
    }()
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Constraints
    
    private func setupConstraints() {
        
        // ScrollView
        scrollView.snp.makeConstraints { (make) in
            make.top.equalTo(tabBatTitle.snp.bottom).offset(10)
            make.bottom.equalTo(safeAreaLayoutGuide)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
        
        // Content View
        contentView.snp.makeConstraints { (make) in
            make.top.equalTo(scrollView)
            make.bottom.equalTo(scrollView)
            make.left.equalTo(scrollView)
            make.right.equalTo(scrollView)
            make.width.equalTo(self.snp.width)
        }
        
        // TabBar Title
        tabBatTitle.snp.makeConstraints { (make) in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(topPadding)
            make.centerX.equalTo(safeAreaLayoutGuide)
        }
        
        // Title Image
        titleImage.snp.makeConstraints { (make) in
            make.top.equalTo(scrollView.snp.top).offset(screenHeight * 0.02)
            make.left.equalToSuperview().offset(leftMargin)
        }
        
        // Main Title
        mainTitle.snp.makeConstraints { (make) in
            make.left.equalTo(titleImage.snp.right).offset(15)
            make.centerY.equalTo(titleImage)
        }
        
        // Separator no. 1
        separatorNo1.snp.makeConstraints { (make) in
            make.top.equalTo(titleImage.snp.bottom).offset(spacing)
            make.width.equalToSuperview()
        }
        
        // Section Title
        sectionTitle.snp.makeConstraints { (make) in
            make.top.equalTo(separatorNo1.snp.bottom).offset(spacing)
            make.left.equalToSuperview().offset(leftMargin)
        }
        
        // Classes TabelView
        classesTabelView.snp.makeConstraints { (make) in
            make.top.equalTo(sectionTitle.snp.bottom).offset(spacing)
            make.width.equalToSuperview()
        }
        
        // StackView Content
        stackViewContent.snp.makeConstraints { (make) in
            make.top.equalTo(classesTabelView.snp.bottom).offset(spacing)
            make.width.equalToSuperview()
            make.bottom.equalTo(contentView.snp.bottom).offset(bottomPadding)
        }
        
    }
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Selectors
    
    @objc private func onPressExpandClassesTV() {
        
        classesTabelView.snp.updateConstraints { (update) in
            if isClassesTableViewExpand == false {
                update.height.equalTo(StudiesViewController.cellNumber * ClassesCell.cellHeight)
                isClassesTableViewExpand = true
            } else {
                update.height.equalTo(3 * ClassesCell.cellHeight)
                isClassesTableViewExpand = false
            }
        }
        self.setNeedsLayout()
        UIView.animate(withDuration: 0.5, animations: {
            self.layoutIfNeeded()
        })
        
    }
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Actions
    
    private func onPressPushScheduleVC() {
        pushScheduleVC?()
    }
    
    private func onPressPushAssessmentVC() {
        pushAssessmentVC?()
    }
    
    private func onPressPushSyllabusVC() {
        pushSyllabusVC?()
    }
    
    private func onPressPushLecturersVC() {
        pushLecturersVC?()
    }
    
    private func onPressPushMyFieldsOfStudiesVC() {
        pushMyFieldsOfStudiesVC?()
    }
    
}

extension StudiesView {
    
    func setMoreButton() {
        
        if (StudiesViewController.cellNumber > 3) {
            
            contentView.addSubview(moreButton)
            isClassesTableViewExpand = false
            
            moreButton.snp.makeConstraints { (make) in
                make.centerX.equalTo(safeAreaLayoutGuide)
                make.top.equalTo(classesTabelView.snp.bottom)
                make.width.equalTo(50)
                make.height.equalTo(20)
            }
            
            stackViewContent.snp.remakeConstraints { (remake) in
                remake.top.equalTo(moreButton.snp.bottom).offset(spacing * 2/5)
                remake.width.equalToSuperview()
                remake.bottom.equalTo(contentView.snp.bottom).offset(bottomPadding)
            }
            
            classesTabelView.snp.makeConstraints { (make) in
                make.height.equalTo(3 * ClassesCell.cellHeight)
            }
            
        } else {
            
            classesTabelView.snp.makeConstraints { (make) in
                make.height.equalTo(StudiesViewController.cellNumber * ClassesCell.cellHeight)
            }
            
        }

    }
    
}

extension StudiesView: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("scrolled")
    }
    
}
