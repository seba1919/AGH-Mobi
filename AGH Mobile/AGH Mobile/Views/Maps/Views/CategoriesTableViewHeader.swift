//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.

import UIKit

class CategoriesTableViewHeader: UIView {
    
    // MARK: - Components of View
    lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 15.0
        layout.itemSize = CGSize(width: CategoryCellDimensions.width,
                                 height: CategoryCellDimensions.height)
        return layout
    }()
    
    lazy var collectionView: UICollectionView = {
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
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

// MARK: - Extension of CollectionView Data Source
extension CategoriesTableViewHeader: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return CategoriesData.titles.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.cellIdentifier,
                                                      for: indexPath) as! CategoryCollectionViewCell
        cell.setupCategoryIconImage(CategoriesData.images[indexPath.row])
        cell.setupCategoryTitle(CategoriesData.titles[indexPath.row])
        return cell
    }
}

// MARK: - Extension of CollectionView Delegate
extension CategoriesTableViewHeader: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        UIView.animate(withDuration: 0.25,
                       delay: 0,
                       options: [.curveEaseIn, .curveEaseOut],
                       animations: {
            let cell = collectionView.cellForItem(at: indexPath) as! CategoryCollectionViewCell
            cell.categoryRoundView.backgroundColor = .mainRed
            cell.categoryIconImageView.tintColor = .white
        })
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        UIView.animate(withDuration: 0.25,
                       delay: 0,
                       options: [.curveEaseIn, .curveEaseOut],
                       animations: {
            let cell = collectionView.cellForItem(at: indexPath) as! CategoryCollectionViewCell
            cell.categoryRoundView.backgroundColor = .white
            cell.categoryIconImageView.tintColor = .mainRed
        })
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
