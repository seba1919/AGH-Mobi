//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.

import UIKit
import SnapKit

class UserWDProfile: UIView {
    
    // MARK: - Instance properties
    // Private
    private let spaceBetweenLabelAndPhoto: CGFloat = 15
    private lazy var screenHeight = Double(UIScreen.main.bounds.size.height)
    private lazy var viewHight = screenHeight * SettingsView.userProfileHightMultipliValue

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup view methods
    private func setupUI() {
        setupView()
        setupConstraints()
    }
    
    private func setupView() {
        self.addSubview(userPhoto)
        self.addSubview(userProfileType)
        self.addSubview(userName)
        self.addSubview(userIndexNumber)
    }
    
    // MARK: - Public Methods
    public func setupProfileImage(named name: String) {
        userPhoto.image = UIImage(named: name)
    }
    
    public func setupProfileType(as profileType: String) {
        userProfileType.text = profileType
    }
    
    public func setupName(as name: String) {
        userName.text = name
    }
    
    public func setupIndexNumber(to indexNumber: String) {
        userIndexNumber.text = indexNumber
    }
    
    // MARK: - Components of View
    // User Photo
    private lazy var userPhoto: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = ContentMode.scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = CGFloat(viewHight / 2)
        image.backgroundColor = .clear
        return image
    }()
    
    // User Profil Type
    private lazy var userProfileType: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = .customGrayText
        label.text = NSLocalizedString("UserWDProfile_User", comment: "").uppercased()
        label.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        return label
    }()
    
    // User Name
    private lazy var userName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = .black
        label.text = "Jan Kowalski"
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        return label
    }()
    
    // User Index Number
    private lazy var userIndexNumber: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = .customGrayText
        label.text = "000000"
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        return label
    }()
    
    // MARK: - Setup Constraints
    private func setupConstraints() {
        
        // User Photo
        userPhoto.snp.makeConstraints { (make) in
            make.left.equalTo(self.snp.left)
            make.top.equalTo(self.snp.top)
            make.bottom.equalTo(self.snp.bottom)
            make.height.equalTo(viewHight)
            make.width.equalTo(viewHight)
        }
        
        // User Profil Type
        userProfileType.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.top)
            make.left.equalTo(userPhoto.snp.right).offset(spaceBetweenLabelAndPhoto)
        }
        
        // User Name
        userName.snp.makeConstraints { (make) in
            make.top.equalTo(userProfileType.snp.bottom)
            make.left.equalTo(userPhoto.snp.right).offset(spaceBetweenLabelAndPhoto)
        }
        
        // User Index Number
        userIndexNumber.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.top)
            make.right.equalTo(self.snp.right)
        }
    }
}
