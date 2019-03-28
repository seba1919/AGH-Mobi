//
//  HomeTabBarController.swift
//  AGH Mobile
//
//  Created by Mateusz Bąk on 28/03/2019.
//  Copyright © 2019 AGH?. All rights reserved.
//

import UIKit

class HomeTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        viewControllers = [createPartOfTabBarWith(title: "Dla Ciebie", backgroundColor: .orange, for: ForYouViewController()),
                           createPartOfTabBarWith(title: "Studia", backgroundColor: .cyan, for: StudiesViewController()),
                           createPartOfTabBarWith(title: "Mapy", backgroundColor: .gray, for: MapsViewController()),
                           createPartOfTabBarWith(title: "Informacje", backgroundColor: .yellow, for: InformationsViewController()),
                           createPartOfTabBarWith(title: "Użytkownik", backgroundColor: .white, for: UserViewController())]
        
    }
    
    private func createPartOfTabBarWith(title: String, backgroundColor: UIColor, for viewControler: UIViewController) -> UIViewController {
        viewControler.view.backgroundColor = backgroundColor
        viewControler.tabBarItem.title = title
        return viewControler
    }
    
}
