//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.

import UIKit

class HomeTabBarController: UITabBarController {
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupControllers()
        self.setupUI()
    }
}

extension HomeTabBarController {
    
    // MARK: - Setups
    private func setupControllers() {
        viewControllers = [createDummyViewController(
            withTitle: NSLocalizedString("TabBar_ForYou", comment: ""),
            andImageName: "for_you_active",
            for: ForYouViewController()),
                           createDummyViewController(
                            withTitle: NSLocalizedString("TabBar_Studies", comment: ""),
                            andImageName: "studies_active",
                            for: StudiesViewController()),
                           createDummyViewController(
                            withTitle: NSLocalizedString("TabBar_Maps", comment: ""),
                            andImageName: "maps_active",
                            for: MapsViewController()),
                           createDummyNavigationController(
                            withTitle: NSLocalizedString("TabBar_Informations", comment: ""),
                            andImageName: "info_active",
                            for: InformationsViewController()),
                           createDummyNavigationController(
                            withTitle: NSLocalizedString("TabBar_Settings", comment: ""),
                            andImageName: "me_active",
                            for: LoginPageViewController())]
    }
    
    private func setupUI() {
        /// TabBar background color
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
    
    // MARK: - View Controllers Factories
    private func createDummyViewController(withTitle title: String,
                                           andImageName imageName: String,
                                           for viewController: UIViewController) -> UIViewController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = UIImage(named: imageName)
        return viewController
    }
    
    private func createDummyNavigationController(withTitle title: String,
                                                 andImageName imageName: String,
                                                 for viewController: UIViewController) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.tabBarItem.title = title
        navigationController.tabBarItem.image = UIImage(named: imageName)
        navigationController.navigationBar.tintColor = .mainRed
        return navigationController
    }
}
