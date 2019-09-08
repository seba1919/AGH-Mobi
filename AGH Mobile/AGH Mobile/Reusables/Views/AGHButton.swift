//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.

import UIKit
import SnapKit

final class AGHButton {
 
    // MARK: - Private properties
    private let AGHButton: UIButton
    
    // MARK: - Init
    init(title: String) {
        AGHButton = UIButton(type: .system)
        AGHButton.setTitle(title, for: .normal)
        self.setupLayout()
    }
    
    // MARK: - Setups
    private func setupLayout() {
        self.setupConstraintsAndCornerRadius()
        AGHButton.translatesAutoresizingMaskIntoConstraints = false
        AGHButton.backgroundColor = .mainRed
        AGHButton.setTitleColor(.white, for: .normal)
        AGHButton.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        AGHButton.titleLabel?.textAlignment = .center
    }
    
    private func setupConstraintsAndCornerRadius() {
        var height: CGFloat = 26
        
        if UIScreen.isSmallSize() {
            height = 17
            AGHButton.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        } else if UIScreen.isMediumSize() {
            height = 22
        } else if UIScreen.isLargeSize() {
            height = 24
        } else if UIScreen.isBigSize() {
            height = 26
        }
        AGHButton.snp.makeConstraints { (make) in
            make.height.equalTo(height * 2)
        }
        AGHButton.layer.cornerRadius = height
    }
}

extension AGHButton {
    
    // MARK: - Public Methods
    public func addTarget(_ target: Any?, action: Selector, for event: UIControl.Event) -> Self {
        AGHButton.addTarget(target, action: action, for: event)
        return self
    }
    
    public func build() -> UIButton {
        return AGHButton
    }
}
