//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.

import UIKit
import SnapKit

class TeamGalleryCell: UICollectionViewCell {
    
    // MARK: - Public properties
    static let identifier = "teamGalleryCell"
    // MARK: - Private properties
    private lazy var memberPhotoImageHight = self.frame.height * 0.75

    // MARK: - Components of View
    private lazy var memberPhoto: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = ContentMode.scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = memberPhotoImageHight / 2
        image.backgroundColor = .clear
        return image
    }()
    
    private lazy var memberName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .customGrayText
        label.text = "robb stark".uppercased()
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        return label
    }()
    
    private lazy var memberSpecialization: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .mainRed
        label.text = "king of the north".uppercased()
        label.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
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

extension TeamGalleryCell {

    // MARK: - Setup View
    private func setupUI() {
        setupView()
        setupConstraints()
    }
    
    private func setupView() {
        self.addSubview(memberPhoto)
        self.addSubview(memberName)
        self.addSubview(memberSpecialization)
    }

    // MARK: - Setup Constraints
    private func setupConstraints() {
    
        memberPhoto.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.snp.centerX)
            make.top.equalTo(self.snp.top)
            make.height.equalTo(memberPhotoImageHight)
            make.width.equalTo(memberPhoto.snp.height)
            make.bottom.lessThanOrEqualTo(memberName.snp.top).offset(self.frame.height * -0.1).priority(.low)
        }

        memberName.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.snp.centerX)
            make.bottom.equalTo(memberSpecialization.snp.top).offset(self.frame.height * -0.0125).priority(.required)
        }

        memberSpecialization.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.snp.centerX)
            make.bottom.equalTo(self.snp.bottom).priority(.required)
        }
    }
    
    // MARK: - Public Methods
    public func setupImage(named name: String) {
        memberPhoto.image = UIImage(named: name)
    }
    
    public func setupName(as name: String) {
        memberName.text = name
    }
    
    public func setupSpecialization(as name: String) {
        memberSpecialization.text = name
    }
}
