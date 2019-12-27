//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.

import UIKit

final class AboutUsViewController: UIViewController {
    
    // MARK: - Instance properties
    var model: MembersInfoService
    var people: [Person] = []
    
    private lazy var screenWidth = UIScreen.main.bounds.size.width
    // Collection View
    private let cellWidthScaling: CGFloat = 0.5
    private let minimumLineSpacing: CGFloat = 15.0
    // AutoScroll
    private var timer: Timer?
    private var counter = 1
    private var isAscending = true
    private let dataSize = 10 // CHANGE!
    // WebPage
    private let webPageAddress = "https://www.mackn.agh.edu.pl"
    private lazy var freeSpaceBetweenComponents = UIScreen.main.bounds.height * 0.0225
    private lazy var topPadding = UIScreen.main.bounds.height * 0.047
    private lazy var bottomPadding = UIScreen.main.bounds.height * -0.030
    
    // MARK: - Components of View
    private(set) lazy var teamGalleryCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection = .horizontal
        collection.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.isScrollEnabled = true
        collection.showsHorizontalScrollIndicator = false
        collection.showsVerticalScrollIndicator = false
        return collection
    }()
    
    private lazy var aboutUsDescriptionTextView: UITextView = {
        let descriptionTextView = DescriptionTextView(
            text: NSLocalizedString("AboutUsView_AboutUsDescription", comment: ""))
            .build()
        descriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        return descriptionTextView
    }()
    
    private lazy var macKnIconImageView: UIImageView = {
        let image = UIImage(named: "MacKNIcon")
        let icon = UIImageView(image: image)
        icon.translatesAutoresizingMaskIntoConstraints = false
        return icon
    }()
    
    private lazy var webPageButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(NSLocalizedString("AboutUsView_StudentScienceCircleWebPage", comment: ""), for: .normal)
        button.setTitleColor(UIColor.mainRed, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(onPressOpenWeb), for: .touchUpInside)
        return button
    }()
    
        // MARK: - Instance properties
    init() {
        self.model = MembersInfoService()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.setupCollectionView()
        self.setupNavigationAttributs()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.startAutoScrolling()
        model.getPeople { fetchedPeople in
            self.people = fetchedPeople
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.stopAutoScrolling()
    }
}

extension AboutUsViewController {
    
    // MARK: - Setup
    private func setupCollectionView() {
        self.teamGalleryCollectionView.delegate = self
        self.teamGalleryCollectionView.dataSource = self
        self.teamGalleryCollectionView.register(TeamGalleryCell.self,
                                                       forCellWithReuseIdentifier: TeamGalleryCell.identifier)
    }
    
    private func setupNavigationAttributs() {
        self.navigationItem.title = NSLocalizedString("SettingsContent_AboutUs", comment: "")
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    // MARK: - AutoScroll Methods
    private func startAutoScrolling() {
        if timer == nil {
            self.timer = Timer.scheduledTimer(timeInterval: 3.0,
                                              target: self,
                                              selector: #selector(self.autoScroll),
                                              userInfo: nil,
                                              repeats: true)
        }
    }
    
    private func stopAutoScrolling() {
        if timer != nil {
            timer!.invalidate()
            timer = nil
        }
    }
    
    @objc private func autoScroll() {
        if isAscending {
            scrollForward()
        } else {
            scrollBackwards()
        }
    }
    
    private func scrollForward() {
        scroll()
        counter += 1
        checkIfIsAscendingNeedChange()
    }
    
    private func scrollBackwards() {
        scroll()
        counter -= 1
        checkIfIsAscendingNeedChange()
    }
    
    private func checkIfIsAscendingNeedChange() {
        if counter == (dataSize - 1) {
            isAscending = false
        }
        if counter == 0 {
            isAscending = true
        }
    }
    
    private func scroll() {
        let collection = self.teamGalleryCollectionView
        let index = IndexPath(item: counter, section: 0)
        collection.scrollToItem(at: index,
                                at: .centeredHorizontally,
                                animated: true)
    }
}

// MARK: - Extensions of UI Collection View Date Source
extension AboutUsViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.people.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.teamGalleryCollectionView
            .dequeueReusableCell(withReuseIdentifier: TeamGalleryCell.identifier,
                    
                                 for: indexPath) as! TeamGalleryCell
        let item = self.people[indexPath.row]
        cell.configure(withProfileImageURL: item.profileImageURL,
                       withName: item.name,
                       withSpecialization: item.specialization)
        return cell
    }
}

extension AboutUsViewController {
    
    // MARK: - Setup view
    public func setupUI() {
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        self.view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.view.addSubview(teamGalleryCollectionView)
        self.view.addSubview(aboutUsDescriptionTextView)
        self.view.addSubview(macKnIconImageView)
        self.view.addSubview(webPageButton)
    }
    
    // MARK: - Setup Constraints
    private func setupConstraints() {
        teamGalleryCollectionView.snp.makeConstraints { (make) in
            make.height.greaterThanOrEqualTo(self.view.frame.height * 0.0685).priority(.high)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(topPadding)
            make.bottom.equalTo(aboutUsDescriptionTextView.snp.top).offset(-freeSpaceBetweenComponents)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.centerX.equalTo(view.safeAreaLayoutGuide.snp.centerX)
        }
        
        aboutUsDescriptionTextView.snp.makeConstraints { (make) in
            make.bottom.equalTo(macKnIconImageView.snp.top).offset(-freeSpaceBetweenComponents)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }
        
        macKnIconImageView.snp.makeConstraints { (make) in
            make.bottom.equalTo(webPageButton.snp.top).offset(-freeSpaceBetweenComponents)
            // Adaptation to the iPhone SE
            if UIScreen.isSmallSize() {
                make.height.equalTo(self.view.frame.height * 0.07)
            } else {
                make.height.equalTo(self.view.frame.height * 0.123)
            }
            make.width.equalTo(macKnIconImageView.snp.height)
                .multipliedBy(macKnIconImageView.frame.width / macKnIconImageView.frame.height)
            make.centerX.equalTo(view.safeAreaLayoutGuide.snp.centerX)
        }
        
        webPageButton.snp.makeConstraints { (make) in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(bottomPadding)
            make.centerX.equalTo(view.safeAreaLayoutGuide.snp.centerX)
        }
    }
    
    // MARK: - Selectors
    @objc private func onPressOpenWeb() {
        if let url = URL(string: self.webPageAddress) {
            UIApplication.shared.open(url)
        }
    }
}


// MARK: - Extensions of UI Collection View Delegate
extension AboutUsViewController: UIScrollViewDelegate, UICollectionViewDelegate {
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView,
                                   withVelocity velocity: CGPoint,
                                   targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        // Cell stay in the middle by this code
        let cellWidth = screenWidth * cellWidthScaling
        let cellWidthIncludingSpacing = cellWidth + minimumLineSpacing
        var offset = targetContentOffset.pointee
        let index = (offset.x + scrollView.contentInset.left) / cellWidthIncludingSpacing
        let roundedIndex = round(index)
        
        offset = CGPoint(x: roundedIndex * cellWidthIncludingSpacing - scrollView.contentInset.left,
                         y: -scrollView.contentInset.top)
        targetContentOffset.pointee = offset
        
        // Change AutoScrolling direction depend on Dragging Direction
        let translation = scrollView.panGestureRecognizer.translation(in: scrollView.superview)
        
        if translation.x > 0 {
            isAscending = false // Direction: <---
        } else {
            isAscending = true  // Direction: --->
        }
        
        // AutoScrolling
        counter = Int(roundedIndex)
        checkIfIsAscendingNeedChange()
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(300)) { // Delay 0.3 s
            // Start AutoScrolling when scrollView will end dragging
            self.startAutoScrolling()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let viewController = MemberProfileViewController()
        navigationController?.pushViewController(viewController, animated: true)
        self.stopAutoScrolling()
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        // Stop AutoScrolling when user will begin dragging
        self.stopAutoScrolling()
    }
}

// MARK: - Extensions of UI Collection View Flow Layout Delegate
extension AboutUsViewController: UICollectionViewDelegateFlowLayout {
    
    // Cell size
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellHeight = self.teamGalleryCollectionView.frame.height
        let cellWidth = screenWidth * cellWidthScaling
        return CGSize(width: cellWidth,
                      height: cellHeight)
    }

    // Cells Insets Edges
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        let cellWidth = screenWidth * cellWidthScaling
        let freeSpaceBetweenEdgesAndCalls = (view.bounds.width - cellWidth) / 2.0
        return UIEdgeInsets(top: 0,
                            left: freeSpaceBetweenEdgesAndCalls,
                            bottom: 0,
                            right: freeSpaceBetweenEdgesAndCalls)
    }
    
    // Cell Minimum Interitem Spacing
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    // Cell Minimum Line Spacing
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return minimumLineSpacing // Space Between Calls
    }
}
