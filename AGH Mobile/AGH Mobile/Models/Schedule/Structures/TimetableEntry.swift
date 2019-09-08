//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.

import Foundation

struct TimetableEntry: Decodable {
    
    var from: String // od
    var until: String // do
    var course: String // przedmiot
    var lecturer: String // prowadzacy
    var classroom: String // sala, budynek
    var formOfClasses: String // forma zajec
}
