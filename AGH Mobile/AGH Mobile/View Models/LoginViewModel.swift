//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.

import Foundation

protocol LoginViewModelDelegate: class {
    func viewModel(_ viewModel: LoginViewModel, isLoading: Bool)
    func viewModelUpdate(_ viewModel: LoginViewModel)
}

class LoginViewModel {
    
    // MARK: - Dependencies
    weak var delegate: LoginViewModelDelegate?
    private let coordinator: LoginPageCoordinator
    private let model: WDRouterNetworking

    // MARK: - Sign in response handlers
    private var handleSingInSuccess: (() -> Void)!
    private var handlecredentialsFailiture: (() -> Void)!
    private var handleServerFailiture: (() -> Void)!
    private var handleMissingLoginCredentials: (() -> Void)!
    
    init(coordinator: LoginPageCoordinator) {
        self.coordinator = coordinator
        self.model = WDRouterNetworking()
    }
    
    public func setupActionHandlers(forSignIn signInHandler: @escaping (() -> Void),
                                    forCredentialsFailiture credentialsFailitureHandler: @escaping (() -> Void),
                                    forServerFailiture serverFailitureHanlder: @escaping (() -> Void),
                                    forMissingLoginCredentials
        missingLoginCredentialsHandler: @escaping (() -> Void)) {
        self.handleSingInSuccess = signInHandler
        self.handlecredentialsFailiture = credentialsFailitureHandler
        self.handleServerFailiture = serverFailitureHanlder
        self.handleMissingLoginCredentials = missingLoginCredentialsHandler
    }
    
    public func signIn(withUserWDLogin login: String,
                       withUserWDPassword password: String,
                       completion: @escaping () -> Void) {

        if login.isEmpty || password.isEmpty {
            handleMissingLoginCredentials()
            completion()
            return
        }
        
        WDRouterNetworking()
            .performWDLoginAction(userLogin: login,
                                  userPassword: password) { response in
                switch response {
                case .success:
                    self.coordinator.signIn()
                    self.handleSingInSuccess()
                case .credentialsFailiture:
                    self.handlecredentialsFailiture()
                case .serverFailiture:
                    self.handleServerFailiture()
                }
                completion()
        }
    }
    
    public func showAboutUs() {
        coordinator.showAboutUs()
    }
}
