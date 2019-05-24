//
//  StudiesViewController.swift
//  AGH Mobile
//
//  Created by Mateusz Bąk on 28/03/2019.
//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.
//

// ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
// MARK: - Import

import UIKit

// ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
// MARK: - Implementation

class StudiesViewController: UIViewController {

    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Instance Variables
    
    // View
    private var studiesView: StudiesView { return self.view as! StudiesView }
    // Table View
    public static let cellNumber = 7 //CHANGE!
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Lifecycle
    
    override func loadView() {
        self.view = StudiesView(frame: UIScreen.main.bounds)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNavigationAttributs()
        self.studiesView.setupUI()
        self.setupTableView()
        self.setupActions()
    }
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Setup
    
    private func setupTableView() {
        studiesView.classesTabelView.delegate = self
        studiesView.classesTabelView.dataSource = self
        studiesView.classesTabelView.register(ClassesCell.self, forCellReuseIdentifier: ClassesCell.identifier)
    }
    
    private func setupNavigationAttributs() {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Actions
    
    private func setupActions() {
        studiesView.pushScheduleVC = {  }
        studiesView.pushAssessmentVC = {  }
        studiesView.pushSyllabusVC = {  }
        studiesView.pushLecturersVC = {  }
        studiesView.pushMyFieldsOfStudiesVC = {  }
    }
    
}

// ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
// MARK: - Extension of UITableView

// Data Source
extension StudiesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return StudiesViewController.cellNumber
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ClassesCell.identifier, for: indexPath) as! ClassesCell
        
        var ShortcutNameOfType = ["LAB", "ĆL", "W", "A", "ĆL", "W", "A"]
        var NameOfActivities = ["Bazy danych", "Programowanie współbierzne", "Lingwistyka formalna", "Programowanie współbierzne i asbdbas asdasdsd", "Programowanie współbierzne", "Lingwistyka formalna", "Programowanie współbierzne i asbdbas asdasdsd"]
        var TimeOfActivities = ["8:00 - 9:30", "12:30 - 14:00", "14:00 - 15:30", "18:30 - 20:00", "12:30 - 14:00", "14:00 - 15:30", "18:30 - 20:00"]
        var PlaceOfActivities = ["C-2 208", "C-2 315", "C-2 224", "B-1 015", "C-2 315", "C-2 224", "B-1 015"]
        var CountingDownOfActivities = ["Trwa", "Za 4 godziny", "Za 5 godzin", "Za 10 godzin", "Za 4 godziny", "Za 5 godzin", "Za 10 godzin"]
        
        cell.setShortcutNameOfType(to: ShortcutNameOfType[indexPath.row])
        cell.setNameOfActivities(to: NameOfActivities[indexPath.row])
        cell.setTimeOfActivities(to: TimeOfActivities[indexPath.row])
        cell.setPlaceOfActivities(to: PlaceOfActivities[indexPath.row])
        cell.setCountingDownOfActivities(to: CountingDownOfActivities[indexPath.row])
        
        return cell
    }
    
}

// Delegate
extension StudiesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(ClassesCell.cellHeight)
    }
    
}
