//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.

import MapKit

class MapAnnotation: NSObject, MKAnnotation {

    // MARK: - Public property
    var feature: MapDataFeature
    var coordinate: CLLocationCoordinate2D
    var title: String?

    // MARK: - Init
    init(forFeature feature: MapDataFeature) {
        self.feature = feature
        self.title = feature.properties.name
        self.coordinate = CLLocationCoordinate2D(latitude: feature.geometry.coordinates[1],
                                                 longitude: feature.geometry.coordinates[0])
    }
}
