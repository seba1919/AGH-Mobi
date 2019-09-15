//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.

import UIKit
import SnapKit

class ListContentView: UIView {

    // MARK: - Components of View
    private(set) lazy var searchBarTextField: UITextField = {
        let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        
        field.layer.cornerRadius = 10.0
        field.backgroundColor = .searchBarBackground
        // TODO: Dokończyć search bar
        
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
