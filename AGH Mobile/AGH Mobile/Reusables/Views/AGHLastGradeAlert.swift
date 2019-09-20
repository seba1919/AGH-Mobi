//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.

// MARK: - Imports
import UIKit

// MARK: - Implementation
class AGHLastGradeAlert {

    // MARK: - Private properties
    private let AGHLastGradeAlert: UIView
    private lazy var screenHeight = AGHLastGradeAlert.frame.height
    private lazy var screenWidth = AGHLastGradeAlert.frame.width

    
    // MARK: - Components of View
    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.textAlignment = .left
        titleLabel.font = UIFont.systemFont(ofSize: 11, weight: .medium)
        titleLabel.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
//        titleLabel.backgroundColor = .gray
        return titleLabel
    }()
    
    private lazy var gradeLabel: UILabel = {
        let gradeLabel = UILabel()
        gradeLabel.textAlignment = .center
        gradeLabel.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        gradeLabel.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
//        gradeLabel.backgroundColor = .black
        return gradeLabel
    }()
    
    private lazy var subjectLabel: UILabel = {
        let subjectLabel = UILabel()
        subjectLabel.textAlignment = .center
        subjectLabel.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        subjectLabel.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
//        subjectLabel.backgroundColor = .blue
        return subjectLabel
    }()
    
    private lazy var classTypeWithDateLabel: UILabel = {
        let subjectLabel = UILabel()
        subjectLabel.textAlignment = .center
        subjectLabel.font = UIFont.systemFont(ofSize: 10, weight: .medium)
        subjectLabel.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        subjectLabel.numberOfLines = 0
//        subjectLabel.backgroundColor = .green
        return subjectLabel
    }()
    
    private lazy var arrowImageView: UIImageView = {
        let arrowImageView = UIImageView()
        arrowImageView.image = UIImage(named: "arrow_right")
        arrowImageView.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
//        subjectLabel.backgroundColor = .blue
        return arrowImageView
    }()
    
    // MARK: - Init
    init(title: String, grade: Double, subject: String, date: Date, classType: String) {
        AGHLastGradeAlert = UIView()
        AGHLastGradeAlert.backgroundColor = .mainRed
        titleLabel.text = title
        gradeLabel.text = String(grade)
        subjectLabel.text = subject
        classTypeWithDateLabel.text = "\(classType)\n\(date)"
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
        AGHLastGradeAlert.addSubview(gradeLabel)
        AGHLastGradeAlert.addSubview(subjectLabel)
        AGHLastGradeAlert.addSubview(classTypeWithDateLabel)
        AGHLastGradeAlert.addSubview(arrowImageView)

    }
    
    // MARK: - Setup Constraints
    private func setupConstraints() {
        
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalTo(AGHLastGradeAlert.snp.left).offset(20)
            make.right.equalTo(AGHLastGradeAlert.snp.right).multipliedBy(0.5)
            make.height.equalTo(AGHLastGradeAlert.snp.height).multipliedBy(0.5)
        }
        
        gradeLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(-15)
            make.left.equalTo(titleLabel.snp.left)
            make.width.equalTo(gradeLabel.snp.height)
            make.bottom.equalToSuperview()
        }
        
        subjectLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(-15)
            make.left.equalTo(gradeLabel.snp.right)
            make.right.equalTo(classTypeWithDateLabel.snp.left)
//            make.width.equalTo(titleLabel.snp.width)
            make.bottom.equalToSuperview()
        }
        
        arrowImageView.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-10)
            make.height.equalTo(titleLabel.snp.height).multipliedBy(0.5)
            make.width.equalTo(arrowImageView.snp.height).multipliedBy(0.75)
        }
        
        classTypeWithDateLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.right.equalTo(arrowImageView.snp.left).offset(-5)
            make.width.equalTo(gradeLabel.snp.width).multipliedBy(2)
            make.bottom.equalToSuperview()
        }
    }
}
