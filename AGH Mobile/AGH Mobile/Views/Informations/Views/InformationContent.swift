//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.

import UIKit
import SnapKit

class InformationContent: UIView {
    
    // MARK: - Private properties
    private lazy var screenHeight = UIScreen.main.bounds.size.height
    private lazy var screenWidth =  UIScreen.main.bounds.size.width
    
    // MARK: - Components of View
    /// Sylabus
    private lazy var sylabusRowView: RowView = {
        let view = RowView(style: .withLeftAccessory,
                           separatorPosition: .top)
        view.setupTitle(as: NSLocalizedString("InformationsContent_Syllabus", comment: ""))
        view.setupLeftAccessory(named: "book_Info")
        return view
    }()
    
    /// Pracownicy Uczelni
    private lazy var employeesRowView: RowView = {
        let view = RowView(style: .withLeftAccessory,
                           separatorPosition: .top)
        view.setupTitle(as: NSLocalizedString("InformationsContent_UniversityEmployees", comment: ""))
        view.setupLeftAccessory(named: "human_Info")
        return view
    }()
    
    /// Regulamin Studiów
    private lazy var regulationsRowView: RowView = {
        let view = RowView(style: .withLeftAccessory,
                           separatorPosition: .top)
        view.setupTitle(as: NSLocalizedString("InformationsContent_UniversityStatute", comment: ""))
        view.setupLeftAccessory(named: "sheets_Info")
        return view
    }()
    
    /// Rok Akademicki
    private lazy var academicYearRowView: RowView = {
        let view = RowView(style: .withLeftAccessory,
                           separatorPosition: .topAndBottom)
        view.setupTitle(as: NSLocalizedString("InformationsContent_AcademicYear", comment: ""))
        view.setupLeftAccessory(named: "calendar_Info")
        return view
    }()
    
    /// StackView
    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        stack.spacing = 0.0
        return stack
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension InformationContent {
    
    // MARK: - Setup view methods
    private func setupUI() {
        setupView()
        setupConstraints()
    }
    
    private func setupView() {
        self.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        setupStackView()
    }
    
    private func setupStackView() {
        stackView.addArrangedSubview(sylabusRowView)
        stackView.addArrangedSubview(employeesRowView)
        stackView.addArrangedSubview(regulationsRowView)
        stackView.addArrangedSubview(academicYearRowView)
        self.addSubview(stackView)
    }
    
    // MARK: - Setup Constraints
    private func setupConstraints() {
        stackView.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.top)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(self.snp.bottom)
        }
    }
}
