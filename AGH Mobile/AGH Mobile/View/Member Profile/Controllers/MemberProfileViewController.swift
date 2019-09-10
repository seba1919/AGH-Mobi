//
//  MemberProfileViewController.swift
//  AGH Mobile
//
//  Created by Mateusz Bąk on 01/05/2019.
//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.
//

// ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
// MARK: - Import

import UIKit

// ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
// MARK: - Implementation

class MemberProfileViewController: UIViewController {

    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Instance Variables

    // View
    private var memberProfileView: MemberProfileView { return self.view as! MemberProfileView }
    // Table View
    private let cellNumber = 3 //CHANGE!
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        self.view = MemberProfileView(frame: UIScreen.main.bounds)
    }
    
    override func viewDidLoad() {
        self.memberProfileView.setupUI()
        self.setupTableView()
        self.setupNavigationAttributs()
    }
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Setup
    
    private func setupTableView() {
        memberProfileView.memberWebPages.delegate = self
        memberProfileView.memberWebPages.dataSource = self
        memberProfileView.memberWebPages.register(MemberWebPagesCell.self, forCellReuseIdentifier: MemberWebPagesCell.identifier)
        memberProfileView.memberWebPages.allowsSelection = false
        memberProfileView.setupImage(named: "user_large_About")
    }
    
    private func setupNavigationAttributs() {
        self.navigationItem.title = "Robb Stark"
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
}

// ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
// MARK: - Extension of UITableView

// Date Source
extension MemberProfileViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellNumber
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MemberWebPagesCell.identifier, for: indexPath) as! MemberWebPagesCell
        return cell
    }
    
}

// Delegate
extension MemberProfileViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return MemberWebPagesCell.cellHeight
    }
    
}
