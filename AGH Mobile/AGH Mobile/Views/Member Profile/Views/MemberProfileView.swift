//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.

import UIKit
import SnapKit

class MemberProfileView: UIView {

    // MARK: - Private Properties
    private lazy var screenHeight = self.frame.height
    private lazy var screenWidth =  self.frame.width
    private lazy var memberPhotoImageHight = screenHeight * 0.222
    private lazy var topPadding = screenHeight * 0.03
    private let cellNumber = 3 //CHANGE!
    
    // MARK: - Components of View
    private lazy var memberPhotoImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.contentMode = ContentMode.scaleAspectFill
        image.layer.cornerRadius = memberPhotoImageHight / 2
        image.backgroundColor = .clear
        return image
    }()
    
    private lazy var memberNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .black
        label.text = "robb stark".uppercased()
        label.font = UIFont.systemFont(ofSize: 30.0, weight: .bold)
        return label
    }()

    private lazy var memberSpecializationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .mainRed
        label.text = "king of the north".uppercased()
        label.font = UIFont.systemFont(ofSize: 18.0, weight: .semibold)
        return label
    }()

    private lazy var memberDescriptionTextView: UITextView = {
        let descriptionTextView = DescriptionTextView(
            text: """
            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam a nulla vel sapien accumsan mollis.
            Suspendisse neque justo, gravida sed sem tempus, porttitor semper nisi.
            """)
            .build()
        descriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        return descriptionTextView
    }()

    private lazy var memberWebPageView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return view
    }()

    public private(set) lazy var memberWebPagesTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        tableView.isScrollEnabled = false
        tableView.separatorColor = UIColor.clear
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
        
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MemberProfileView {
    
    // MARK: - Setup view methods
    public func setupUI() {
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        self.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        self.addSubview(memberPhotoImageView)
        self.addSubview(memberNameLabel)
        self.addSubview(memberSpecializationLabel)
        self.addSubview(memberDescriptionTextView)
        self.addSubview(memberWebPageView)
        memberWebPageView.addSubview(memberWebPagesTableView)
    }
    
    // MARK: - Setup constraints
    private func setupConstraints() {
        memberPhotoImageView.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.snp.centerX)
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(topPadding)
            make.height.equalTo(memberPhotoImageHight)
            make.width.equalTo(memberPhotoImageView.snp.height)
        }
        
        memberNameLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.snp.centerX)
            make.top.equalTo(memberPhotoImageView.snp.bottom).offset(screenHeight * 0.0425).priority(.low)
        }
        
        memberSpecializationLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.snp.centerX)
            make.top.equalTo(memberNameLabel.snp.bottom).offset(screenHeight * 0.01)
        }
        
        memberDescriptionTextView.snp.makeConstraints { (make) in
            make.top.equalTo(memberSpecializationLabel.snp.bottom).offset(screenHeight * 0.03)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }
        
        memberWebPageView.snp.makeConstraints { (make) in
            make.top.equalTo(memberDescriptionTextView.snp.bottom).offset(screenWidth * 0.01)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalTo(self.snp.bottom).offset(screenHeight * -0.1)
        }
        
        memberWebPagesTableView.snp.makeConstraints { (make) in
            make.centerY.equalTo(memberWebPageView.snp.centerY)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(Int(MemberWebPagesCell.cellHeight) * cellNumber)
        }
    }
}

// MARK: - Public Methods
extension MemberProfileView {
    
    public func setupMemberImage(_ named: String) {
        memberPhotoImageView.image = UIImage(named: named)
    }
    
    public func setupMemberName(_ name: String) {
        memberNameLabel.text = name
    }
    
    public func setupMemberSpecialization(_ specialization: String) {
        memberSpecializationLabel.text = specialization
    }
    
    public func setupMemberDescription(_ description: String) {
        memberDescriptionTextView.text = description
    }
}
