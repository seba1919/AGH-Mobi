//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.

import UIKit

class InformationsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    private let staffArray = ["Kowalski", "Kowalewski", "Kowalkowski"]
    private var staffTableView: UITableView!
    var searchBar: UISearchBar = UISearchBar()
    
    var filteredStaffArray = [String]()
    
    /*         TU JEST PODMIENIONY VIEW                        */
    // MARK: - Private properties
    private var infromationsView: SkOsView { return self.view as! SkOsView }
    
    // MARK: - Lifecycle
    override func loadView() {
        self.view = SkOsView(frame: UIScreen.main.bounds)
    }
    /*         TU JEST PODMIENIONY VIEW                        */
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.infromationsView.setupUI()
        
        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height

        navigationItem.searchController = UISearchController(searchResultsController: nil)
        staffTableView = UITableView(frame: CGRect(x: 0, y: barHeight, width: displayWidth,
                                                height: displayHeight - barHeight))
        staffTableView.register(UITableViewCell.self, forCellReuseIdentifier: "staffCell")
        staffTableView.dataSource = self
        staffTableView.delegate = self
        searchBar.searchBarStyle = UISearchBar.Style.prominent
        searchBar.placeholder = " Search..."
        searchBar.sizeToFit()
        searchBar.isTranslucent = false
        searchBar.delegate = self
        filteredStaffArray = staffArray
        self.view.addSubview(staffTableView)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.setupNavigationAttributs()
    }
    
    // MARK: - TableView
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Num: \(indexPath.row)")
        print("Value: \(filteredStaffArray[indexPath.row])")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredStaffArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "staffCell", for: indexPath) as UITableViewCell
        cell.textLabel?.text = filteredStaffArray[indexPath.row]
        return cell
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        // When there is no text, filteredData is the same as the original data
        // When user has entered text into the search box
        // Use the filter method to iterate over all items in the data array
        // For each item, return true if the item should be included and false if the
        // item should NOT be included
        print("type")
        filteredStaffArray = searchText.isEmpty ? staffArray : staffArray.filter { (item: String) -> Bool in
            // If dataItem matches the searchText, return true to include it
            return item.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
        }
        staffTableView.reloadData()
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
            self.searchBar.showsCancelButton = true
        print("begin")
    }
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool{
        print("begin")
        return true
        
    }

}

extension InformationsViewController {
    /*
    // MARK: - Setup
    private func setupNavigationAttributs() {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }*/
    
    private func setupNavigationAttributs() {
        self.navigationItem.title = "Pracownicy AGH"
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
}
