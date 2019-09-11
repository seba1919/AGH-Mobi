//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.

import UIKit
import SnapKit

class UserWDProfile: UIView {
    
    // MARK: - Private Properties
    private let spaceBetweenLabelAndPhoto: CGFloat = 15
    private lazy var screenHeight = Double(UIScreen.main.bounds.size.height)
    private lazy var viewHight = screenHeight * SettingsView.userProfileHightMultipliValue
    
    // MARK: - Components of View
    private lazy var userPhotoImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = ContentMode.scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = CGFloat(viewHight / 2)
        image.backgroundColor = .clear
        return image
    }()
    
    private lazy var userProfileTypeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = .customGrayText
        label.text = NSLocalizedString("UserWDProfile_User", comment: "").uppercased()
        label.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        return label
    }()
    
    private lazy var userNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = .black
        label.text = "Jan Kowalski"
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        return label
    }()
    
    private lazy var userIndexNumberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = .customGrayText
        label.text = "000000"
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        return label
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UserWDProfile {
    
    // MARK: - Setup view methods
    private func setupUI() {
        setupView()
        setupConstraints()
    }
    
    private func setupView() {
        self.addSubview(userPhotoImageView)
        self.addSubview(userProfileTypeLabel)
        self.addSubview(userNameLabel)
        self.addSubview(userIndexNumberLabel)
    }
    
    // MARK: - Setup Constraints
    private func setupConstraints() {
        userPhotoImageView.snp.makeConstraints { (make) in
            make.left.equalTo(self.snp.left)
            make.top.equalTo(self.snp.top)
            make.bottom.equalTo(self.snp.bottom)
            make.height.equalTo(viewHight)
            make.width.equalTo(viewHight)
        }
        
        userProfileTypeLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.top)
            make.left.equalTo(userPhotoImageView.snp.right).offset(spaceBetweenLabelAndPhoto)
        }
        
        userNameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(userProfileTypeLabel.snp.bottom)
            make.left.equalTo(userPhotoImageView.snp.right).offset(spaceBetweenLabelAndPhoto)
        }
        
        userIndexNumberLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.top)
            make.right.equalTo(self.snp.right)
        }
    }
}

extension UserWDProfile {
    
    // MARK: - Public Methods
    public func setupProfileImage(named name: String) {
        userPhotoImageView.image = UIImage(named: name)
    }
    
    public func setupProfileType(as profileType: String) {
        userProfileTypeLabel.text = profileType
    }
    
    public func setupName(as name: String) {
        userNameLabel.text = name
    }
    
    public func setupIndexNumber(to indexNumber: String) {
        userIndexNumberLabel.text = indexNumber
    }
}
