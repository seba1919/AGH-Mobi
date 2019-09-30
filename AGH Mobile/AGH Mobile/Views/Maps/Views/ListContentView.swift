//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.

import UIKit
import SnapKit

class ListContentView: UIView {

    // MARK: - Components of View
    private(set) lazy var searchBarTextField: UITextField = {
        let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.autocorrectionType = .no
        field.layer.cornerRadius = 10.0
        field.backgroundColor = .searchBarBackground
        field.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        field.textColor = .customDarkGray
        
        let searchIcon = UIImage(named: "search")?.withRenderingMode(.alwaysTemplate)
        let searchIconPlaceholder = UIView(frame: CGRect(x: 0,
                                                         y: 0,
                                                         width: 28,
                                                         height: 36))
        searchIconPlaceholder.backgroundColor = .clear
        let searchIconImageView = UIImageView(frame: CGRect(x: 8,
                                                            y: 11,
                                                            width: 14,
                                                            height: 14))
        searchIconImageView.image = searchIcon
        searchIconImageView.tintColor = .customDarkGray
        searchIconPlaceholder.addSubview(searchIconImageView)
        field.leftView = searchIconPlaceholder
        field.leftViewMode = .always
        
        // Placeholder
        let attributs: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.customDarkGray,
                                                        .font: UIFont.systemFont(ofSize: 17.0,
                                                                                 weight: .regular)]
        let placeholderText = NSLocalizedString("Map_SearchBar_Placeholder",
                                                comment: "")
        field.attributedPlaceholder = NSAttributedString(string: placeholderText,
                                                         attributes: attributs)
        
        return field
    }()
    
    private(set) lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.tableHeaderView = CategoriesTableViewHeader(frame: CGRect(x: 0,
                                                                            y: 0,
                                                                            width: UIScreen.main.bounds.width,
                                                                            height: CategoryCellDimensions.height))
        return tableView
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ListContentView {
    
    // MARK: - Setups
    fileprivate func setupView() {
        addSubview(searchBarTextField)
        addSubview(tableView)

        searchBarTextField.snp.makeConstraints { (make) in
            make.top.equalTo(self).offset(28)
            make.left.equalTo(self).offset(16)
            make.right.equalTo(self).offset(-16)
            make.height.equalTo(36)
        }
        
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(searchBarTextField.snp.bottom).offset(16)
            make.width.equalTo(self)
            make.bottom.equalTo(self)
        }
    }
}
