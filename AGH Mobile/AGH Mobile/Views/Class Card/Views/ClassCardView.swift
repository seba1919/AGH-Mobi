//
//  ClassCardView.swift
//  AGH Mobile
//
//  Created by Macbook on 18/09/2019.
//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.
//

import UIKit

class ClassCardView: UIView {
    
    // MARK: - Private properties
    
    private lazy var screenHeight = self.frame.height
    private lazy var screenWidth = self.frame.width
    private lazy var spacing = screenHeight * 0.03
    private let leftMargin: CGFloat = 20
    private let rightMargin: CGFloat = -20

    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setupUI() {
        setupViews()
        setupConstraints()
    }

    private func setupViews() {
        self.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        [subjectName,
         separator].forEach({addSubview($0)})
        
    }
    
    private lazy var subjectName: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.systemFont(ofSize: 35, weight: .bold)
        lbl.textColor = .black
        lbl.textAlignment = .left
        lbl.text = "Bazy Danych"
        return lbl
    }()
    
    private lazy var separator: UIView = {
        let v = SeparatorView().build()
        return v
    }()


    
    
    private func setupConstraints() {
        
        subjectName.snp.makeConstraints { (make) in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(spacing)
            make.left.equalToSuperview().offset(leftMargin)
            make.rightMargin.equalToSuperview().offset(rightMargin)

        }
        
        separator.snp.makeConstraints { (make) in
            make.top.equalTo(subjectName.snp.bottom).offset(spacing)
            make.width.equalToSuperview()
        }


    }
    

}
