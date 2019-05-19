//
//  FacultiesViewController.swift
//  AGH Mobile
//
//  Created by Bartosz Kunat on 19/05/2019.
//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.
//

// ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
// MARK: - Import

import UIKit

// ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
// MARK: - Implementation

class FacultiesViewController: UIViewController {
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - UI components
    
    var tableView: UITableView!
    
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Instance properties
    
    var tableViewDataSource: [FacultiesTableViewCellDummyViewModel] = [
        FacultiesTableViewCellDummyViewModel(title: "EAiIB", subtitle: "Elektrotechniki, Automatyki i Inżynierii Biomedycznej"),
        FacultiesTableViewCellDummyViewModel(title: "EAiIB", subtitle: "Elektrotechniki, Automatyki i Inżynierii Biomedycznej"),
        FacultiesTableViewCellDummyViewModel(title: "EAiIB", subtitle: "Elektrotechniki, Automatyki i Inżynierii Biomedycznej"),
        FacultiesTableViewCellDummyViewModel(title: "EAiIB", subtitle: "Elektrotechniki, Automatyki i Inżynierii Biomedycznej"),
        FacultiesTableViewCellDummyViewModel(title: "EAiIB", subtitle: "Elektrotechniki, Automatyki i Inżynierii Biomedycznej"),
        FacultiesTableViewCellDummyViewModel(title: "EAiIB", subtitle: "Elektrotechniki, Automatyki i Inżynierii Biomedycznej"),
        FacultiesTableViewCellDummyViewModel(title: "EAiIB", subtitle: "Elektrotechniki, Automatyki i Inżynierii Biomedycznej"),
        FacultiesTableViewCellDummyViewModel(title: "EAiIB", subtitle: "Elektrotechniki, Automatyki i Inżynierii Biomedycznej"),
        FacultiesTableViewCellDummyViewModel(title: "EAiIB", subtitle: "Elektrotechniki, Automatyki i Inżynierii Biomedycznej")
    ]
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpView()
        setUpNavController()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let selectedRowIndexPath = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: selectedRowIndexPath, animated: false)
        }
        toggleTitle()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        toggleTitle()
    }
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - View setup
    
    private func setUpView() {
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(FacultiesTableViewCell.self, forCellReuseIdentifier: FacultiesTableViewCell.reuseIdentifier)
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    private func setUpNavController() {
        navigationController?.setNavigationBarHidden(false, animated: false)
        navigationItem.title = "Syllabus"
        
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
    
    private func toggleTitle() {
        title = self.title == "Syllabus" ? "Wydziały" : "Syllabus"
    }
}

extension FacultiesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewDataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FacultiesTableViewCell.reuseIdentifier) as? FacultiesTableViewCell else {
            return UITableViewCell()
        }
        
        let cellData = tableViewDataSource[indexPath.row]
        cell.viewModel = cellData
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = FacultyDetailViewController()
        // Pass data to the next VC

        self.navigationController?.pushViewController(vc, animated: true)
    }
}
