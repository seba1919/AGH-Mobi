//
//  EventParser.swift
//  AGH_Mobile
//
//  Created by Aleksander Maslukowski on 12/3/17.
//  Copyright © 2017 mackn. All rights reserved.
//
import Foundation
import UIKit
import Fuzi

class EventParser {
    // MARK: variables

    var dataTask: URLSessionDataTask!
    static var eventsParsed = [Event]()

    
    func getEvents(for page:Int, collection:UICollectionView){
        // Current url for events page, on any changes - update
        let wydarzenia = URL(string:"http://www.agh.edu.pl/wydarzenia/browse/\(page)")!
        dataTask = URLSession.shared.dataTask(with: wydarzenia){(data,response,error) in
            if error != nil {
                print(error!)
            }
            else {
                guard let data = data else {return}
                guard let content = NSString(data:data,encoding:String.Encoding.utf8.rawValue) else {return}
                EventParser.eventsParsed.append(contentsOf: self.parse(html:content))
                DispatchQueue.main.async {
                    collection.reloadData()
                }
            }
        }
        dataTask.resume()
    }
    
    // Parsing of events
    func parse(html:NSString) -> [Event]{
        var events = [Event]()
        do {
            let doc = try HTMLDocument(string: html as String, encoding: String.Encoding.utf8)
            // News titles
            var titles = [String]()
            for element in doc.xpath("//div[@class='news_txt']"){
                let p = element.children(tag: "p")
                titles.append(p[0].stringValue)
            }
            // News links
            var links = [String]()
            for element in doc.xpath("//div[@class='news-list-item']") {
                let h2 = element.children(tag: "h2")
                let link = "http://www.agh.edu.pl\(h2[0].children(tag: "a")[0].attr("href")!)"
                links.append(link)
            }
            for element in titles {
                let new = Event(title: element, fullLink: links[titles.index(of: element)!])
                events.append(new)
            }
        } catch let error {
            print(error)
        }
        return events
    }
    
}

