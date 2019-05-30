//
//  LoginPageViewController.swift
//  AGH Mobile
//
//  Created by Mateusz Bąk on 07/05/2019.
//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.
//

// ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
// MARK: - Import

import UIKit

// ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
// MARK: - Implementation

class LoginPageViewController: UIViewController {
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Instance Variables
    
    // View
    private var loginPageView: LoginPageView { return self.view as! LoginPageView }
    private let remindPasswordWebURL = "https://dziekanat.agh.edu.pl/OdzyskiwanieHasla.aspx"
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Lifecycle
    
    override func loadView() {
        self.view = LoginPageView(frame: UIScreen.main.bounds)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loginPageView.setupUI()
        self.setupActions()
        self.hideKeyboardWhenTappedAround()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.setupNavigationAttributs()
    }
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Setup
    
    private func setupNavigationAttributs() {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Actions
    
    private func setupActions() {
        
        loginPageView.pushAboutAsVC = {
            self.navigationController?.pushViewController(AboutAsViewController(), animated: true)
        }
        
        loginPageView.pushUserVC = {
            self.navigationController?.pushViewController(BuildingViewController(), animated: true)
        }
        
        loginPageView.openRemindPasswordWeb = {
            if let url = URL(string: self.remindPasswordWebURL) {
                UIApplication.shared.open(url)
            }
        }
        
    }
    
}

// ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
// MARK: - Extension of Hide Keyboard When Tapped Around

extension LoginPageViewController {
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
}

// ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
// MARK: - Extension of TextFiled Delegate

extension LoginPageViewController: UITextFieldDelegate {
    
}
