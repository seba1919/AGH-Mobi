//
//  Summary.swift
//  AGH Mobile
//
//  Created by Sebastian Wiatrzyk on 16/04/2019.
//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.
//

import UIKit

struct PersonalInfo {
    var albumNr : Int // nr indeksu
    var picture : UIImage // zdjecie profilowe
    var fullName : String // imiona i nazwisko
    var faculty : String // wydzial
    var fieldOfStudy : String // kierunek
    var specialty : String // specjalizacja
    var formOfStudies : String // forma studiow, np stacjonarne
    var studyDegree : String // poziom studiow, np. pierwsze (SEBASTIAN WYMYSLAL NAZWE)
    var educationProfile : String // profil ksztalcenia, np. ogolnoakademicki
    var fieldOfStudyStatus : String // status kierunku, np. pierwszy
    var fieldOfStudyInfo : String // "Platny" / "Nieplatny"
    var studiesStartDate : String // data rozpoczecia studiow
    var studiesStartDateAGH : String // data rozpoczecia studiow w AGH
}
