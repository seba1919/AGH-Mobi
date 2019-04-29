//
//  MemberProfile.swift
//  AGH Mobile
//
//  Created by Mateusz Bąk on 22/04/2019.
//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.
//

// ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
// MARK: - Import

import UIKit

// ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
// MARK: - Implementation

class MemberProfile: UIView {
    
    
    
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Components of View:
    
    private let memberPhoto: UIImageView = {
        let image = UIImage(named: "testPersonPhoto")
        let imageView = UIImageView(image: image)
        
        return imageView
    }()
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Constraints
    
    fileprivate func setupConstraints() {
        
        memberPhoto.translatesAutoresizingMaskIntoConstraints =  false
        
        NSLayoutConstraint.activate([
            // Member Photo
            memberPhoto.topAnchor.constraint(equalTo: self.topAnchor),
            memberPhoto.heightAnchor.constraint(equalToConstant: self.frame.height * 0.6766),
            
            
            
            ])
    }
    
}
