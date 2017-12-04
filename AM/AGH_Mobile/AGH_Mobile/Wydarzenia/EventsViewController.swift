//
//  EventsViewController.swift
//  AGH_Mobile
//
//  Created by Aleksander Maslukowski on 12/3/17.
//  Copyright © 2017 mackn. All rights reserved.
//

// (!!!!) Tutaj warto powiedziec, ze to jest bardzo podstawowy pomysl, nie jest bezpieczny i w ogole jest do przemyslenia. Ale nastepnym razem napisze to juz jak ma byc :)


import UIKit
import SafariServices

class EventsViewController: UIViewController {
    // MARK: variables
    @IBOutlet weak var collectionView: UICollectionView!
    
    let eventParser = EventParser()
    fileprivate var currentPage = 0
    fileprivate var maximumNewsPerPage = 10
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        eventParser.getEvents(for: currentPage,collection: collectionView)
    }
    
    
    
}

// MARK: Collection View Initialization
extension EventsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return EventParser.eventsParsed.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "eventCell", for: indexPath) as! EventCollectionViewCell
        // Below things will be replaced with designing function
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.backgroundColor = UIColor.lightGray.withAlphaComponent(1)
        cell.layer.shadowOffset = CGSize(width: 3, height: 5)
        cell.layer.shadowOpacity = 0.7
        cell.layer.shadowRadius = 4.0
        cell.layer.cornerRadius = 8
        cell.clipsToBounds = false
        cell.eventTextView.text = EventParser.eventsParsed[indexPath.row].title
        cell.eventTextView.backgroundColor = .clear
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let constraintRect = CGSize(width: self.view.frame.size.width, height: CGFloat.greatestFiniteMagnitude)
        let data = EventParser.eventsParsed[indexPath.row].title
        let boundingBox = data?.boundingRect(with: constraintRect, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font: UIFont(name: "HelveticaNeue", size: 17)!], context: nil)
        return CGSize(width: collectionView.frame.size.width - 20, height: (boundingBox?.height)!)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let stringLink = EventParser.eventsParsed[indexPath.row].fullLink {
            if let link = URL(string:stringLink){
                let vc = SFSafariViewController(url: link)
                present(vc, animated: true)
            }else {return}
        }
    }
    
    // Pagination for events
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row + 1 == maximumNewsPerPage{
            currentPage += 1
            maximumNewsPerPage += 10
            eventParser.getEvents(for: currentPage,collection: collectionView)
        }
    }
}
