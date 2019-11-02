//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.

import UIKit

class LoginPageViewController: UIViewController {
    
    // MARK: Instance properties
    weak var coordinator: LoginPageCoordinator?
    // Private
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
            WUHTMLParser.getGradesFrom()
        }
        
        loginPageView.pushSettingsVC = {
            guard let userWDLogin = self.loginPageView.idTextField.text else { return}
            guard let userWDPassword = self.loginPageView.passwordTextField.text else { return}
            if userWDLogin.isEmpty || userWDPassword.isEmpty {
                self.loginPageView.loginButton.shake()
                CustomNotifications.setupAlertOnMissingLoginCredentials()
                return
            }
            self.loginPageView.loginButton.isUserInteractionEnabled = false
            WDRouterNetworking()
                .performWDLoginAction(userLogin: userWDLogin,
                                      userPassword: userWDPassword) { isLoggedIn in
                if isLoggedIn == .success {
                    CustomNotifications.setupAlertOnLoginSuccess()
                    self.coordinator?.signIn()
                } else if isLoggedIn == .credentialsFailiture {
                    CustomNotifications.setupAlertOnLoginFailiture()
                }
                self.loginPageView.loginButton.isUserInteractionEnabled = true
            }
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
