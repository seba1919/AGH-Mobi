//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.

import UIKit

final class TabBarPageTitleLabel {
    
    // MARK: - Private properties
    private let tabBarPageTitle: UILabel
    
    // MARK: - Init
    init(title: String) {
        tabBarPageTitle = UILabel()
        tabBarPageTitle.text = title
        self.setupLayout()
    }
    
    // MARK: - Setup
    private func setupLayout() {
        tabBarPageTitle.translatesAutoresizingMaskIntoConstraints = false
        tabBarPageTitle.textAlignment = .center
        tabBarPageTitle.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        tabBarPageTitle.textColor = .black
    }
}

extension TabBarPageTitleLabel {
    
    // MARK: - Public methods
    public func build() -> UILabel {
        return tabBarPageTitle
    }
}
