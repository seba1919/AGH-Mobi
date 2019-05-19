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
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
        }
    }
    
    private func setUpNavController() {
        navigationController?.setNavigationBarHidden(false, animated: false)
        navigationItem.title = "Syllabus"
        navigationItem.backBarButtonItem?.title = "Wróć"
//        navigationItem.backBarButtonItem?.title = "Wróć"
//        let backItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: nil)
//        navigationItem.setLeftBarButton(backItem, animated: false)
        
        let rightBarButton = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(rightBarButtonItemTapped))
        rightBarButton.title = "2018/19"
        navigationController?.navigationItem.rightBarButtonItem = rightBarButton
    }
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Actions
    
    @objc private func rightBarButtonItemTapped() {
        print("wassup")
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
}
