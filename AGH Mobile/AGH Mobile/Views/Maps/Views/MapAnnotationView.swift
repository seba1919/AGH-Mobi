//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.

import MapKit
import UIKit

class MapAnnotationView: MKAnnotationView {
    
    static let annotationViewId = "MapAnnotationView"
    
    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        setNotSelectedView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        if selected {
            setSelectedView()
        } else {
            setNotSelectedView()
        }
    }
}

extension MapAnnotationView {
    
    private func setNotSelectedView() {
        if let annotation = annotation as? MapAnnotation {
            guard let customImage = UIImage(named: annotation.feature.properties.imageName) else {
                return
            }
            centerOffset = .zero
            image = customImage
        }
    }
    
    private func setSelectedView() {
        if let annotation = annotation as? MapAnnotation {
            guard let customImage = UIImage(named: "\(annotation.feature.properties.imageName)_focused") else {
                return
            }
            let offset = CGPoint(x: 0.0, y: -(customImage.size.height / 2.5) )
            centerOffset = offset
            image = customImage
        }
    }
}
