//
//  ClassCardViewController.swift
//  AGH Mobile
//
//  Created by Macbook on 18/09/2019.
//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.
//

import UIKit

class ClassCardViewController: UIViewController {
    
    // MARK: - Private properties
    private var classCardView: ClassCardView { return view as! ClassCardView }
    
    // MARK: - Lifecycle
    override func loadView() {
        view = ClassCardView(frame: UIScreen.main.bounds)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.classCardView.setupUI()
        self.setupData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.setupNavigationAttributs()
    }
    
    private func setupNavigationAttributs() {
        self.navigationItem.title = "Karta Zajęć"
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        let rightBarButton = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(rightBarButtonItemTapped))
        rightBarButton.title = "Edycja"
        self.navigationItem.rightBarButtonItem = rightBarButton
    }
    
    private func setupData() {
        classCardView.setupSubjectName(as: "Bazy Danych")
        classCardView.setupSubjectTypeName(as: "Wykład")
        classCardView.setupClassHours(on: "Poniedziałek 9.30-11.00")
        classCardView.setupGroupName(as: "Grupa W")
        classCardView.setupTeacherName(as: "prof.dr.hab.Jan Kowalski")
        classCardView.setupBuildingName(as: "Budynek C2")
        classCardView.setupClassroomNumber(as: "224")
        classCardView.setupECTSNumber(as: "4ECTS")
    }

    
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Actions
    
    @objc private func rightBarButtonItemTapped() {
        print("Edycja")
    }
    
}
