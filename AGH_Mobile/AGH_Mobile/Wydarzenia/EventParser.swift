//
//  EventParser.swift
//  AGH_Mobile
//
//  Created by Aleksander Maslukowski on 12/3/17.
//  Copyright © 2017 mackn. All rights reserved.
//
import Foundation
import Fuzi

class EventParser {
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

