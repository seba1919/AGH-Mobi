//
//  File.swift
//  AGH Mobile
//
//  Created by Mateusz Bąk on 16/04/2019.
//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.
//

// ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
// MARK: - Import

import UIKit
import SnapKit

// ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
// MARK: - Implementation

final class AboutAsViewController : UIViewController {
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Instance Variables
    
    // View
    private var aboutAsView: AboutAsView { return self.view as! AboutAsView }
    private lazy var screenWidth = UIScreen.main.bounds.size.width
    // Collection View
    private let cellWidthScaling: CGFloat = 0.5
    private let minimumLineSpacing: CGFloat = 15.0
    // AutoScroll
    private var timer = Timer()
    private var counter = 0
    private var isAscending = true
    private let dataSize = 10
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        self.view = AboutAsView(frame: UIScreen.main.bounds)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        aboutAsView.setupUI()
        setupCollectionView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DispatchQueue.main.async {
            self.timer = Timer.scheduledTimer(timeInterval: 1.5, target: self, selector: #selector(self.autoScroll), userInfo: nil, repeats: true)
        }
    }
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Setup Collection View
    
    private func setupCollectionView() {
        aboutAsView.teamGallery.delegate = self
        aboutAsView.teamGallery.dataSource = self
        aboutAsView.teamGallery.register(TeamGalleryCell.self, forCellWithReuseIdentifier: TeamGalleryCell.identifier)
    }
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - AutoScroll Methods
    
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
        if counter == (dataSize - 1) {
            isAscending = false
        }
    }
    
    private func scrollBackwards() {
        scroll()
        counter -= 1
        if counter == 0 {
            isAscending = true
        }
    }
    
    private func scroll() {
        let collection = self.aboutAsView.teamGallery
        let index = IndexPath(item: counter, section: 0)
        collection.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
    }
    
}

// ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
// MARK: - Extensions of UICollectionView

// Date Source
extension AboutAsViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = aboutAsView.teamGallery.dequeueReusableCell(withReuseIdentifier: TeamGalleryCell.identifier, for: indexPath) as! TeamGalleryCell
        cell.setupImage(named: "testPersonPhoto")
        cell.setupName(as: "Mateusz Bąk")
        return cell
    }
    
}

// Delegate
extension AboutAsViewController: UIScrollViewDelegate, UICollectionViewDelegate {
    
    // Cell stay in the middle by this code
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let cellWidth = screenWidth * cellWidthScaling
        let cellWidthIncludingSpacing = cellWidth + minimumLineSpacing
        var offset = targetContentOffset.pointee
        let index = (offset.x + scrollView.contentInset.left) / cellWidthIncludingSpacing
        let roundedIndex = round(index)
        
        offset = CGPoint(x: roundedIndex * cellWidthIncludingSpacing - scrollView.contentInset.left,
                         y: -scrollView.contentInset.top)
        targetContentOffset.pointee = offset
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //nav bar
    }
    
}

// Flow Layout Delegate
extension AboutAsViewController: UICollectionViewDelegateFlowLayout {
    
    // Cell size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellHeight = aboutAsView.teamGallery.frame.height
        let cellWidth = screenWidth * cellWidthScaling
        return CGSize(width: cellWidth,
                      height: cellHeight)
    }

    // Cell Insets Edges
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let cellWidth = screenWidth * cellWidthScaling
        let freeSpaceBetweenEdgesAndCalls = (view.bounds.width - cellWidth) / 2.0
        return UIEdgeInsets(top: 0,
                            left: freeSpaceBetweenEdgesAndCalls,
                            bottom: 0,
                            right: freeSpaceBetweenEdgesAndCalls)
    }
    
    // Cell Minimum Interitem Spacing
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    // Cell Minimum Line Spacing
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return minimumLineSpacing // Space Between Calls
    }
    
}

class AutoScroll {
    
    var endPoint: CGPoint!
    var startingPoint: CGPoint!
    var scrollingPoint: CGPoint!
    var timer: Timer!
    let collectionView: UICollectionView
    let size: Int
    
    init(collectionView: UICollectionView, size: Int) {
        self.collectionView = collectionView
        self.size = size
    }
    
    func setup() {
        var i = 0
        var indexPath = IndexPath(row: i, section: 0)
        if i < size - 1 && i > 0 {
            i += 1
        } else {
            i = 0
        }
        
    }
    
    func scroll(index: IndexPath) {
        self.collectionView.scrollToItem(at: index,
                                         at: .centeredHorizontally,
                                         animated: true)
    }
    
}
