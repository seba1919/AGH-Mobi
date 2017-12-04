//
//  Event.swift
//  AGH_Mobile
//
//  Created by Aleksander Maslukowski on 12/3/17.
//  Copyright © 2017 mackn. All rights reserved.
//

import Foundation

class Event {
    var title: String?
    var fullLink: String?
    init(title:String?,fullLink:String?) {
        self.title = title
        self.fullLink = fullLink
    }
}
