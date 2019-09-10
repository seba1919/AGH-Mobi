//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.

import Foundation

struct StudyProgress {
    /// rok akademicki
    var academicYear: String
    /// rok studiów
    var studiesYear: String
    /// semestr
    var term: String
    /// L - letni; Z - zimowy
    var type: String
    /// data decyzji
    var decisionDate: String
    /// od czasu
    var fromDate: String
    /// do czasu
    var untilDate: String
    /// status studenta
    var studentStatus: String
    /// powód
    var reason: String
}
