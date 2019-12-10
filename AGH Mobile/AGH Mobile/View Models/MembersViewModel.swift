//
//  MembersViewModel.swift
//  AGH Mobile
//
//  Created by Sebastian Wiatrzyk on 04/12/2019.
//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.
//

import UIKit

class MembersViewModel {
    var name: String!
    var specialization: String!
    var profileImageString: String?
    var description: String!
    var gitHubURL: String?
    var linkedInURL: String?
    var email: String?
    
    init(with person: Person) {
        self.name = person.name
        self.specialization = person.specialization
        self.profileImageString = person.profileImage
        self.description = person.description
        self.gitHubURL = person.gitHubURL
        self.linkedInURL = person.linkedInURL
        self.email = person.email
    }
//
//    public func setupName(as name: String) {
//        self.name = name
//    }
//
//    public func setupSpecialization(as name: String) {
//        self.specialization = name
//    }
//
//    public func setupImage(named name: String) {
//        profileImage = UIImage(named: name)
//    }
//
//    public func setupDescription(with text: String) {
//        self.description = text
//    }
//
//    public func setupGitHubURL(with adress: String) {
//        self.gitHubURL = URL(fileURLWithPath: adress)
//    }
//
//    public func setuplinkedInURL(with adress: String) {
//        self.linkedInURL = URL(fileURLWithPath: adress)
//    }
//
//    public func setupEmail(with adress: String) {
//        self.email = adress
//    }
}
