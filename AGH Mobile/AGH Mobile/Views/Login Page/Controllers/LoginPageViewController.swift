//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.

import UIKit

class LoginPageViewController: UIViewController {
    
    // MARK: Instance properties
    var viewModel: LoginViewModel
    // Private
    private var loginPageView: LoginPageView { return view as! LoginPageView }
    private let remindPasswordWebURL = "https://dziekanat.agh.edu.pl/OdzyskiwanieHasla.aspx"
    
    init(with loginViewModel: LoginViewModel) {
        self.viewModel = loginViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    override func loadView() {
        view = LoginPageView(frame: UIScreen.main.bounds)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSignInHandlers()
        loginPageView.setupUI()
        setupActions()
        hideKeyboardWhenTappedAround()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupNavigationAttributs()
    }
    
    fileprivate func setupSignInHandlers() {
        let signInHandler = { CustomNotifications.showLoginSuccessAlert() }
        let credentialFailitureHandler = { CustomNotifications.showLoginFailitureAlert() }
        let serverFailitureHanlder = { CustomNotifications.showServerConnectionFailtureAlert() }
        let missingLoginCredentials = {
            self.loginPageView.loginButton.shake()
            CustomNotifications.setupAlertOnMissingLoginCredentials()
            
        }
        viewModel.setupActionHandlers(forSignIn: signInHandler,
                                      forCredentialsFailiture: credentialFailitureHandler,
                                      forServerFailiture: serverFailitureHanlder,
                                      forMissingLoginCredentials: missingLoginCredentials)
    }
}

extension LoginPageViewController: LoginViewModelDelegate {
    func viewModel(_ viewModel: LoginViewModel, isLoading: Bool) { }
    func viewModelUpdate(_ viewModel: LoginViewModel) { }
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
            self.viewModel.showAboutUs()
        }
        
        loginPageView.pushSettingsVC = {
            guard let userWDLogin = self.loginPageView.idTextField.text else { return }
            guard let userWDPassword = self.loginPageView.passwordTextField.text else { return }
            self.loginPageView.loginButton.isUserInteractionEnabled = false
            self.viewModel.signIn(withUserWDLogin: userWDLogin,
                                  withUserWDPassword: userWDPassword) {
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
