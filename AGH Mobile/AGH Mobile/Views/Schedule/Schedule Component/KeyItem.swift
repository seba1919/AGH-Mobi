import Foundation
import UIKit

public class KeyItem : UIView, Colorable {
    private static let defaultKeyColor: UIColor = #colorLiteral(red:0.7098, green:0.396, blue:0.396, alpha:1)
    private static let defaultTextColor: UIColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
     private static let defaultBackgroundBoxColor: UIColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    
    lazy var backgroundBox = UIView()
    lazy var infoBoxArea = UIView()
    lazy var titleInfoLabel = UILabel()
    lazy var leftDetailLabel = UILabel()
    lazy var rightDetailLabel = UILabel()
    lazy var tiles = UIStackView()
    
    private var items = [Box]()

    public var actionDelegate: ScheduleTapDelegate? {
        didSet {
            self.items.forEach({
                $0.actionDelegate = self.actionDelegate
            })
        }
    }
    public var backgroundBoxColor: UIColor? {
        get {
            return self.backgroundColor
        }
        set {
            self.backgroundColor = newValue
            self.items.forEach({
                $0.backgroundBoxColor = newValue
            })
        }
    }
    public var keyColor: UIColor? {
        get {
            return self.backgroundBox.backgroundColor
        }
        set {
            self.backgroundBox.backgroundColor = newValue
            self.items.forEach({
                $0.keyColor = newValue
            })
        }
    }
    public var textColor: UIColor? {
        get {
            return self.titleInfoLabel.textColor
        }
        set {
            self.titleInfoLabel.textColor = newValue
            self.items.forEach({
                $0.textColor = newValue
            })
        }
    }
    
    private let cornerRadius: CGFloat = 7
    
    private let verticalMargin: CGFloat = 8
    private let horizontalPadding: CGFloat = 10
    private let verticalPadding: CGFloat = 8
    
    private let titleFontSize: CGFloat = 15
    private let detailFontSize: CGFloat = 12
    
    init(frame: CGRect, numberOfItems: Int) {
        super.init(frame: frame)
        self.isUserInteractionEnabled = true
        self.setupTiles()
        self.setTiles(amount: numberOfItems)
    }
    
    init(frame: CGRect, data: [ScheduleItemData]) {
        super.init(frame: frame)
        self.isUserInteractionEnabled = true
        self.setupComponent()
        self.setupTiles()
        self.setupConstraints()
        self.setTiles(of: data)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            self.widthAnchor.constraint(equalTo: self.widthAnchor),
            self.heightAnchor.constraint(equalTo: self.tiles.heightAnchor)
        ])
    }
    
    private func setupComponent() {
        self.keyColor = KeyItem.defaultKeyColor
        self.backgroundBoxColor = KeyItem.defaultBackgroundBoxColor
        self.textColor = KeyItem.defaultTextColor
    }
    
    private func setupTiles() {
        self.tiles.axis = .horizontal
        self.tiles.alignment = .fill
        self.tiles.spacing = 0
        self.tiles.distribution = .fillEqually
        self.tiles.spacing = 5.0
        
        self.tiles.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(self.tiles)
        NSLayoutConstraint.activate([
            tiles.widthAnchor.constraint(equalTo: self.widthAnchor)
        ])
        
        self.tiles.layoutMargins = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)
        self.tiles.isLayoutMarginsRelativeArrangement = true
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
    
    func setTiles(amount: Int) {
        for _ in 0..<amount {
            let tile = Box(frame: .zero)
            tile.keyColor = keyColor
            tile.textColor = textColor
            tile.actionDelegate = actionDelegate
            self.items.append(tile)
            self.tiles.addArrangedSubview(tile)
        }
    }
    
    func getMaxOffset(of data: [ScheduleItemData]) -> CGFloat {
        var currentOffset: CGFloat = 0
        var maximumValue: CGFloat = 0
        for item in data {
            
            if !item.placeUnderPrevious {
                maximumValue = max(maximumValue, currentOffset)
                currentOffset = 0
            }
            currentOffset += item.offsetFactor+item.heightFactor
        }
        
        maximumValue = max(maximumValue, currentOffset)
        return maximumValue*Box.defaultBoxHeight
    }
    
    private func getTileStack() -> UIStackView {
        let tileStack = UIStackView()
        tileStack.axis = .vertical
        tileStack.alignment = .fill
        tileStack.spacing = 0
        tileStack.distribution = .fill
        return tileStack
    }

    private func getEmptyItem(of height: CGFloat) -> UIView {
        let item = UIView()
        item.translatesAutoresizingMaskIntoConstraints = false
        item.heightAnchor.constraint(equalToConstant: height).isActive = true
        return item
    }
    
    func setTiles(of data: [ScheduleItemData]) {
        let maxOffset = getMaxOffset(of: data)
        var currentHeight: CGFloat = 0
        var currentTileStack = getTileStack()
        for item in data {
            let tile = Box(frame: .zero, heightFactor: item.heightFactor, offsetTop: 0)
            tile.identifier = item.identifier
            tile.textColor = textColor
            tile.keyColor = keyColor
            tile.actionDelegate = actionDelegate
            tile.setTitleLabel(to: item.title)
            tile.setLeftDetailLabel(to: item.leftItem)
            tile.setRightDetailLabel(to: item.rightItem)
            
            if !item.placeUnderPrevious && item !== data.first {
                let bottomOffset = maxOffset-currentHeight
                if bottomOffset > 0 {
                    let emptyItem = getEmptyItem(of: bottomOffset)
                    currentTileStack.addArrangedSubview(emptyItem)
                }
                self.tiles.addArrangedSubview(currentTileStack)
                currentHeight = 0
                currentTileStack = getTileStack()
            }
            
            let topOffset = item.offsetFactor*Box.defaultBoxHeight
            if topOffset > 0 {
                let emptyItem = getEmptyItem(of: topOffset)
                currentTileStack.addArrangedSubview(emptyItem)
            }
            self.items.append(tile)
            currentTileStack.addArrangedSubview(tile)
            currentHeight += topOffset
            currentHeight += tile.frameHeight
        }
        let bottomOffset = maxOffset-currentHeight
        if bottomOffset > 0 {
            let emptyItem = getEmptyItem(of: bottomOffset)
            currentTileStack.addArrangedSubview(emptyItem)
        }
        self.tiles.addArrangedSubview(currentTileStack)
    }
}
