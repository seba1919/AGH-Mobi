//
//  TeamScrollView.swift
//  
//
//  Created by Mateusz Bąk on 16/04/2019.
//

// ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
// MARK: - Import

import UIKit

// ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
// MARK: - Implementation

public class TeamScrollView: UIScrollView {
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Properties
    
    lazy var teamStackView = UIStackView()
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // ----- ----- ----- ----- ----- ----- ----- ----- ----- -----
    // MARK: - Setup
    
    private func setupUI() {
        self.setupTeamStackView()
        self.setupTeamStackViewConstraint()
    }
    
    private func setupTeamStackView() {
        teamStackView.axis = .horizontal
        teamStackView.alignment = .center
        teamStackView.backgroundColor = .red
        
        self.addSubview(teamStackView)
    }
    
    private func setupTeamStackViewConstraint() {
        teamStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            teamStackView.topAnchor.constraint(equalTo: self.topAnchor),
            teamStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            teamStackView.rightAnchor.constraint(equalTo: self.rightAnchor),
            teamStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            ])
    }
    
}

