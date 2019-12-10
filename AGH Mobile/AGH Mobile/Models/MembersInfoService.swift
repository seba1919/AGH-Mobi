//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.

import UIKit

class MembersInfoService {
    let defaultImageStringPath = "user_large_About"
    func getPeople(completion: @escaping ([Person]) -> Void) {
        completion(getTestPeople()) // to be swapped with API call
    }
    
    ///Method to return mocked members
    func getTestPeople() -> [Person] {
        let person1 = Person(name: "Adam Kos",
                             specialization: "iOS Developer",
                             profileImage: defaultImageStringPath,
                             description: "Aktualnie piszę pracę inżynierską na temat wpływu " +
            "wzorców projektowych na metryki oprogramowania!",
                             gitHubURL: "https://github.com/maltaz",
                             linkedInURL: "https://www.linkedin.com/in/sebastian-wiatrzyk/",
                             email: "sebastian.wiatrzyk@gmail.com")
        let person2 = Person(name: "Jan Kowalski",
                             specialization: "iOS Developer",
                             profileImage: defaultImageStringPath,
                             description: "Pracuję nad rozwojem AGH Mobi! :)",
                             gitHubURL: nil,
                             linkedInURL: nil,
                             email: nil)
        let person3 = Person(name: "Paweł Kowalski",
                             specialization: "Content Marketer",
                             profileImage: defaultImageStringPath,
                             description: "Zajmuję się content marketingiem dla MacKN",
                             gitHubURL: nil,
                             linkedInURL: nil,
                             email: nil)
        return [person1, person2, person3]
    }
}
