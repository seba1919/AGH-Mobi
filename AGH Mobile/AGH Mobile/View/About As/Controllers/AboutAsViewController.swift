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
    private var timer: Timer?
    private var counter = 0
    private var isAscending = true
    private let dataSize = 10 // CHANGE!
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        self.view = AboutAsView(frame: UIScreen.main.bounds)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.aboutAsView.setupUI()
        self.setupCollectionView()
        self.setupNavigationAttributs()
        self.startAutoScrolling()
    }
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Setup
    
    private func setupCollectionView() {
        aboutAsView.teamGallery.delegate = self
        aboutAsView.teamGallery.dataSource = self
        aboutAsView.teamGallery.register(TeamGalleryCell.self, forCellWithReuseIdentifier: TeamGalleryCell.identifier)
    }
    
    private func setupNavigationAttributs() {
        self.navigationItem.title = "O nas"
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - AutoScroll Methods
    
    private func startAutoScrolling() {
        if timer == nil {
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(self.autoScroll), userInfo: nil, repeats: true)
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
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
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
        // nav bar
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        // Stop AutoScrolling when scrollView will begin dragging
        self.stopAutoScrolling()
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

    // Cells Insets Edges
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
