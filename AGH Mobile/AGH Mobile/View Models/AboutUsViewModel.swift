//
//  AboutUsViewModel.swift
//  AGH Mobile
//
//  Created by Sebastian Wiatrzyk on 04/12/2019.
//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.
//

import UIKit

protocol AboutUsViewModelDelegate: class {
    func viewModel(_ viewModel: AboutUsViewModel, isLoading: Bool)
    func viewModelUpdate(_ viewModel: AboutUsViewModel)
}

class AboutUsViewModel {
    
    // MARK: - Dependencies
    weak var delegate: AboutUsViewModelDelegate?
    private let coordinator: AboutUsCoordinator
    private let model: MembersInfoService
    
    private let webPageAddress = "https://www.mackn.agh.edu.pl"
    
    //To be used with dynamic data
    private(set) var isLoading: Bool = false {
        didSet {
            self.delegate?.viewModel(self, isLoading: self.isLoading)
        }
    }
    
    private(set) var people: [Person] = []
    
    init(coordinator: AboutUsCoordinator, api: MembersInfoService) {
        self.coordinator = coordinator
        self.model = api
    }
    
    public func reloadPeople() {
        guard !isLoading else {
            return
        }
        
        model.getPeople { people in
            self.people = people
        }
    }
    
    func personSelected(with index: Int) {
        let person = people[index]
        coordinator.show(person)
    }
    
    public func openMacKNWebPage() {
        if let url = URL(string: self.webPageAddress) {
            UIApplication.shared.open(url)
        }
    }
}
