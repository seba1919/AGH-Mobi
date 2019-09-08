//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.

import UIKit

class InformationsViewController: UIViewController {

    // MARK: - Private properties
    private var infromationsView: InformationsView { return self.view as! InformationsView }
    
    // MARK: - Lifecycle
    override func loadView() {
        self.view = InformationsView(frame: UIScreen.main.bounds)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.infromationsView.setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.setupNavigationAttributs()
    }
}

extension InformationsViewController {
    
    // MARK: - Setup
    private func setupNavigationAttributs() {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
}
