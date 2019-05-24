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
    public static let cellNumber = 9 //CHANGE!
    
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
        return cell
    }
    
}

// Delegate
extension StudiesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(ClassesCell.cellHeight)
    }
    
}
