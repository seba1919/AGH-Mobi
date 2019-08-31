//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.

import UIKit

struct PersonalInfo {
    /// nr indeksu
    var albumNr: Int
    /// imiona i nazwisko
    var fullName: String
    /// wydzial
    var faculty: String
    /// kierunek
    var fieldOfStudy: String
    /// specjalizacja
    var specialty: String
    /// forma studiow, np stacjonarne
    var formOfStudies: String
    /// poziom studiow, np. pierwsze
    var studyDegree: String
    /// profil ksztalcenia, np. ogolnoakademicki
    var educationProfile: String
    /// status kierunku, np. pierwszy
    var fieldOfStudyStatus: String
    /// "Platny" / "Nieplatny"
    var fieldOfStudyInfo: String
    /// data rozpoczecia studiow
    var studiesStartDate: String
    /// data rozpoczecia studiow w AGH
    var studiesStartDateAGH: String
}
