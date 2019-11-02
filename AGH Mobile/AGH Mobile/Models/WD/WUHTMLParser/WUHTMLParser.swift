//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.

import Foundation
import Kanna

class WUHTMLParser {
    
    static func getGradesFrom() {
        let htmlFile = Bundle.main.path(forResource: "WDGrades", ofType: "html")
        let htmlString = try? String(contentsOfFile: htmlFile!, encoding: String.Encoding.utf8)
        if let doc = try? HTML(html: htmlString!, encoding: .utf8) {
            print(doc.body)
        }
    }
}
