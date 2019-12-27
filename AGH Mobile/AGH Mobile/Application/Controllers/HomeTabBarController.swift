//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.

import UIKit

class HomeTabBarController: UITabBarController {
    
    // MARK: - Coordinators
    let forYou = ForYouCoordinator(navigationController: UINavigationController())
    let studies = StudiesCoordinator(navigationController: UINavigationController())
    let maps = MapsCoordinator(navigationController: UINavigationController())
    let informations = InformationsCoordinator(navigationController: UINavigationController())
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let loginPageVC = LoginPageViewController()
        loginPageVC.tabBarItem.title = NSLocalizedString("TabBar_Settings", comment: "")
        loginPageVC.tabBarItem.image = UIImage(named: "settings_inactive")
        loginPageVC.tabBarItem.selectedImage = UIImage(named: "settings_active")
        let vc4 = UINavigationController(rootViewController: loginPageVC)
        vc4.navigationBar.tintColor = .mainRed
        
        viewControllers = [forYou.navigationController,
                           studies.navigationController,
                           maps.navigationController,
                           informations.navigationController,
                           vc4]
        self.setupTabBarStyling()
    }
}

extension HomeTabBarController {
    
    // MARK: - Setup tabBar styling
    private func setupTabBarStyling() {
        // TabBar background color
        self.tabBar.backgroundColor = .customLightGray
        /// TabBar tint color
        self.tabBar.tintColor = .mainRed
        /// Setups for each items in TabBar
        if let items = self.tabBar.items {
            for item in items {
                /// Text attributes for normal state
                item.setTitleTextAttributes([
                    NSAttributedString.Key.font: UIFont.systemFont(ofSize: 10.5),
                    NSAttributedString.Key.foregroundColor: UIColor.customDarkGray
                    ], for: .normal)
                /// Text attributes for selected state
                item.setTitleTextAttributes([
                    NSAttributedString.Key.font: UIFont.systemFont(ofSize: 10.5),
                    NSAttributedString.Key.foregroundColor: UIColor.mainRed
                    ], for: .selected)
            }
        }
    }
}
