//
//  StudyProgramViewController.swift
//  AGH Mobile
//
//  Created by Bartosz Kunat on 19/05/2019.
//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.
//

// ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
// MARK: - Import

import UIKit
import SpriteKit

// ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
// MARK: - Implementation

class StudyProgramViewController: UIViewController {
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Instance Variables
    
    let dummySectionTitles = [
        "JEZYK OBCY",
        "OBIERALNE",
        "POZOSTALE PODSTAWOWE",
        "SPECJALNOSCIOWE II"
    ]
    
    let dummyTableViewDataSouce = [
        [
            StudyProgramTableViewCellDummyViewModel(ects: 3, courseName: "Ocena oddzialywaniu na srodowisko", courseType: "Wyklad", totalHours: 30, hasExam: true),
            StudyProgramTableViewCellDummyViewModel(ects: 3, courseName: "Zanieczyszczenia atmosfery wod i gleby", courseType: "Cwicznia laboratoryjne", totalHours: 30, hasExam: false),
            StudyProgramTableViewCellDummyViewModel(ects: 3, courseName: "Ocena oddzialywaniu na srodowisko", courseType: "Wyklad", totalHours: 30, hasExam: true),
            StudyProgramTableViewCellDummyViewModel(ects: 3, courseName: "Zanieczyszczenia atmosfery wod i gleby", courseType: "Cwicznia laboratoryjne", totalHours: 30, hasExam: false),
            StudyProgramTableViewCellDummyViewModel(ects: 3, courseName: "Ocena oddzialywaniu na srodowisko", courseType: "Wyklad", totalHours: 30, hasExam: true),
            StudyProgramTableViewCellDummyViewModel(ects: 3, courseName: "Zanieczyszczenia atmosfery wod i gleby", courseType: "Cwicznia laboratoryjne", totalHours: 30, hasExam: false)
        ],
        [
            StudyProgramTableViewCellDummyViewModel(ects: 3, courseName: "Ocena oddzialywaniu na srodowisko", courseType: "Wyklad", totalHours: 30, hasExam: true),
            StudyProgramTableViewCellDummyViewModel(ects: 3, courseName: "Zanieczyszczenia atmosfery wod i gleby", courseType: "Cwicznia laboratoryjne", totalHours: 30, hasExam: false),
            StudyProgramTableViewCellDummyViewModel(ects: 3, courseName: "Ocena oddzialywaniu na srodowisko", courseType: "Wyklad", totalHours: 30, hasExam: true),
            StudyProgramTableViewCellDummyViewModel(ects: 3, courseName: "Zanieczyszczenia atmosfery wod i gleby", courseType: "Cwicznia laboratoryjne", totalHours: 30, hasExam: false),
            StudyProgramTableViewCellDummyViewModel(ects: 3, courseName: "Ocena oddzialywaniu na srodowisko", courseType: "Wyklad", totalHours: 30, hasExam: true),
            StudyProgramTableViewCellDummyViewModel(ects: 3, courseName: "Zanieczyszczenia atmosfery wod i gleby", courseType: "Cwicznia laboratoryjne", totalHours: 30, hasExam: false)
        ],
        [
            StudyProgramTableViewCellDummyViewModel(ects: 3, courseName: "Ocena oddzialywaniu na srodowisko", courseType: "Wyklad", totalHours: 30, hasExam: true),
            StudyProgramTableViewCellDummyViewModel(ects: 3, courseName: "Zanieczyszczenia atmosfery wod i gleby", courseType: "Cwicznia laboratoryjne", totalHours: 30, hasExam: false),
            StudyProgramTableViewCellDummyViewModel(ects: 3, courseName: "Ocena oddzialywaniu na srodowisko", courseType: "Wyklad", totalHours: 30, hasExam: true),
            StudyProgramTableViewCellDummyViewModel(ects: 3, courseName: "Zanieczyszczenia atmosfery wod i gleby", courseType: "Cwicznia laboratoryjne", totalHours: 30, hasExam: false),
            StudyProgramTableViewCellDummyViewModel(ects: 3, courseName: "Ocena oddzialywaniu na srodowisko", courseType: "Wyklad", totalHours: 30, hasExam: true),
            StudyProgramTableViewCellDummyViewModel(ects: 3, courseName: "Zanieczyszczenia atmosfery wod i gleby", courseType: "Cwicznia laboratoryjne", totalHours: 30, hasExam: false)
        ],
        [
            StudyProgramTableViewCellDummyViewModel(ects: 3, courseName: "Ocena oddzialywaniu na srodowisko", courseType: "Wyklad", totalHours: 30, hasExam: true),
            StudyProgramTableViewCellDummyViewModel(ects: 3, courseName: "Zanieczyszczenia atmosfery wod i gleby", courseType: "Cwicznia laboratoryjne", totalHours: 30, hasExam: false),
            StudyProgramTableViewCellDummyViewModel(ects: 3, courseName: "Ocena oddzialywaniu na srodowisko", courseType: "Wyklad", totalHours: 30, hasExam: true),
            StudyProgramTableViewCellDummyViewModel(ects: 3, courseName: "Zanieczyszczenia atmosfery wod i gleby", courseType: "Cwicznia laboratoryjne", totalHours: 30, hasExam: false),
            StudyProgramTableViewCellDummyViewModel(ects: 3, courseName: "Ocena oddzialywaniu na srodowisko", courseType: "Wyklad", totalHours: 30, hasExam: true),
            StudyProgramTableViewCellDummyViewModel(ects: 3, courseName: "Zanieczyszczenia atmosfery wod i gleby", courseType: "Cwicznia laboratoryjne", totalHours: 30, hasExam: false)
        ],
    ]
    
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - UI components
    
    var tableView: UITableView!
    var semesterSwitcher: SemesterSwitcherView!
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - View setup
    
    private func setUpView() {
        view.backgroundColor = .white
        
        // Semester switcher
        semesterSwitcher = SemesterSwitcherView(frame: .zero)
        semesterSwitcher.addTargetToLeftButton(self,
                                               action: #selector(leftSwitcherBtnTapped),
                                               for: .touchUpInside)
        semesterSwitcher.addTargetToRightButton(self,
                                                action: #selector(rightSwitcherBtnTapped),
                                                for: .touchUpInside)
        view.addSubview(semesterSwitcher)
        semesterSwitcher.snp.makeConstraints { (make) in
            make.left.greaterThanOrEqualToSuperview()
            make.right.lessThanOrEqualToSuperview()
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(30)
        }
        
        // Table view
        tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(StudyProgramTableViewCell.self, forCellReuseIdentifier: StudyProgramTableViewCell.reuseIdentifier)
        tableView.register(StudyProgramTableViewHeader.self, forHeaderFooterViewReuseIdentifier: StudyProgramTableViewHeader.reuseIdentifier)
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.top.equalTo(semesterSwitcher.snp.bottom).offset(20)
            make.bottom.equalToSuperview()
        }
    }
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Actions
    
    @objc private func leftSwitcherBtnTapped() {
        print("Left btn pressend")
    }
    
    @objc private func rightSwitcherBtnTapped() {
        print("Left btn pressend")
    }
}

extension StudyProgramViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return dummySectionTitles.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dummyTableViewDataSouce[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: StudyProgramTableViewCell.reuseIdentifier) as? StudyProgramTableViewCell else {
            return UITableViewCell()
        }
        
        return cell 
    }
    
    
}
