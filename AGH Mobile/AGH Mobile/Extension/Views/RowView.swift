//
//  RowView.swift
//  AGH Mobile
//
//  Created by Mateusz Bąk on 03/05/2019.
//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.
//

// ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
// MARK: - Import

import UIKit
import SnapKit

// ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
// MARK: - Implementation

final class RowView: UIView {
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Instance Variables
    
    private let x: CGFloat = 5
    
    enum Style {
        case normal
    }
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Init

    required init(style: Style = .normal){
        super.init(frame: CGRect.zero)
        
        switch style {
        case .normal: setupNormalStyle()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Setups
    
    private func setupNormalStyle() {
        self.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        self.addSubview(title)
        self.addSubview(rightImage)
        self.setupNormalStyleConstraints()
    }
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Public Methods
    
    public func setupTitle(as name: String) {
        title.text = name
    }
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Components of View
    
    // Title
    private lazy var title: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.text = "Error" // Chow if not use setupTitle method
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        return label
    }()
    
    // Right Image
    private lazy var rightImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        image.backgroundColor = .red
        return image
    }()
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Constraints
    
    private func setupNormalStyleConstraints() {
        // Title
        title.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.top).offset(x)
            make.left.equalTo(self.snp.left)
            make.bottom.equalTo(self.snp.bottom).offset(-x)
        }
        
        // Right Image
        rightImage.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.top).offset(x)
            make.right.equalTo(self.snp.right).offset(-5)
            make.bottom.equalTo(self.snp.bottom).offset(-x)
            make.height.equalTo(25)
            make.width.equalTo(25)
        }
    }

}
