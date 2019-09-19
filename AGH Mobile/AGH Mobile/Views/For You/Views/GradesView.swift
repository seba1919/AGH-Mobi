//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.

// MARK: - Imports
import UIKit

// MARK: - Implementation
class GradesView: UIView {

    
    private lazy var screenHeight = self.frame.height
    private lazy var screenWidth = self.frame.width
    private lazy var topPadding = self.frame.height * 0.0225

    
    private lazy var lastGradeContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .brown
        return view
    }()
    
    private lazy var termButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .brown
        return button
    }()
    
    private lazy var segmentedControl: UISegmentedControl = {
        let control = UISegmentedControl()
        control.backgroundColor = .brown
        return control
    }()
    
    private lazy var gradesTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .brown
        return tableView
    }()
    
    private lazy var overallView: UIView = {
        let view = UIView()
        view.backgroundColor = .brown
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
        addSubview(lastGradeContainer)
        addSubview(termButton)
        addSubview(segmentedControl)
        addSubview(gradesTableView)
        addSubview(overallView)
    }
    
    // MARK: - Setup Constraints
    private func setupConstraints() {
        
        lastGradeContainer.snp.makeConstraints { (make) in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(Double(screenHeight) * SettingsView.userProfileHightMultipliValue)
        }
        
        termButton.snp.makeConstraints { (make) in
            make.top.equalTo(lastGradeContainer.snp.bottom).offset(topPadding)
            make.left.equalTo(safeAreaLayoutGuide.snp.left).offset(20)
            make.width.equalTo(Double(screenWidth) * 0.5)
            make.height.equalTo(Double(screenHeight) * SettingsView.userProfileHightMultipliValue)
        }
        
        segmentedControl.snp.makeConstraints { (make) in
            make.top.equalTo(termButton.snp.bottom).offset(topPadding)
            make.centerX.equalTo(safeAreaLayoutGuide.snp.centerX)
            make.width.equalTo(Double(screenHeight) * SettingsView.userProfileHightMultipliValue * 2)
            make.height.equalTo(Double(screenHeight) * SettingsView.userProfileHightMultipliValue)
        }
        
        overallView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
            make.height.equalTo(Double(screenHeight) * SettingsView.userProfileHightMultipliValue)
        }

        gradesTableView.snp.makeConstraints { (make) in
            make.top.equalTo(segmentedControl.snp.bottom).offset(topPadding)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.bottom.equalTo(overallView.snp.top).offset(-10)
        }
        
    }
}
