//
//  EventsViewController.swift
//  AGH_Mobile
//
//  Created by Aleksander Maslukowski on 12/3/17.
//  Copyright © 2017 mackn. All rights reserved.
//

// (!!!!) Tutaj warto powiedziec, ze to jest bardzo podstawowy pomysl i w ogole jest do przemyslenia. Ale nastepnym razem napisze to juz jak ma byc :)

import UIKit
import SafariServices

class EventsViewController: UIViewController {
    // MARK: variables
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let eventParser = EventParser()
    var events = [Event]()
    fileprivate var currentPage = 0
    fileprivate var maximumNewsPerPage = 10
    
    
    // MARK: EventsViewController's life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getEvents(for: currentPage)
    }
    
    // MARK: fetching events request
    
    func getEvents(for page:Int){
        // Current URL for events page, on any changes - update the URL
        let wydarzenia = URL(string:"http://www.agh.edu.pl/wydarzenia/browse/\(page)")!
        let dataTask = URLSession.shared.dataTask(with: wydarzenia){(data,response,error) in
            if error != nil {
                print(error!)
            }
            else {
                guard let data = data else {return}
                guard let content = NSString(data:data,encoding:String.Encoding.utf8.rawValue) else {return}
                self.events.append(contentsOf:self.eventParser.parse(html: content))
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        }
        dataTask.resume()
    }
}

// MARK: Collection View Initialization
extension EventsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return events.count
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
        cell.eventTextView.text = events[indexPath.row].title
        cell.eventTextView.backgroundColor = .clear
        
        return cell
    }
    
    // Reiszeble cells, discussable
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let constraintRect = CGSize(width: self.view.frame.size.width, height: CGFloat.greatestFiniteMagnitude)
        let data = events[indexPath.row].title
        let boundingBox = data?.boundingRect(with: constraintRect, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font: UIFont(name: "HelveticaNeue", size: 17)!], context: nil)
        return CGSize(width: collectionView.frame.size.width - 20, height: (boundingBox?.height)!)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let stringLink = events[indexPath.row].fullLink {
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
            getEvents(for: currentPage)
        }
    }
}
