//
//  UserViewController.swift
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

class UserViewController: UIViewController {

    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Instance Variables
    
    var userView: UserView { return self.view as! UserView }
    
    private let tempbutton = TemporaryButton(title: "Temporary go to about as!")
        .addTarget(self, action: #selector(nextButtonActionHandler(_:)), for: .touchUpInside)
        .build()
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Lifecycle
    
    override func loadView() {
        self.view = UserView(frame: UIScreen.main.bounds)
        setupUI()
    }
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Action handlers
    
    @objc private func nextButtonActionHandler(_ sender: UIButton) {
        navigationController?.pushViewController(AboutAsViewController(), animated: true)
    }
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Setup
    
    func setupUI() {
        view.addSubview(tempbutton)

        NSLayoutConstraint.activate([
            tempbutton.bottomAnchor.constraint(equalTo: userView.safeAreaLayoutGuide.bottomAnchor, constant: -36),
            tempbutton.widthAnchor.constraint(equalToConstant: 250),
            tempbutton.heightAnchor.constraint(equalToConstant: 50),
            tempbutton.centerXAnchor.constraint(equalTo: userView.safeAreaLayoutGuide.centerXAnchor),
            ])
    }
    
}
