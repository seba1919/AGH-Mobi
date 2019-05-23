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
    var pickerView: ToolbarPickerView!
    var rightBarButton: UIBarButtonItem!
    
    // Text field used only to act as an input view the picker view
    var dummyTxtField: UITextField!
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Instance properties
    
    let pickerViewData = ["2017/18", "2018/19", "2019/20"]
    
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
        setUpPickerView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let selectedRowIndexPath = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: selectedRowIndexPath, animated: false)
        }
    }
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - View setup
    
    private func setUpView() {
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(FacultiesTableViewCell.self, forCellReuseIdentifier: FacultiesTableViewCell.reuseIdentifier)
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    private func setUpPickerView() {
        pickerView = ToolbarPickerView()
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.toolbarDelegate = self
    }
    
    private func setUpNavController() {
        navigationController?.setNavigationBarHidden(false, animated: false)
        navigationItem.title = "Syllabus"
        
        // Back button
        let backItem = UIBarButtonItem()
        backItem.title = "Wydziały"
        navigationItem.backBarButtonItem = backItem
        
        // Right bar button
        rightBarButton = UIBarButtonItem()
        rightBarButton.target = self
        rightBarButton.action = #selector(rightBarButtonItemTapped)
        rightBarButton.title = "2018/19"
        navigationItem.rightBarButtonItem = rightBarButton
    }
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Actions
    
    @objc private func rightBarButtonItemTapped()  {
        // Using a dummy text field is the easiest way to present a picker view with a toolbar
        dummyTxtField = UITextField(frame: .zero)
        view.addSubview(dummyTxtField)
        
        dummyTxtField.inputView = pickerView
        dummyTxtField.inputAccessoryView = pickerView.toolbar
        dummyTxtField.becomeFirstResponder()
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

extension FacultiesViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.pickerViewData.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.pickerViewData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        rightBarButton.title = self.pickerViewData[row]
    }
}

extension FacultiesViewController: ToolbarPickerViewDelegate {
    func didTapDone() {
        let row = self.pickerView.selectedRow(inComponent: 0)
        self.pickerView.selectRow(row, inComponent: 0, animated: false)
        rightBarButton.title = self.pickerViewData[row]
        dummyTxtField.resignFirstResponder()
    }
    
    func didTapCancel() {
        dummyTxtField.resignFirstResponder()
    }
}
