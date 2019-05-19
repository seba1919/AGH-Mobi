//
//  FacultyDetailViewController.swift
//  AGH Mobile
//
//  Created by Bartosz Kunat on 19/05/2019.
//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.
//

// ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
// MARK: - Import

import UIKit
import SnapKit

// ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
// MARK: - Implementation

class FacultyDetailViewController: UIViewController {
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - UI components
    
    var tableView: UITableView!
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Instance properties
    
    var dummyTableViewData = [
        [
            FacultyDetailTableViewCellDummyViewModel(title: "Automatyka i robotyka"),
            FacultyDetailTableViewCellDummyViewModel(title: "robotyka i robotyka"),
            FacultyDetailTableViewCellDummyViewModel(title: "Automatyka i robotyka"),
            FacultyDetailTableViewCellDummyViewModel(title: "robotyka i robotyka"),
            FacultyDetailTableViewCellDummyViewModel(title: "Automatyka i robotyka"),
            FacultyDetailTableViewCellDummyViewModel(title: "robotyka i robotyka")
        ],
        [
            FacultyDetailTableViewCellDummyViewModel(title: "Automatyka i robotyka"),
            FacultyDetailTableViewCellDummyViewModel(title: "robotyka i robotyka"),
            FacultyDetailTableViewCellDummyViewModel(title: "Automatyka i robotyka"),
            FacultyDetailTableViewCellDummyViewModel(title: "robotyka i robotyka"),
            FacultyDetailTableViewCellDummyViewModel(title: "Automatyka i robotyka"),
            FacultyDetailTableViewCellDummyViewModel(title: "robotyka i robotyka")
        ]
    ]
    var dummyFacultyTitle = "EAIiIB"
    var dummySectionTitles = [
        "STACJONARNE STUDIA I STOPNIA",
        "STACJONARNE STUDIA II STOPNIA"
    ]
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpView()
        setUpNavController()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let selectedRowIndexPath = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: selectedRowIndexPath, animated: false)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - View setup
    
    private func setUpView() {
        tableView = UITableView(frame: .zero, style: .grouped)
        tableView.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(FacultyDetailTableViewCell.self, forCellReuseIdentifier: FacultyDetailTableViewCell.reuseIdentifier)
        tableView.register(FacultyDetailTableViewHeader.self, forHeaderFooterViewReuseIdentifier: FacultyDetailTableViewHeader.reuseIdentifier)
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    private func setUpNavController() {
        navigationController?.setNavigationBarHidden(false, animated: false)
        navigationItem.title = "Syllabus"
        
        // Back button
        let backItem = UIBarButtonItem()
        backItem.title = "Kierunki"
        navigationItem.backBarButtonItem = backItem
        
        // Right bar button
        let rightBarButton = UIBarButtonItem()
        rightBarButton.target = self
        rightBarButton.action = #selector(rightBarButtonItemTapped)
        rightBarButton.title = "2018/19"
        navigationItem.rightBarButtonItem = rightBarButton
    }
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Actions
    
    @objc private func rightBarButtonItemTapped() {
        #warning("Implement picker view")
    }
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Helpers
    
    
}

extension FacultyDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return dummyTableViewData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dummyTableViewData[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FacultyDetailTableViewCell.reuseIdentifier) as? FacultyDetailTableViewCell else {
            return UITableViewCell()
        }
        let vm = dummyTableViewData[indexPath.section][indexPath.row]
        cell.viewModel = vm
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: FacultyDetailTableViewHeader.reuseIdentifier) as? FacultyDetailTableViewHeader else {
            return UITableViewHeaderFooterView()
        }
        
        headerView.isFirstSectionHeader = section == 0 ? true : false
        if headerView.isFirstSectionHeader {
            headerView.titleLbl.text = dummyFacultyTitle
        }
        headerView.subtitleLbl.text = dummySectionTitles[section]
        return headerView
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = StudyProgramViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
