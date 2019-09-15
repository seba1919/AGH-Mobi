//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.

import UIKit

// MARK: - Categories Cell Dimensions
struct CategoryCellDimensions {
    static let height = ((UIScreen.main.bounds.width - 40.0 - 16.0 * 2.0) / 5.0) * 1.6
    static let width = (UIScreen.main.bounds.width - 4.0 * 15.0 - 16.0 * 2.0) / 5.0
}

// MARK: - Implementation
class CategoryCollectionViewCell: UICollectionViewCell {

    // MARK: - Public Properties
    static let cellIdentifier = "CategoryCollectionViewCell"
    // MARK: - Components of View
    private(set) lazy var categoryRoundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.borderColor = UIColor.mainRed.cgColor
        view.layer.borderWidth = 2.0
        return view
    }()
    
    private(set) lazy var categoryIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = .mainRed
        return imageView
    }()
    
    private lazy var categoryTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10,
                                       weight: .semibold)
        label.textColor = UIColor.mainRed
        label.numberOfLines = 2
        label.textAlignment = .center
        return label
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        categoryRoundView.layer.cornerRadius = categoryRoundView.frame.height / 2
    }
}

extension CategoryCollectionViewCell {
    
    // MARK: - Setups
    fileprivate func setupView() {
        addSubview(categoryRoundView)
        categoryRoundView.addSubview(categoryIconImageView)
        addSubview(categoryTitleLabel)

        categoryRoundView.snp.makeConstraints { (make) in
            make.width.equalTo(self)
            make.height.equalTo(self.categoryRoundView.snp.width)
            make.top.equalTo(self)
            make.centerX.equalTo(self)
        }
        
        categoryIconImageView.snp.makeConstraints { (make) in
            make.height.equalTo(self.categoryRoundView.snp.height).multipliedBy(0.6)
            make.width.equalTo(self.categoryRoundView.snp.width).multipliedBy(0.6)
            make.center.equalTo(self.categoryRoundView)
        }
        
        categoryTitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.categoryRoundView.snp.bottom)
            make.width.equalTo(self)
            make.centerX.equalTo(self)
            make.bottom.equalTo(self)
        }
    }
}

// MARK: - Public methods
extension CategoryCollectionViewCell {
    
    func setupCategoryIconImage(_ image: UIImage) {
        categoryIconImageView.image = image
    }
    
    func setupCategoryTitle(_ title: String) {
        categoryTitleLabel.text = title
    }
}
