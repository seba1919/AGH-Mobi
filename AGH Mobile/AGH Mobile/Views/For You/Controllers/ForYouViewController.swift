//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.

import UIKit

class ForYouViewController: UIViewController {

    // MARK: - Private properties
    private var forYouView: GradesView { return view as! GradesView }
    
    // MARK: - Lifecycle
    override func loadView() {
        view = GradesView(frame: UIScreen.main.bounds)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.forYouView.setupUI()
        setupTableView()
    }
    
    fileprivate func setupTableView() {
        forYouView.gradesTableView.delegate = self
        forYouView.gradesTableView.dataSource = self
        registerCell()
    }
    
}


extension ForYouViewController: UITableViewDelegate, UITableViewDataSource {
    
    func registerCell() {
        forYouView.gradesTableView.register(AGHGradesCell.self, forCellReuseIdentifier: AGHGradesCell.cellIdentifier)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AGHGradesCell.cellIdentifier) as? AGHGradesCell else { return UITableViewCell() }
        cell.backgroundColor = .red
        return cell
    }
    
    
}

