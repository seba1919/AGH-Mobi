//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.

import UIKit

final class SectionTitle {
    
    // MARK: - Private properties
    private let sectionTitle: UILabel
    
    // MARK: - Init
    init(title: String) {
        sectionTitle = UILabel()
        sectionTitle.text = title
        self.setupLayout()
    }
    
    // MARK: - Setup
    private func setupLayout() {
        sectionTitle.translatesAutoresizingMaskIntoConstraints = false
        sectionTitle.textAlignment = .left
        sectionTitle.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        sectionTitle.textColor = .customGrayText
    }
}

extension SectionTitle {
    
    // MARK: - Public methods
    public func build() -> UILabel {
        return sectionTitle
    }
}
