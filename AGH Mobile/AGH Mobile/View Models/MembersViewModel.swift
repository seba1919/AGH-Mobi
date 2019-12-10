//
//  MembersViewModel.swift
//  AGH Mobile
//
//  Created by Sebastian Wiatrzyk on 04/12/2019.
//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.
//

import UIKit

class MembersViewModel {
    var member: Person
    
    init(with person: Person) {
        self.member = person
    }

    public func getName() -> String {
        return member.name
    }

    public func getSpecialization() -> String {
        return member.specialization
    }

    public func getImage() -> String? {
        return member.profileImage
    }

    public func getDescription() -> String {
        return member.description
    }

    public func getGitHubURL() -> String? {
        return member.gitHubURL
    }

    public func getlinkedInURL() -> String? {
        return member.linkedInURL
    }

    public func getEmail() -> String? {
        return member.email
    }
}
