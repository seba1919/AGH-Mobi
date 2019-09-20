//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.

// MARK: - Imports
import UIKit

// MARK: - Implementation
class GradesView: UIView {

    private lazy var screenHeight = self.frame.height
    private lazy var screenWidth = self.frame.width
    private lazy var topPadding = self.frame.height * 0.0225
    
    private lazy var gradesScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return scrollView
    }()
    
    private lazy var lastGradeContainer: UIView = {
        let view = AGHLastGradeAlert(title: NSLocalizedString("GradesView_LastGrade", comment: ""),
                                     grade: 5.0,
                                     subject: "Inżynieria Oprogramowania",
                                     date: Date(),
                                     classType: "Kolokwium").build()
        return view
    }()
    
    private lazy var termButton: UIButton = {
        let button = UIButton()
        button.setTitle("Semestr 5", for: .normal)
        button.titleLabel?.textAlignment = .left
        button.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        button.setImage(UIImage(named: "arrow_down"), for: .normal)
        button.semanticContentAttribute = .forceRightToLeft
        return button
    }()
    
    private lazy var segmentedControl: AGHSegmentedControl = {
        let items = [NSLocalizedString("GradesView_PartialGrades", comment: ""),
                     NSLocalizedString("GradesView_FinalGrades", comment: "")]
        let control = AGHSegmentedControl(configuration: items)
//        control..backgroundColor = .brown
        return control
    }()
    
    private(set) lazy var gradesTableView: UITableView = {
        let tableView = UITableView()
        tableView.tableFooterView = UIView()
        return tableView
    }()
    
    private lazy var overallView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension GradesView {
    
    // MARK: - Setup View
    public func setupUI() {
        setupView()
        setupConstraints()
    }
    
    private func setupView() {
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        addSubview(gradesScrollView)
        gradesScrollView.addSubview(lastGradeContainer)
        gradesScrollView.addSubview(termButton)
        gradesScrollView.addSubview(segmentedControl)
        gradesScrollView.addSubview(gradesTableView)
        gradesScrollView.addSubview(overallView)
    }
    
    // MARK: - Setup Constraints
    private func setupConstraints() {
        
        gradesScrollView.snp.makeConstraints { (make) in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
        }
        
        lastGradeContainer.snp.makeConstraints { (make) in
            make.top.equalTo(gradesScrollView.snp.top)
            make.width.equalToSuperview()
            make.height.equalTo(Double(screenHeight) * SettingsView.userProfileHightMultipliValue)
        }
        
        termButton.snp.makeConstraints { (make) in
            make.top.equalTo(lastGradeContainer.snp.bottom).offset(topPadding)
            make.left.equalTo(safeAreaLayoutGuide.snp.left)
            make.width.equalTo(Double(screenWidth) * 0.5)
            make.height.equalTo(Double(screenHeight) * SettingsView.userProfileHightMultipliValue)
        }
        
        segmentedControl.snp.makeConstraints { (make) in
            make.top.equalTo(termButton.snp.bottom).offset(topPadding)
            make.centerX.equalTo(safeAreaLayoutGuide.snp.centerX)
            make.width.equalTo(gradesScrollView.snp.width).multipliedBy(0.5)
            make.height.equalTo(Double(screenHeight) * SettingsView.userProfileHightMultipliValue * 0.5)
        }
        
        gradesTableView.snp.makeConstraints { (make) in
            make.top.equalTo(segmentedControl.snp.bottom).offset(topPadding)
            make.width.equalToSuperview()
            make.height.equalTo(Double(screenHeight) * 0.7)
        }
        
        overallView.snp.makeConstraints { (make) in
            make.top.equalTo(gradesTableView.snp.bottom)
            make.width.equalToSuperview()
            make.bottom.equalTo(gradesScrollView.snp.bottom)
            make.height.equalTo(Double(screenHeight) * SettingsView.userProfileHightMultipliValue * 2)
        }
    }
}
