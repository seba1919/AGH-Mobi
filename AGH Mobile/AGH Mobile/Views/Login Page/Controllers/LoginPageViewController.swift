//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.

import UIKit

class LoginPageViewController: UIViewController {
    
    // MARK: - Instance properties
    weak var coordinator: LoginPageCoordinator?
    // MARK: Private properties
    private var loginPageView: LoginPageView { return view as! LoginPageView }
    private let remindPasswordWebURL = "https://dziekanat.agh.edu.pl/OdzyskiwanieHasla.aspx"
    
    // MARK: - Lifecycle
    override func loadView() {
        view = LoginPageView(frame: UIScreen.main.bounds)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginPageView.setupUI()
        setupActions()
        hideKeyboardWhenTappedAround()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupNavigationAttributs()
    }
    
}

extension LoginPageViewController {
    
    // MARK: - Setup
    private func setupNavigationAttributs() {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }

    // MARK: - Hide Keyboard When Tapped Around
    private func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self,
                                                                 action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    // MARK: - Actions
    private func setupActions() {
        loginPageView.pushAboutUsVC = {
            self.coordinator?.showAboutUs()
        }
        
        loginPageView.pushSettingsVC = {
            self.coordinator?.signIn()
        }
        
        loginPageView.openRemindPasswordWeb = {
            if let url = URL(string: self.remindPasswordWebURL) {
                UIApplication.shared.open(url)
            }
        }
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
    
}

// MARK: - Extension of TextFiled Delegate
extension LoginPageViewController: UITextFieldDelegate {
    
}
