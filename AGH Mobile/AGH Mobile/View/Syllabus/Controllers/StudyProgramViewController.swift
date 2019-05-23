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
            StudyProgramTableViewCellDummyViewModel(ects: 3, courseName: "Rownania Rozniczkowe", lecturesTotalHours: 30, auditoriumTotalHours: 20, labsTotalHours: 10, seminaryTotalHour: 10, hasExam: true),
            StudyProgramTableViewCellDummyViewModel(ects: 3, courseName: "Przedmiot w jezyku obcym", lecturesTotalHours: 30, auditoriumTotalHours: nil, labsTotalHours: nil, seminaryTotalHour: nil, hasExam: false),
            StudyProgramTableViewCellDummyViewModel(ects: 3, courseName: "Innowacyjnosc w odlewnictwie i gornictwie", lecturesTotalHours: 30, auditoriumTotalHours: nil, labsTotalHours: nil, seminaryTotalHour: nil, hasExam: true),
            StudyProgramTableViewCellDummyViewModel(ects: 3, courseName: "Rownania Rozniczkowe", lecturesTotalHours: 30, auditoriumTotalHours: nil, labsTotalHours: nil, seminaryTotalHour: nil, hasExam: false)
        ],
        [
            StudyProgramTableViewCellDummyViewModel(ects: 3, courseName: "Symulacja systemow dynamicznych i orania gleby", lecturesTotalHours: 30, auditoriumTotalHours: nil, labsTotalHours: nil, seminaryTotalHour: nil, hasExam: true),
            StudyProgramTableViewCellDummyViewModel(ects: 3, courseName: "Rownania Rozniczkowe", lecturesTotalHours: 30, auditoriumTotalHours: nil, labsTotalHours: nil, seminaryTotalHour: nil, hasExam: true),
            StudyProgramTableViewCellDummyViewModel(ects: 3, courseName: "Rownania Rozniczkowe", lecturesTotalHours: 30, auditoriumTotalHours: nil, labsTotalHours: nil, seminaryTotalHour: nil, hasExam: true),
            StudyProgramTableViewCellDummyViewModel(ects: 3, courseName: "Rownania Rozniczkowe", lecturesTotalHours: 30, auditoriumTotalHours: nil, labsTotalHours: nil, seminaryTotalHour: nil, hasExam: true)
        ],
        [
            StudyProgramTableViewCellDummyViewModel(ects: 3, courseName: "Rownania Rozniczkowe", lecturesTotalHours: 30, auditoriumTotalHours: nil, labsTotalHours: nil, seminaryTotalHour: nil, hasExam: true),
            StudyProgramTableViewCellDummyViewModel(ects: 3, courseName: "Rownania Rozniczkowe", lecturesTotalHours: 30, auditoriumTotalHours: nil, labsTotalHours: nil, seminaryTotalHour: nil, hasExam: true),
            StudyProgramTableViewCellDummyViewModel(ects: 3, courseName: "Rownania Rozniczkowe", lecturesTotalHours: 30, auditoriumTotalHours: nil, labsTotalHours: nil, seminaryTotalHour: nil, hasExam: true),
            StudyProgramTableViewCellDummyViewModel(ects: 3, courseName: "Rownania Rozniczkowe", lecturesTotalHours: 30, auditoriumTotalHours: nil, labsTotalHours: nil, seminaryTotalHour: nil, hasExam: true)
        ],
        [
            StudyProgramTableViewCellDummyViewModel(ects: 3, courseName: "Rownania Rozniczkowe", lecturesTotalHours: 30, auditoriumTotalHours: nil, labsTotalHours: nil, seminaryTotalHour: nil, hasExam: true),
            StudyProgramTableViewCellDummyViewModel(ects: 3, courseName: "Matematyka dyskretna i rownianai rozniczkowe z elementami wychowania fizycznego", lecturesTotalHours: 30, auditoriumTotalHours: nil, labsTotalHours: nil, seminaryTotalHour: nil, hasExam: true),
            StudyProgramTableViewCellDummyViewModel(ects: 3, courseName: "Rownania Rozniczkowe", lecturesTotalHours: 30, auditoriumTotalHours: nil, labsTotalHours: nil, seminaryTotalHour: nil, hasExam: true),
            StudyProgramTableViewCellDummyViewModel(ects: 3, courseName: "Rownania Rozniczkowe", lecturesTotalHours: 30, auditoriumTotalHours: nil, labsTotalHours: nil, seminaryTotalHour: nil, hasExam: true)
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
        tableView = UITableView(frame: .zero, style: .grouped)
        tableView.backgroundColor = .white
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.register(StudyProgramTableViewCell.self, forCellReuseIdentifier: StudyProgramTableViewCell.reuseIdentifier)
        tableView.register(StudyProgramTableViewHeader.self, forHeaderFooterViewReuseIdentifier: StudyProgramTableViewHeader.reuseIdentifier)
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.top.equalTo(semesterSwitcher.snp.bottom).offset(10)
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
        cell.viewModel = dummyTableViewDataSouce[indexPath.section][indexPath.row]
        
        // Remove separator if it's last cell in the section
        if indexPath.row == tableView.numberOfRows(inSection: indexPath.section) - 1 {
            cell.separatorView.isHidden = true
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: StudyProgramTableViewHeader.reuseIdentifier) as? StudyProgramTableViewHeader else {
            return UIView()
        }
        header.sectionTitle = dummySectionTitles[section]
        return header 
    }
}
