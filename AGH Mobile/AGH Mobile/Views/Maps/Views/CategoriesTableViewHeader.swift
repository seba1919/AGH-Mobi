//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.

import UIKit

class CategoriesTableViewHeader: UIView {
    
    // MARK: - Components of View
    private(set) lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 15.0
        layout.itemSize = CGSize(width: CategoryCellDimensions.width,
                                 height: CategoryCellDimensions.height)
        return layout
    }()
    
    private(set) lazy var collectionView: UICollectionView = {
        let collection = UICollectionView(frame: .zero,
                                          collectionViewLayout: layout)
        collection.backgroundColor = .white
        collection.contentInset = UIEdgeInsets(top: 0,
                                               left: 16,
                                               bottom: 0,
                                               right: 16)
        return collection
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setupCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        collectionView.snp.makeConstraints { (make) in
            make.width.equalTo(self)
            make.height.equalTo(CategoryCellDimensions.height)
        }
    }
}

extension CategoriesTableViewHeader {
    
    // MARK: - Setups
    /// View
    fileprivate func setupView() {
        addSubview(collectionView)
    }
    
    /// CollectionView
    fileprivate func setupCollectionView() {
        collectionView.register(CategoryCollectionViewCell.self,
                                forCellWithReuseIdentifier: CategoryCollectionViewCell.cellIdentifier)
    }
}

// MARK: - Categories Data
struct CategoriesData {
    static let titles = [NSLocalizedString("Map_Category_Buildings", comment: ""),
                         NSLocalizedString("Map_Category_Food", comment: ""),
                         NSLocalizedString("Map_Category_Photocopying", comment: ""),
                         NSLocalizedString("Map_Category_Libraries", comment: ""),
                         NSLocalizedString("Map_Category_Shops", comment: "")]
    static let images = [#imageLiteral(resourceName: "building_Maps"), #imageLiteral(resourceName: "cultery_Maps"), #imageLiteral(resourceName: "xero_Maps"), #imageLiteral(resourceName: "book_Maps"), #imageLiteral(resourceName: "trolley_Maps")]
}
