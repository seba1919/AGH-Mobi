import UIKit

public protocol ScheduleTapDelegate: class {
    func setupOnTapAction(to: UIView)
    func setupPeekAndPopAction(to view: UIView)
}

public class Box: UIButton, Colorable {
    public static let defaultBoxHeight: CGFloat = 55
    private static let defaultKeyColor: UIColor = #colorLiteral(red:0.7098, green:0.396, blue:0.396, alpha:1)
    private static let defaultBackgroundBoxColor: UIColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    private static let defaultTextColor: UIColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)

    public var identifier: Int?
    
    lazy var itemBox = UIView()
    lazy var backgroundBox = UIView()
    lazy var infoBoxArea = UIView()
    lazy var titleInfoLabel = UILabel()
    lazy var leftDetailLabel = UILabel()
    lazy var rightDetailLabel = UILabel()

    public var actionDelegate: ScheduleTapDelegate? {
        didSet {
            actionDelegate?.setupOnTapAction(to: self)
            actionDelegate?.setupPeekAndPopAction(to: self)
        }
    }
    public var backgroundBoxColor: UIColor? {
        get {
            return self.backgroundColor
        }
        set {
            self.backgroundColor = newValue
        }
    }
    public var textColor: UIColor? {
        get {
            return self.titleInfoLabel.textColor
        }
        set {
            self.titleInfoLabel.textColor = newValue
            self.leftDetailLabel.textColor = newValue
            self.rightDetailLabel.textColor = newValue
        }
    }
    public var keyColor: UIColor? {
        get {
            return self.backgroundBox.backgroundColor
        }
        set {
            self.backgroundBox.backgroundColor = newValue
        }
    }

    private let cornerRadius: CGFloat = 7
    private var offsetTop: CGFloat = 0
    private var offsetBottom: CGFloat = 0

    private var boxHeight: CGFloat = Box.defaultBoxHeight
    private var boxHeightFactor: CGFloat = 1

    private let verticalMargin: CGFloat = 0
    private let horizontalPadding: CGFloat = 10
    private let verticalPadding: CGFloat = 8

    private let titleFontSize: CGFloat = 15
    private let detailFontSize: CGFloat = 12
    public var frameHeight: CGFloat { return 2*self.verticalMargin+self.offsetTop*self.height+self.offsetBottom*self.height+self.height*self.boxHeightFactor }
    public var height: CGFloat { return self.boxHeight  }

    init(frame: CGRect, heightFactor: CGFloat = 1, offsetTop: CGFloat = 0) {
        super.init(frame: frame)
        self.offsetTop = offsetTop
        self.boxHeightFactor = heightFactor
        self.setupBackground()
        self.setupInfoBox()
        self.setupTitleInfoLabel()
        self.setupLeftDetailLabel()
        self.setupRightDetailLabel()
        self.setupActions()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupComponent() {
        self.backgroundBoxColor = Box.defaultBackgroundBoxColor
        self.keyColor = Box.defaultKeyColor
        self.textColor = Box.defaultTextColor
    }

    private func setupBackground() {
        self.backgroundColor = self.backgroundBoxColor
        self.backgroundBox.backgroundColor = self.keyColor
        self.backgroundBox.layer.cornerRadius = self.cornerRadius

        self.backgroundBox.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(self.backgroundBox)

        NSLayoutConstraint.activate([
            backgroundBox.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            backgroundBox.topAnchor.constraint(equalTo: self.topAnchor, constant: self.verticalMargin+self.offsetTop*self.height),
            backgroundBox.widthAnchor.constraint(equalTo: self.widthAnchor),
            backgroundBox.heightAnchor.constraint(equalToConstant: self.boxHeight*self.boxHeightFactor),
            bottomAnchor.constraint(equalTo: backgroundBox.bottomAnchor, constant: self.verticalMargin+self.offsetBottom*self.height)
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
        guard let titleLabel = titleLabel else { return }
        self.leftDetailLabel.textColor = self.textColor
        self.leftDetailLabel.textAlignment = .left
        self.leftDetailLabel.font = UIFont.systemFont(ofSize: self.detailFontSize, weight: UIFont.Weight.regular)
        self.leftDetailLabel.translatesAutoresizingMaskIntoConstraints = false

        self.infoBoxArea.addSubview(self.leftDetailLabel)

        NSLayoutConstraint.activate([
            leftDetailLabel.leadingAnchor.constraint(equalTo: self.infoBoxArea.leadingAnchor),
            leftDetailLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            leftDetailLabel.widthAnchor.constraint(equalTo: self.infoBoxArea.widthAnchor, multiplier: 0.5)
            ])
    }

    private func setupRightDetailLabel() {
        guard let titleLabel = titleLabel else { return }
        self.rightDetailLabel.textColor = self.textColor
        self.rightDetailLabel.textAlignment = .right
        self.rightDetailLabel.font = UIFont.systemFont(ofSize: self.detailFontSize, weight: UIFont.Weight.regular)
        self.rightDetailLabel.translatesAutoresizingMaskIntoConstraints = false

        self.infoBoxArea.addSubview(self.rightDetailLabel)

        NSLayoutConstraint.activate([
            rightDetailLabel.trailingAnchor.constraint(equalTo: self.infoBoxArea.trailingAnchor),
            rightDetailLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
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
    
    private func setupActions() {
        backgroundBox.isUserInteractionEnabled = false
        infoBoxArea.isUserInteractionEnabled = false
        self.isUserInteractionEnabled = true
    }
}
