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
    
    private var aboutAsView: AboutAsView { return self.view as! AboutAsView }
    private let cellWidthScaling: CGFloat = 0.5
    private lazy var screenWidth = UIScreen.main.bounds.size.width
    
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
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Setup Collection View
    
    private func setupCollectionView() {
        aboutAsView.teamGallery.delegate = self
        aboutAsView.teamGallery.dataSource = self
        aboutAsView.teamGallery.register(TeamGalleryCell.self, forCellWithReuseIdentifier: TeamGalleryCell.identifier)
    }
    
}

// ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
// MARK: - Extensions of UICollectionView

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

extension AboutAsViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //nav bar
    }
    
}

extension AboutAsViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellHeight = aboutAsView.teamGallery.frame.height
        let cellWidth = screenWidth * cellWidthScaling
        return CGSize(width: cellWidth,
                      height: cellHeight)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let cellWidth = screenWidth * cellWidthScaling
        let freeSpaceBetweenEdgesAndCalls = (view.bounds.width - cellWidth) / 2.0
        return UIEdgeInsets(top: 0,
                            left: freeSpaceBetweenEdgesAndCalls,
                            bottom: 0,
                            right: freeSpaceBetweenEdgesAndCalls)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15 // Space Between Calls
    }
    
}
