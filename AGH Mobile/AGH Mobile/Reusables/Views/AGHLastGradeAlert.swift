//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.

// MARK: - Imports
import UIKit

// MARK: - Implementation
class AGHLastGradeAlert {

    // MARK: - Private properties
    private let AGHLastGradeAlert: UIView
    
    // MARK: - Components of View
    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.textAlignment = .left
        titleLabel.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        titleLabel.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        return titleLabel
    }()
    
    // MARK: - Init
    init(title: String, grade: Double, subject: String, date: Date, classType: String) {
        AGHLastGradeAlert = UIView()
        AGHLastGradeAlert.backgroundColor = .mainRed
        titleLabel.text = title
        AGHLastGradeAlert.addSubview(titleLabel)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AGHLastGradeAlert {
    
    // MARK: - Public methods
    public func build() -> UIView {
        return AGHLastGradeAlert
    }
    
    // MARK: - Setup View
    public func setupUI() {
        setupView()
        setupConstraints()
    }
    
    private func setupView() {
        AGHLastGradeAlert.addSubview(titleLabel)
    }
    
    // MARK: - Setup Constraints
    private func setupConstraints() {
        
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(AGHLastGradeAlert.snp.top)
            make.left.equalTo(AGHLastGradeAlert.snp.left)
            make.bottom.equalTo(AGHLastGradeAlert.snp.bottom)
            make.right.equalTo(AGHLastGradeAlert.snp.right)
        }
    }
}
