//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.

import UIKit

class MemberProfileViewController: UIViewController {

    // MARK: - Private Properties
    private var memberProfileView: MemberProfileView { return self.view as! MemberProfileView }
    private let cellNumber = 3 //CHANGE!
    
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
    
}

extension MemberProfileViewController {
    
    // MARK: - Setup
    private func setupTableView() {
        memberProfileView.memberWebPagesTableView.delegate = self
        memberProfileView.memberWebPagesTableView.dataSource = self
        memberProfileView.memberWebPagesTableView.register(MemberWebPagesCell.self,
                                                  forCellReuseIdentifier: MemberWebPagesCell.identifier)
        memberProfileView.memberWebPagesTableView.allowsSelection = false
        memberProfileView.setupMemberImage("user_large_About")
    }
    
    private func setupNavigationAttributs() {
        self.navigationItem.title = "Robb Stark"
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
}

// MARK: - Extension of TableView Data Source
extension MemberProfileViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellNumber
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MemberWebPagesCell.identifier,
                                                 for: indexPath) as! MemberWebPagesCell
        return cell
    }
    
}

// MARK: - Extension of TableView Delegate
extension MemberProfileViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return MemberWebPagesCell.cellHeight
    }
    
}
