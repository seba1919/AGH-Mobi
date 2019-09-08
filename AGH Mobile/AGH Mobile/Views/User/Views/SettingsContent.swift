//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.

import UIKit
import SnapKit

class SettingsContent: UIView {
    
    // MARK: - Public Properties
    public var pushAboutUsVC: (() -> Void)?
    public var openMailApp: (() -> Void)?
    // MARK: - Private Properties
    private lazy var screenHeight = UIScreen.main.bounds.size.height
    private lazy var screenWidth =  UIScreen.main.bounds.size.width
    private let topPadding: CGFloat = 3
    
    // MARK: - Components of View
    /// Wirtualna Uczelnia
    private lazy var wdRow: RowView = {
        let view = RowView(style: .normalWithIndentation,
                           separatorPosition: .top)
        view.setupTitle(as: NSLocalizedString("SettingsContent_WU", comment: ""))
        return view
    }()
    
    /// UPEL
    private lazy var upelRow: RowView = {
        let view = RowView(style: .normalWithIndentation,
                           separatorPosition: .top)
        view.setupTitle(as: NSLocalizedString("SettingsContent_UPEL", comment: ""))
        return view
    }()
    
    /// Panel Usług Sieciowych
    private lazy var networkServicesPanelRowView: RowView = {
        let view = RowView(style: .normalWithIndentation,
                           separatorPosition: .topAndBottom)
        view.setupTitle(as: NSLocalizedString("SettingsContent_NetworkServicesPanel", comment: ""))
        return view
    }()
    
    /// Powiadomienia o ocenach
    private lazy var notificationsAboutAssessmentRowView: RowView = {
        let view = RowView(style: .withSwitch,
                           separatorPosition: .topAndBottom)
        view.setupTitle(as: NSLocalizedString("SettingsContent_NotificationsAboutMarks", comment: ""))
        return view
    }()
    
    /// O nas
    private lazy var aboutUsRowView: RowView = {
        let view = RowView(style: .normal,
                           separatorPosition: .topAndBottom)
        view.setupTitle(as: NSLocalizedString("SettingsContent_AboutUs", comment: ""))
        view.setAction = { self.onPressPushAboutUsVC() }
        return view
    }()
    
    /// Skontaktuj się z nami
    private lazy var contactRowView: RowView = {
        let view = RowView(style: .empty,
                           separatorPosition: .bottom)
        view.setupTitle(as: NSLocalizedString("SettingsContent_ContactUs", comment: ""))
        view.setAction = { self.onPressOpenMailApp() }
        return view
    }()
    
    private lazy var topStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        stack.spacing = 0.0
        return stack
    }()
    
    private lazy var bottomStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        stack.spacing = 0.0
        return stack
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

extension SettingsContent {
    
    // MARK: - Setup view methods
    private func setupUI() {
        setupView()
        setupConstraints()
    }
    
    private func setupView() {
        self.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.addSubview(notificationsAboutAssessmentRowView)
        setupStackViews()
    }
    
    private func setupStackViews() {
        ///  Top StackView
        topStackView.addArrangedSubview(wdRow)
        topStackView.addArrangedSubview(upelRow)
        topStackView.addArrangedSubview(networkServicesPanelRowView)
        self.addSubview(topStackView)
        /// Bottom StackView
        bottomStackView.addArrangedSubview(aboutUsRowView)
        bottomStackView.addArrangedSubview(contactRowView)
        self.addSubview(bottomStackView)
    }
    
    // MARK: - Setup Constraints
    private func setupConstraints() {
        topStackView.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.top).offset(topPadding)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(notificationsAboutAssessmentRowView.snp.top).offset(screenHeight * -0.063)
        }
        
        notificationsAboutAssessmentRowView.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
        }
        
        bottomStackView.snp.makeConstraints { (make) in
            make.top.equalTo(notificationsAboutAssessmentRowView.snp.bottom).offset(screenHeight * 0.063)
            make.left.right.equalToSuperview()
            //make.bottom.equalTo(self.snp.bottom)
        }
    }
    
    // MARK: - Actions
     private func onPressPushAboutUsVC() {
        pushAboutUsVC?()
    }
    
    private func onPressOpenMailApp() {
        openMailApp?()
    }
}
