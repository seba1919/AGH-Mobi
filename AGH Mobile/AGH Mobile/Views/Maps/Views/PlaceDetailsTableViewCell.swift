//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.

import UIKit

class PlaceDetailsTableViewCell: UITableViewCell {
    
    // MARK: Public Properteis
    static let cellIdentifier = "PlaceDetailsTableViewCell"
    static let cellHeight: CGFloat = 60.0
    /// API
    var placeTitle = "" {
        didSet {
            placeTitleLabel.text = placeTitle
        }
    }
    var distanceFromUser = "" {
        didSet {
            distanceFromUserLabel.text = distanceFromUser
        }
    }
    
    // MARK: - Components of View
    private lazy var roundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .mainRed
        return view
    }()
    
    private lazy var annotationImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        if let image = UIImage(named: "location_Classes")?.withRenderingMode(.alwaysTemplate) {
            imageView.image = image
        }
        imageView.tintColor = .white
        return imageView
    }()
    
    private lazy var placeTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .textColor
        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        return label
    }()
    
    private lazy var distanceFromUserLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .textColor
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        return label
    }()
    
    private lazy var rightArrow: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        if let image = UIImage(named: "arrow_right") {
            imageView.image = image
        }
        return imageView
    }()
    
    private lazy var bottomSeparator: UIView = {
        let view = SeparatorView()
                    .build()
        return view
    }()
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setupCellProperties()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        roundView.layer.cornerRadius = roundView.frame.height / 2
    }
}

private extension PlaceDetailsTableViewCell {
    
    // MARK: - Setups
    private func setupView() {
        addSubview(roundView)
        roundView.addSubview(annotationImageView)
        addSubview(placeTitleLabel)
        addSubview(distanceFromUserLabel)
        addSubview(rightArrow)
        addSubview(bottomSeparator)
        
        roundView.snp.makeConstraints { (make) in
            make.left.equalTo(self).offset(30)
            make.centerY.equalTo(self)
            make.height.equalTo(30)
            make.width.equalTo(30)
        }
        
        annotationImageView.snp.makeConstraints { (make) in
            make.center.equalTo(self.roundView)
            make.height.equalTo(self.roundView).multipliedBy(0.6)
            make.width.equalTo(self.annotationImageView.snp.height)
        }
        
        placeTitleLabel.snp.makeConstraints { (make) in
            make.topMargin.equalTo(self.roundView)
            make.left.equalTo(self.roundView.snp.right).offset(12)
        }
        
        distanceFromUserLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.placeTitleLabel.snp.bottom).offset(1)
            make.leftMargin.equalTo(self.placeTitleLabel)
        }
        
        rightArrow.snp.makeConstraints { (make) in
            make.right.equalTo(self).offset(-16)
            make.centerY.equalTo(self)
        }
        
        bottomSeparator.snp.makeConstraints { (make) in
            make.left.equalTo(16)
            make.right.equalTo(-16)
            make.bottom.equalTo(self.snp.bottom)
        }
    }
    
    private func setupCellProperties() {
        selectionStyle = .gray
    }
}
