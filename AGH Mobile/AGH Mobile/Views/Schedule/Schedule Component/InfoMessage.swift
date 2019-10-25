import Foundation
import UIKit

public class InfoMessage: UIView, Colorable {
    private static let defaultKeyColor: UIColor = #colorLiteral(red:0.7098, green:0.396, blue:0.396, alpha:1)
    
    lazy var backgroundBox = UIView()
    lazy var titleLabel = UILabel()
    
    public var backgroundBoxColor: UIColor? {
        get {
            return self.backgroundColor
        }
        set {
            self.backgroundColor = newValue
        }
    }
    public var keyColor: UIColor? {
        get {
            return self.titleLabel.textColor
        }
        set {
            self.titleLabel.textColor = newValue
        }
    }
    private let titleFontSize: CGFloat = 12
    
    private let verticalMargin: CGFloat = 8
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupComponent()
        self.setupBackground()
        self.setupTitleLabel()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupComponent() {
        self.keyColor = InfoMessage.defaultKeyColor
    }
    
    private func setupBackground() {
        self.backgroundBox.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(self.backgroundBox)
        
        NSLayoutConstraint.activate([
            backgroundBox.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            backgroundBox.topAnchor.constraint(equalTo: self.topAnchor, constant: self.verticalMargin),
            
            backgroundBox.widthAnchor.constraint(equalTo: self.widthAnchor),
            backgroundBox.heightAnchor.constraint(equalTo: self.heightAnchor, constant: -2*self.verticalMargin)
            ])
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        self.layoutLabel()
    }
    
    private func layoutLabel() {
        self.titleLabel.center.y = self.center.y
    }
    
    private func setupTitleLabel() {
        self.titleLabel.textColor = self.keyColor
        self.titleLabel.textAlignment = .left
        self.titleLabel.font = UIFont.systemFont(ofSize: self.titleFontSize, weight: UIFont.Weight.regular)
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(self.titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor),
            
            titleLabel.widthAnchor.constraint(equalTo: self.widthAnchor)
            ])
    }
    
    public func setTitleLabel(to titleLabel: String) {
        self.titleLabel.text = titleLabel
    }
}
