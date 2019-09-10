//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    // MARK: - Instance Variables
    var window: UIWindow?

    // MARK: - Application methods
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = HomeTabBarController()
        window?.makeKeyAndVisible()
        
        return true
    }
}
