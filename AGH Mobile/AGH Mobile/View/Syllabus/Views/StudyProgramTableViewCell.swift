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
                addWidthConstrainstraint(to: lecturesLbl)
                lecturesHorizontalStackView.isHidden = false
                lecturesTotalHoursLbl.text = "\(lecturesTotalHours) godz."
            } else {
                lecturesHorizontalStackView.isHidden = true
            }
            
            if let auditoriumTotalHours = viewModel.auditoriumTotalHours {
                addWidthConstrainstraint(to: auditoriumExLbl)
                auditoriumHorizontalStackView.isHidden = false
                auditoriumExercisesTotalHoursLbl.text = "\(auditoriumTotalHours) godz."
                auditoriumExercisesTotalHoursLbl.sizeToFit()
            } else {
                auditoriumHorizontalStackView.isHidden = true
            }
            
            if let labsTotalHours = viewModel.labsTotalHours {
                addWidthConstrainstraint(to: laboratoryExLbl)
                laboratoryHorizontalStackView.isHidden = false
                laboratoryExercisesTotalHoursLbl.text = "\(labsTotalHours) godz."
                laboratoryExercisesTotalHoursLbl.sizeToFit()
            } else {
                laboratoryHorizontalStackView.isHidden = true
            }
            
            if let seminaryTotalHours = viewModel.seminaryTotalHour {
                addWidthConstrainstraint(to: seminarClassesLbl)
                seminarHorizontalStackView.isHidden = false
                seminarClassesTotalHoursLbl.text = "\(seminaryTotalHours) godz."
                seminarClassesTotalHoursLbl.sizeToFit()
            } else {
                seminarHorizontalStackView.isHidden = true 
            }
            
            examContrainerView.isHidden = !viewModel.hasExam
            separatorView.isHidden = false
        }
    }
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - View components
    
    private var numberOfEctsLbl: UILabel!
    
    private var courseTitleLbl: UILabel!
    private var mainVerticalStackView: UIStackView!
    private var mainHorizontalStackView: UIStackView!
    
    private var lecturesLbl: UILabel!
    private var lecturesTotalHoursLbl: UILabel!
    private var lecturesHorizontalStackView: UIStackView!
    
    private var auditoriumExLbl: UILabel!
    private var auditoriumExercisesTotalHoursLbl: UILabel!
    private var auditoriumHorizontalStackView: UIStackView!
    
    private var laboratoryExLbl: UILabel!
    private var laboratoryExercisesTotalHoursLbl: UILabel!
    private var laboratoryHorizontalStackView: UIStackView!
    
    private var seminarClassesLbl: UILabel!
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
        
        // Lectures stack view
        lecturesLbl = subtitleLbl(withColor: .customGrayText, andText: "Wykład")
        lecturesTotalHoursLbl = UILabel()
        lecturesTotalHoursLbl.font = UIFont.systemFont(ofSize: Constants.subtitileFontSize, weight: .regular)
        lecturesTotalHoursLbl.textColor = .mainRed
        lecturesTotalHoursLbl.snp.makeConstraints { (make) in
            make.height.equalTo(17).priority(.medium)
        }
        lecturesHorizontalStackView = subtitleLblStackView(for: [lecturesLbl, lecturesTotalHoursLbl])
        
        // Auditorium exercises stack view
        auditoriumExLbl = subtitleLbl(withColor: .customGrayText, andText: "Ćwiczenia audytoryjne")
        auditoriumExercisesTotalHoursLbl = UILabel()
        auditoriumExercisesTotalHoursLbl.font = UIFont.systemFont(ofSize: Constants.subtitileFontSize, weight: .regular)
        auditoriumExercisesTotalHoursLbl.textColor = .mainRed
        auditoriumExercisesTotalHoursLbl.snp.makeConstraints { (make) in
            make.height.equalTo(17).priority(.medium)
        }
        auditoriumHorizontalStackView = subtitleLblStackView(for: [auditoriumExLbl, auditoriumExercisesTotalHoursLbl])
        
        // Laboratory exercises stack view
        laboratoryExLbl = subtitleLbl(withColor: .customGrayText, andText: "Ćwiczenia laboratoryjne")
        laboratoryExercisesTotalHoursLbl = UILabel()
        laboratoryExercisesTotalHoursLbl.font = UIFont.systemFont(ofSize: Constants.subtitileFontSize, weight: .regular)
        laboratoryExercisesTotalHoursLbl.textColor = .mainRed
        laboratoryExercisesTotalHoursLbl.snp.makeConstraints { (make) in
            make.height.equalTo(17).priority(.medium)
        }
        laboratoryHorizontalStackView = subtitleLblStackView(for: [laboratoryExLbl, laboratoryExercisesTotalHoursLbl])
        
        // Seminar classes stack view
        seminarClassesLbl = subtitleLbl(withColor: .customGrayText, andText: "Zajęcia seminaryjne")
        seminarClassesTotalHoursLbl = UILabel()
        seminarClassesTotalHoursLbl.font = UIFont.systemFont(ofSize: Constants.subtitileFontSize, weight: .regular)
        seminarClassesTotalHoursLbl.textColor = .mainRed
        seminarClassesTotalHoursLbl.snp.makeConstraints { (make) in
            make.height.equalTo(17).priority(.medium)
        }
        seminarHorizontalStackView = subtitleLblStackView(for: [seminarClassesLbl, seminarClassesTotalHoursLbl])
        
        // Main vertival stack view
        mainVerticalStackView = UIStackView(arrangedSubviews: [courseTitleLbl, lecturesHorizontalStackView, auditoriumHorizontalStackView, laboratoryHorizontalStackView, seminarHorizontalStackView])
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
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Helpers
    
    private func subtitleLbl(withColor color: UIColor, andText text: String) -> UILabel {
        let lbl = UILabel()
        lbl.text = text
        lbl.textColor = color
        lbl.font = UIFont.systemFont(ofSize: Constants.subtitileFontSize, weight: .regular)
        lbl.sizeToFit()
        return lbl
    }
    
    private func subtitleLblStackView(for labels: [UILabel]) -> UIStackView {
        let sv = UIStackView(arrangedSubviews: labels)
        sv.axis = .horizontal
        sv.spacing = Constants.stackViewSpacing
        sv.distribution = .fillProportionally
        sv.snp.makeConstraints { (make) in
            make.height.equalTo(labels.first!.frame.height).priority(.medium)
        }
        return sv
    }
    
    private func addWidthConstrainstraint(to lbl: UILabel) {
        lbl.sizeToFit()
        lbl.snp.removeConstraints()
        lbl.snp.makeConstraints { (make) in
            make.width.equalTo(lbl.frame.width)
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
