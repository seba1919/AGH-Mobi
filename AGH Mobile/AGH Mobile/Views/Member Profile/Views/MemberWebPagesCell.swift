//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.

import UIKit
import SnapKit

class MemberWebPagesCell: UITableViewCell {
    
    // MARK: - Public Properties
    static let identifier = "memberWebPagesCell"
    static let cellHeight: CGFloat = 35
    // MARK: - Private Properties
    private let mainColorForThisCell = UIColor(red: 25/255, green: 23/255, blue: 23/255, alpha: 1)
    
    // MARK: - Components of View
    private lazy var webPageImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .mainRed
        return imageView
    }()
    
    private lazy var webPageNameTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.textColor = mainColorForThisCell
        textView.text = "@janekWiśniewski"
        textView.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        return textView
    }()
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MemberWebPagesCell {
    
    // MARK: - Setup View Methods
    private func setupUI() {
        setupView()
        setupConstraints()
    }
    
    private func setupView() {
        self.addSubview(webPageImageView)
        self.addSubview(webPageNameTextView)
    }
    
    // MARK: - Setup Constraints
    private func setupConstraints() {
        webPageImageView.snp.makeConstraints { (make) in
            make.width.equalTo(25)
            make.height.equalTo(25)
            make.right.equalTo(webPageNameTextView.snp.left).offset(-8)
            make.centerY.equalTo(webPageNameTextView.snp.centerY)
        }
        
        webPageNameTextView.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.snp.centerX)
            make.centerY.equalTo(self.snp.centerY)
        }
    }
}

// MARK: - Public Methods
extension MemberWebPagesCell {
    public func setupWebPageImage(_ named: String) {
        webPageImageView.image = UIImage(named: named)
    }
    
    public func setupWebPageName(_ name: String) {
        webPageNameTextView.text = name
    }
}
