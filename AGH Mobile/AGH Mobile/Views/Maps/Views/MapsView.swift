//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.

import UIKit
import MapKit
import SnapKit

class MapsView: UIView {
    
    // MARK: - Componetnts of View
    private(set) lazy var mapView: MKMapView = {
        let view = MKMapView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MapsView {
    
    // MARK: - Setups
    fileprivate func setupView() {
        backgroundColor = #colorLiteral(red: 0.9568627451, green: 0.9568627451, blue: 0.9058823529, alpha: 1)
        addSubview(mapView)
        
        mapView.snp.makeConstraints { (make) in
            make.width.equalTo(self)
            make.top.equalTo(self.safeAreaInsets.top)
            make.bottom.equalTo(self).offset(-77.0-45.0)
        }
    }
}
