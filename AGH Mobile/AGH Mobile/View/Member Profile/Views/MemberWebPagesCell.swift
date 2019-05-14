//
//  MemberWebPagesCell.swift
//  AGH Mobile
//
//  Created by Mateusz Bąk on 01/05/2019.
//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.
//

// ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
// MARK: - Import

import UIKit
import SnapKit

// ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
// MARK: - Implementation

class MemberWebPagesCell: UITableViewCell {
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Instance Variables
    
    public static let identifier = "memberWebPagesCell"
    public static let cellHeight: CGFloat = 35
    private let mainColorForThisCell = UIColor(red: 25/255, green: 23/255, blue: 23/255, alpha: 1)
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Setup View Methods
    
    private func setupUI() {
        setupView()
        setupConstraints()
    }
    
    private func setupView() {
        self.addSubview(webPageImage)
        self.addSubview(webPageName)
    }
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Public Methods
    
    public func setupImage(named Name: String) {
        webPageImage.image = UIImage(named: Name)
    }
    
    public func setupName(as Name: String) {
        webPageName.text = Name
    }
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Components of View
    
    // Web Page Image
    private lazy var webPageImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .mainRed
        return imageView
    }()
    
    // Web Page Name
    private lazy var webPageName: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.textColor = mainColorForThisCell
        textView.text = "@janekWiśniewski"
        textView.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        return textView
    }()
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Setup Constraints
    
    private func setupConstraints() {
        
        // Web Page Image
        webPageImage.snp.makeConstraints { (make) in
            make.width.equalTo(25)
            make.height.equalTo(25)
            make.right.equalTo(webPageName.snp.left).offset(-8)
            make.centerY.equalTo(webPageName.snp.centerY)
        }
        
        // Web Page Name
        webPageName.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.snp.centerX)
            make.centerY.equalTo(self.snp.centerY)
        }
        
    }
    
}
