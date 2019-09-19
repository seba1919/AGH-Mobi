//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.

// MARK: - Imports
import UIKit

// MARK: - Implementation
class GradesView: UIView {

    
    private lazy var screenHeight = self.frame.height
    private lazy var screenWidth = self.frame.width
    
    
    private lazy var lastGradeContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .brown
        return view
    }()
    
    private lazy var segmentedControl: UISegmentedControl = {
        let control = UISegmentedControl()
        control.backgroundColor = .brown
        return control
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
        addSubview(segmentedControl)
    }
    
    // MARK: - Setup Constraints
    private func setupConstraints() {
        
        lastGradeContainer.snp.makeConstraints { (make) in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(Double(screenHeight) * SettingsView.userProfileHightMultipliValue)
        }
        
        segmentedControl.snp.makeConstraints { (make) in
            make.top.equalTo(lastGradeContainer.snp.bottom).offset(20)
            make.centerX.equalTo(safeAreaLayoutGuide.snp.centerX)
            make.width.equalTo(Double(screenHeight) * SettingsView.userProfileHightMultipliValue * 2)
            make.height.equalTo(Double(screenHeight) * SettingsView.userProfileHightMultipliValue)
        }
    }
}
