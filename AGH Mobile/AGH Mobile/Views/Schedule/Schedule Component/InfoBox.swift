import Foundation
import UIKit

public class InfoBox : UIButton {
    private static let defaultBackgroundBoxColor: UIColor = #colorLiteral(red:0.7098, green:0.396, blue:0.396, alpha:1)
    private static let defaultTextColor: UIColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    
    lazy var backgroundBox = UIView()
    lazy var infoBoxArea = UIView()
    lazy var titleInfoLabel = UILabel()
    lazy var leftDetailLabel = UILabel()
    lazy var rightDetailLabel = UILabel()
    
    public var backgroundBoxColor: UIColor? {
        get {
            return self.backgroundBox.backgroundColor
        }
        set {
            self.backgroundBox.backgroundColor = newValue
        }
    }
    public var textColor: UIColor? {
        get {
            return self.titleInfoLabel.textColor
        }
        set {
            self.titleInfoLabel.textColor = newValue
        }
    }
    
    private let cornerRadius: CGFloat = 7
    
    private let verticalMargin: CGFloat = 8
    private let horizontalPadding: CGFloat = 10
    private let verticalPadding: CGFloat = 8
    
    private let titleFontSize: CGFloat = 15
    private let detailFontSize: CGFloat = 12
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupComponent()
        self.setupBackground()
        self.setupInfoBox()
        self.setupTitleInfoLabel()
        self.setupLeftDetailLabel()
        self.setupRightDetailLabel()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupComponent() {
        backgroundBoxColor = InfoBox.defaultBackgroundBoxColor
        textColor = InfoBox.defaultTextColor
    }
    
    private func setupBackground() {
        self.backgroundBox.backgroundColor = self.backgroundBoxColor
        self.backgroundBox.layer.cornerRadius = self.cornerRadius
        
        self.backgroundBox.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(self.backgroundBox)
        
        NSLayoutConstraint.activate([
            backgroundBox.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            backgroundBox.topAnchor.constraint(equalTo: self.topAnchor, constant: self.verticalMargin),
            
            backgroundBox.widthAnchor.constraint(equalTo: self.widthAnchor),
            backgroundBox.heightAnchor.constraint(equalTo: self.heightAnchor, constant: -2*self.verticalMargin)
            ])
    }
    
    private func setupInfoBox() {
        self.infoBoxArea.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(self.infoBoxArea)
        NSLayoutConstraint.activate([
            infoBoxArea.leadingAnchor.constraint(equalTo: self.backgroundBox.leadingAnchor, constant: self.horizontalPadding),
            infoBoxArea.topAnchor.constraint(equalTo: self.backgroundBox.topAnchor, constant: self.verticalPadding),
            
            infoBoxArea.widthAnchor.constraint(equalTo: self.backgroundBox.widthAnchor, constant: -2*horizontalPadding),
            infoBoxArea.heightAnchor.constraint(equalTo: self.backgroundBox.heightAnchor, constant: -2*verticalPadding)
            ])
    }
    
    private func setupTitleInfoLabel() {
        self.titleInfoLabel.textColor = self.textColor
        self.titleInfoLabel.textAlignment = .left
        self.titleInfoLabel.font = UIFont.systemFont(ofSize: self.titleFontSize, weight: UIFont.Weight.bold)
        self.titleInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.infoBoxArea.addSubview(self.titleInfoLabel)
        
        NSLayoutConstraint.activate([
            titleInfoLabel.leadingAnchor.constraint(equalTo: self.infoBoxArea.leadingAnchor),
            titleInfoLabel.topAnchor.constraint(equalTo: self.infoBoxArea.topAnchor),
            
            titleInfoLabel.widthAnchor.constraint(equalTo: self.infoBoxArea.widthAnchor)
            ])
    }
    
    private func setupLeftDetailLabel() {
        self.leftDetailLabel.textColor = self.textColor
        self.leftDetailLabel.textAlignment = .left
        self.leftDetailLabel.font = UIFont.systemFont(ofSize: self.detailFontSize, weight: UIFont.Weight.regular)
        self.leftDetailLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.infoBoxArea.addSubview(self.leftDetailLabel)
        
        NSLayoutConstraint.activate([
            leftDetailLabel.leadingAnchor.constraint(equalTo: self.infoBoxArea.leadingAnchor),
            leftDetailLabel.bottomAnchor.constraint(equalTo: self.infoBoxArea.bottomAnchor),
            
            leftDetailLabel.widthAnchor.constraint(equalTo: self.infoBoxArea.widthAnchor, multiplier: 0.5)
            ])
    }
    
    private func setupRightDetailLabel() {
        self.rightDetailLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.rightDetailLabel.textAlignment = .right
        self.rightDetailLabel.font = UIFont.systemFont(ofSize: self.detailFontSize, weight: UIFont.Weight.regular)
        self.rightDetailLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.infoBoxArea.addSubview(self.rightDetailLabel)
        
        NSLayoutConstraint.activate([
            rightDetailLabel.trailingAnchor.constraint(equalTo: self.infoBoxArea.trailingAnchor),
            rightDetailLabel.bottomAnchor.constraint(equalTo: self.infoBoxArea.bottomAnchor),
            
            rightDetailLabel.widthAnchor.constraint(equalTo: self.infoBoxArea.widthAnchor, multiplier: 0.5)
            ])
    }
    
    public func setTitleLabel(to titleLabel: String) {
        self.titleInfoLabel.text = titleLabel
    }
    
    public func setRightDetailLabel(to rightLabel: String) {
        self.rightDetailLabel.text = rightLabel
    }
    
    public func setLeftDetailLabel(to leftLabel: String) {
        self.leftDetailLabel.text = leftLabel
    }
}
