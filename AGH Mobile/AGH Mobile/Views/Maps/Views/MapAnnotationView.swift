//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.

import MapKit
import UIKit

class MapAnnotationView: MKAnnotationView {
    
    static let annotationViewId = "MapAnnotationView"
    
    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MapAnnotationView {
    
    private func setupView() {
        if let annotation = annotation as? MapAnnotation {
            guard let customImage = UIImage(named: annotation.feature.properties.imageName) else {
                return
            }
            image = customImage
        }
    }
}
