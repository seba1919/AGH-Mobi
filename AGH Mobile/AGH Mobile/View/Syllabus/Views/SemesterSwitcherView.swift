//
//  SwitchSemesterView.swift
//  AGH Mobile
//
//  Created by Bartosz Kunat on 20/05/2019.
//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.
//

import UIKit

class SemesterSwitcherView: UIView {

    private struct Constants {
        static let stackViewSpacing: CGFloat = 32
        
        // Font sizes
        static let titleFontSize: CGFloat = 26
        static let subtitleFontSize: CGFloat = 14
    }
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - UI components
    
    private var topStackView: UIStackView!
    private var leftBtn: UIButton!
    private var rightBtn: UIButton!
    private var semesterLbl: UILabel!
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - UI setup
    
    private func setUpView() {
        
        // Semester label
        semesterLbl = UILabel()
        semesterLbl.text = "Semestr 1"
        semesterLbl.textAlignment = .center
        semesterLbl.font = UIFont.systemFont(ofSize: Constants.titleFontSize, weight: .bold)
        semesterLbl.textColor = .mainRed
        
        // Left arrow button
        leftBtn = UIButton()
        leftBtn.setImage(#imageLiteral(resourceName: "arrow_left"), for: .normal)
        leftBtn.snp.makeConstraints { (make) in
            make.width.greaterThanOrEqualTo(60)
        }
        
        // Right arrow button
        rightBtn = UIButton()
        rightBtn.setImage(#imageLiteral(resourceName: "arrow_right"), for: .normal)
        rightBtn.snp.makeConstraints { (make) in
            make.width.greaterThanOrEqualTo(60)
        }
        
        // Stack view
        topStackView = UIStackView(arrangedSubviews: [leftBtn, semesterLbl, rightBtn])
        topStackView.alignment = .center
        topStackView.distribution = .equalSpacing
        topStackView.axis = .horizontal
        topStackView.spacing = Constants.stackViewSpacing
        addSubview(topStackView)
        topStackView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Public API
    
    func setSemesterLblTitle(_ title: String) {
        semesterLbl.text = title
        semesterLbl.sizeToFit()
    }
    
    func addTargetToRightButton(_ target: Any?, action: Selector, for event: UIControl.Event) {
        rightBtn.addTarget(target, action: action, for: event)
    }
    
    func addTargetToLeftButton(_ target: Any?, action: Selector, for event: UIControl.Event) {
        leftBtn.addTarget(target, action: action, for: event)
    }
}
