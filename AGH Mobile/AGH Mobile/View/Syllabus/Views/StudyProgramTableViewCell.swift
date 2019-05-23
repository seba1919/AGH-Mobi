//
//  StudyProgramTableViewCell.swift
//  AGH Mobile
//
//  Created by Bartosz Kunat on 20/05/2019.
//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.
//

import UIKit

class StudyProgramTableViewCell: UITableViewCell {

    private struct Constants {
        static let horizontalPadding: CGFloat = 24
        static let horizontalSpacing: CGFloat = 14
        static let verticalPadding: CGFloat = 16
        static let verticalSpacing: CGFloat = 2
        static let stackViewSpacing: CGFloat = 4
        
        static let headlineFontSize: CGFloat = 26
        static let titleFontSize: CGFloat = 18
        static let subtitileFontSize: CGFloat = 14
    }
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Static Variables
    
    static let reuseIdentifier: String = {
        return String.init(describing: self)
    }()
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Instance properties
    
    var viewModel: StudyProgramTableViewCellDummyViewModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            courseTitleLbl.text = viewModel.courseName

            numberOfEctsLbl.text = "\(viewModel.ects)"
            
            if let lecturesTotalHours = viewModel.lecturesTotalHours {
            lecturesTotalHoursLbl.text = "\(lecturesTotalHours) godz."
                lecturesTotalHoursLbl.sizeToFit()
            }
            
            if let auditoriumTotalHours = viewModel.auditoriumTotalHours {
                auditoriumExercisesTotalHoursLbl.text = "\(auditoriumTotalHours) godz."
            }
            
            if let labsTotalHours = viewModel.labsTotalHours {
                laboratoryExercisesTotalHoursLbl.text = "\(labsTotalHours) godz."
            }
            
            if let auditoriumTotalHours = viewModel.auditoriumTotalHours {
                auditoriumExercisesTotalHoursLbl.text = "\(auditoriumTotalHours) godz."
            }
            
            if let seminaryTotalHours = viewModel.seminaryTotalHour {
                seminarClassesTotalHoursLbl.text = "\(seminaryTotalHours) godz."
            }
            
            examContrainerView.isHidden = !viewModel.hasExam
            separatorView.isHidden = false
        }
    }
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - UI components
    
    private var numberOfEctsLbl: UILabel!
    
    private var courseTitleLbl: UILabel!
    private var mainVerticalStackView: UIStackView!
    private var mainHorizontalStackView: UIStackView!
    
    private var lecturesTotalHoursLbl: UILabel!
    private var lecturesHorizontalStackView: UIStackView!
    
    private var auditoriumExercisesTotalHoursLbl: UILabel!
    private var auditoriumHorizontalStackView: UIStackView!
 
    private var laboratoryExercisesTotalHoursLbl: UILabel!
    private var laboratoryHorizontalStackView: UIStackView!

    private var seminarClassesTotalHoursLbl: UILabel!
    private var seminarHorizontalStackView: UIStackView!

    private var examLbl: UILabel!
    private var examContrainerView: UIView!
    
    private var rightArrowImgView: UIImageView!
    
    var separatorView: UIView!
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - View setup
    
    private func setUpView() {
        // ECTS
        let ectsLbl = UILabel()
        ectsLbl.font = UIFont.systemFont(ofSize: Constants.subtitileFontSize, weight: .regular)
        ectsLbl.textColor = .mainRed
        ectsLbl.textAlignment = .center
        ectsLbl.text = "ECTS"
        ectsLbl.sizeToFit()
        ectsLbl.snp.makeConstraints { (make) in
            make.width.equalTo(ectsLbl.frame.width)
        }
        
        numberOfEctsLbl = UILabel()
        numberOfEctsLbl.font = UIFont.systemFont(ofSize: Constants.headlineFontSize, weight: .semibold)
        numberOfEctsLbl.textColor = .mainRed
        numberOfEctsLbl.textAlignment = .center
        
        let ectsStackView = UIStackView(arrangedSubviews: [numberOfEctsLbl, ectsLbl])
        ectsStackView.axis = .vertical
        ectsStackView.alignment = .center
        ectsStackView.distribution = .fill
        addSubview(ectsStackView)
        ectsStackView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(Constants.horizontalPadding)
            make.centerY.equalToSuperview()
            make.top.greaterThanOrEqualToSuperview().priority(.medium)
            make.bottom.lessThanOrEqualToSuperview().priority(.medium)
            make.width.equalTo(ectsLbl.snp.width)
        }
        
        // Right arrow image view
        let arrowImageView = UIImageView(image: #imageLiteral(resourceName: "arrow_right"))
        arrowImageView.contentMode = .scaleAspectFit
        arrowImageView.snp.makeConstraints { (make) in
            make.width.equalTo(arrowImageView.frame.width)
        }
        
        // Exam label
        examLbl = UILabel()
        examLbl.textColor = .white
        examLbl.text = "EGZAMIN"
        examLbl.backgroundColor = #colorLiteral(red: 0.5568594933, green: 0.556866765, blue: 0.5763805509, alpha: 1)
        examLbl.font = UIFont.systemFont(ofSize: Constants.subtitileFontSize, weight: .regular)
        examLbl.sizeToFit()
        examLbl.textAlignment = .center
        examLbl.clipsToBounds = true
        examLbl.snp.makeConstraints { (make) in
            make.width.equalTo(80)
            make.height.equalTo(35)
        }
        examLbl.layer.cornerRadius = examLbl.frame.height / 3
        
        examContrainerView = UIView(frame: .zero)
        examContrainerView.addSubview(examLbl)
        examContrainerView.snp.makeConstraints { (make) in
            make.width.equalTo(80)
        }
        examLbl.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
        }
        
        // Course title label
        courseTitleLbl = UILabel()
        courseTitleLbl.font = UIFont.systemFont(ofSize: Constants.titleFontSize, weight: .regular)
        courseTitleLbl.textColor = #colorLiteral(red: 0.4195489585, green: 0.4117857218, blue: 0.4156306684, alpha: 1)
        courseTitleLbl.numberOfLines = 0
        courseTitleLbl.snp.makeConstraints { (make) in
            make.height.greaterThanOrEqualTo(21.5).priority(.medium)
        }
        
        // Lectures labels
        let lecturesLbl = UILabel()
        lecturesLbl.text = "Wykład"
        lecturesLbl.textColor = .customGrayText
        lecturesLbl.font = UIFont.systemFont(ofSize: Constants.subtitileFontSize, weight: .regular)
        lecturesLbl.sizeToFit()
        lecturesLbl.snp.makeConstraints { (make) in
            make.width.equalTo(lecturesLbl.frame.width)
        }
        
        lecturesTotalHoursLbl = UILabel()
        lecturesTotalHoursLbl.font = UIFont.systemFont(ofSize: Constants.subtitileFontSize, weight: .regular)
        lecturesTotalHoursLbl.textColor = .mainRed
        lecturesTotalHoursLbl.snp.makeConstraints { (make) in
            make.height.equalTo(17).priority(.medium)
        }
        
        lecturesHorizontalStackView = UIStackView(arrangedSubviews: [lecturesLbl, lecturesTotalHoursLbl])
        lecturesHorizontalStackView.axis = .horizontal
        lecturesHorizontalStackView.spacing = Constants.stackViewSpacing
        lecturesHorizontalStackView.distribution = .fillProportionally
        lecturesHorizontalStackView.snp.makeConstraints { (make) in
            make.height.equalTo(lecturesLbl.frame.height).priority(.medium)
        }
        
        #warning("Implment other stack views")
        
        // Main vertival stack view
        mainVerticalStackView = UIStackView(arrangedSubviews: [courseTitleLbl, lecturesHorizontalStackView])
        mainVerticalStackView.axis = .vertical
        mainVerticalStackView.spacing = Constants.stackViewSpacing
        
        // Main horizontal stack view
        mainHorizontalStackView = UIStackView(arrangedSubviews: [mainVerticalStackView, examContrainerView, arrowImageView])
        mainHorizontalStackView.axis = .horizontal
        mainHorizontalStackView.distribution = .fillProportionally
        mainHorizontalStackView.spacing = Constants.stackViewSpacing * 2
        addSubview(mainHorizontalStackView)
        mainHorizontalStackView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(Constants.verticalPadding)
            make.left.equalTo(ectsStackView.snp.right).offset(Constants.horizontalSpacing)
            make.right.equalToSuperview().offset(-Constants.horizontalPadding)
        }
        
        // Separator view
        separatorView = UIView()
        separatorView.backgroundColor = #colorLiteral(red: 0.9293302894, green: 0.929463923, blue: 0.9293010831, alpha: 1)
        addSubview(separatorView)
        separatorView.snp.makeConstraints { (make) in
            make.height.equalTo(1)
            make.left.equalToSuperview().offset(Constants.horizontalPadding)
            make.right.equalToSuperview().offset(-Constants.horizontalPadding)
            make.top.equalTo(mainHorizontalStackView.snp.bottom).offset(Constants.verticalPadding)
            make.bottom.equalToSuperview()
        }
    }
}

// ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
// MARK: - Delete this when view model for Syllabus is available

struct StudyProgramTableViewCellDummyViewModel {
    let ects: Int
    let courseName: String
    let lecturesTotalHours: Int?
    let auditoriumTotalHours: Int?
    let labsTotalHours: Int?
    let seminaryTotalHour: Int?
    let hasExam: Bool
}
