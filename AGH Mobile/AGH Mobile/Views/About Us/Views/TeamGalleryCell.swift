//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.

import UIKit
import SnapKit

class TeamGalleryCell: UICollectionViewCell {

    // MARK: - Public properties
    static let identifier = "teamGalleryCell"
    // MARK: - Private properties
//    var membersViewModel = MembersViewModel
    private lazy var memberPhotoImageHight = self.frame.height * 0.75

    // MARK: - Components of View
    private lazy var memberPhotoImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = ContentMode.scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = memberPhotoImageHight / 2
        image.backgroundColor = .clear
        return image
    }()
    
    private lazy var memberNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .customGrayText
        label.text = "robb stark".uppercased()
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        return label
    }()
    
    private lazy var memberSpecializationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .mainRed
        label.text = "king of the north".uppercased()
        label.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        return label
    }()
    
    // MARK: - Public Methods
    public func configure(withProfileImageURL profileImageURL: String?, withName name: String, withSpecialization specialization: String) {
        if let imageURL = profileImageURL {
            self.memberPhotoImageView.image = UIImage(named: imageURL)
        }
        self.memberNameLabel.text = name
        self.memberSpecializationLabel.text = specialization
    }
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TeamGalleryCell {

    // MARK: - Setup View
    private func setupUI() {
        setupView()
        setupConstraints()
    }
    
    private func setupView() {
        self.addSubview(memberPhotoImageView)
        self.addSubview(memberNameLabel)
        self.addSubview(memberSpecializationLabel)
    }

    // MARK: - Setup Constraints
    private func setupConstraints() {
    
        memberPhotoImageView.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.snp.centerX)
            make.top.equalTo(self.snp.top)
            make.height.equalTo(memberPhotoImageHight)
            make.width.equalTo(memberPhotoImageView.snp.height)
            make.bottom.lessThanOrEqualTo(memberNameLabel.snp.top)
                .offset(self.frame.height * -0.1)
                .priority(.low)
        }

        memberNameLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.snp.centerX)
            make.bottom.equalTo(memberSpecializationLabel.snp.top)
                .offset(self.frame.height * -0.0125)
                .priority(.required)
        }

        memberSpecializationLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.snp.centerX)
            make.bottom.equalTo(self.snp.bottom)
                .priority(.required)
        }
    }
}
