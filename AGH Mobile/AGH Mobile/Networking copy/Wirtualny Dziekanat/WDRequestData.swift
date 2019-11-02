//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.

import Foundation

/// Struct includes properties for parameters,
/// which are required for creating requests to Wirtualny Dziekanat.
/// That's how are named request parameters for old ASP.NET architecture,
/// that Wirtualny Dziekanad is maintained with.
struct WDRequestData {
    var viewState: String?
    var viewGenerator: String?
    var eventValidation: String?
}
