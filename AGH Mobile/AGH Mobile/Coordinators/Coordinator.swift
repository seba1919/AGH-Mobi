//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.

import UIKit
/// Coordinators are an archirecture layer (Coordinators Design Pattern) that is responsible
/// for separating out whole the navigation between views to the abstraction that is called ,,coordinators".
///
/// Why we do that?
/// ================
/// It gives us a lot of freedom to modificate or even totally exchange old views to their reworked versions.
/// Coordinators also makes navigation easier as you can see on examples below
///
/// So our mission is to separate out navigation from our view controllers,
/// so none of them know about each other.
/// We need to know only three things:
/// - How to implement `coordinator` for a `view controller`?
/// - How to use in `view controller`?
/// - How to dealocate coordinator from coordinators' stack (`childCoordinators`)?
///
/// How to implement coordinator for a view controller?
/// ==========================================================
/// First of all every coordinator must conform to `Coordinator` protocol.
/// The only exceptions from this rule are root view controllers, that are attached to bottom tabBar tabs.
/// `start()` method is responsible initializing it's designated `view controller`,
/// asigning `coordinator` (to make using `coordinator`'s navigation methods possible)
/// and pushing the `view controller` to a display.
///
///  Example implementation:
/// ```
/// func start() {
///     let viewController = AboutUsViewController()
///     viewController.coordinator = self
///     navigationController.pushViewController(viewController, animated: true)
/// }
/// ```
/// Example method with implemented pattern how to navigate to an another `view controller`.
/// In our coordinator we implement method to initialize `coordinator` which governs `view controller`,
/// that we need to push to a display. You can save it's parent `coordinator` if you need
///
/// Example implementation:
/// ```
/// func showAboutUs() {
///     let child = AboutUsCoordinator(navigationController: self.navigationController)
///     child.parentCoordinator = self // *not required
///     childCoordinators.append(child) // save in coordinators "stack"
///     child.start() //initialize AboutUsCoordinator's view controller and push to a display
/// }
/// ```
///
///
/// How to use in a view controller?
/// ==============================
/// To a new controller add an instance property
/// ```
/// weak var coordinator: SettingsCoordinator?
/// ```
/// Now we can use navigation methods, that are implemented for our `view controller` in it's coordinator!
/// Those methods will open designated `view controller`
/// ```
/// coordinator?.showAboutUs()
/// ```
///
/// How to dealocate coordinator from coordinators' stack (`childCoordinators`)?
/// =========================================
/// When we pop out view controller, we neeed to dealocate it's coordinator form parent coordinator's stack.
/// To do that, we use Coordinator's method `childDidFinish()`
///
///
/// After sign in, we need to pop out `LoginVC` (which is pushed over `SettingsVC`).
/// We need to implement in `LoginPageCoordinator`:
/// ```
/// func signIn() {
///       navigationController.popViewController(animated: true) //dismissing VC
///       parentCoordinator?.childDidFinish(self) //removing from parent stack, here parent is SettingsCoordinator
/// }
protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }

    func start()
}

extension Coordinator {
    //Method that removes coordinator from a coordinators "stack". Should be applied at popping out a view controller
    func childDidFinish(_ child: Coordinator?) {
        for (index, coordinator) in childCoordinators.enumerated() where coordinator === child {
            childCoordinators.remove(at: index)
            break
        }
    }
}

// To make initialization of start method optional
extension Coordinator {
    func start() {}
}
