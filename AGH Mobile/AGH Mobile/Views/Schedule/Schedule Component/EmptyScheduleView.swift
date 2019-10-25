import UIKit

public protocol ScheduleEmptyStateDelegate: class {
    func getEmptyStateTitle() -> String
    func getEmptyStateSubtitle() -> String
}

class EmptyScheduleView: UIView {
    static let defaultKeyColor: CGColor = #colorLiteral(red:0.7098, green:0.396, blue:0.396, alpha:1)
    static let defaultBackgroundBoxColor: CGColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    
    lazy var labelContainer = UIStackView()
    lazy var titleLabel = UILabel()
    lazy var subtitleLabel = UILabel()
    
    public var keyColor: UIColor? {
        get {
            return titleLabel.textColor
        }
        set {
            titleLabel.textColor = newValue
            subtitleLabel.textColor = newValue
        }
    }
    public var backgroundBoxColor: UIColor? {
        get {
            return backgroundColor
        }
        set {
            backgroundColor = newValue
        }
    }
    public var title: String? {
        get {
            return titleLabel.text
        }
        set {
            titleLabel.text = newValue
        }
    }
    public var subtitle: String? {
        get {
            return subtitleLabel.text
        }
        set {
            subtitleLabel.text = newValue
        }
    }
    public var labelDelegate: ScheduleEmptyStateDelegate? {
        didSet {
            title = labelDelegate?.getEmptyStateTitle()
            subtitle = labelDelegate?.getEmptyStateSubtitle()
        }
    }
    
    var titleFontSize: CGFloat = 30
    var subtitleFontSize: CGFloat = 20
    var fontSize: CGFloat = 15
    var rightOffset: CGFloat = 15
    var topOffset: CGFloat = 25
    var lineWidth: CGFloat = 3.0
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        self.configure()
        self.setupLabelContainer()
        self.setupTitleLabel()
        self.setupSubtitleLabel()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure() {
        isOpaque = false
        keyColor = UIColor(cgColor: Timeline.defaultKeyColor)
        backgroundBoxColor = UIColor(cgColor: Timeline.defaultBackgroundBoxColor)
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
    }
    
    private func setupLabelContainer() {
        self.labelContainer.translatesAutoresizingMaskIntoConstraints = false
        self.labelContainer.axis = .vertical
        self.labelContainer.spacing = 10
        self.addSubview(self.labelContainer)
        NSLayoutConstraint.activate([
            labelContainer.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.7),
            labelContainer.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            labelContainer.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -10)
        ])
    }
    
    private func setupTitleLabel() {
        self.titleLabel.textColor = self.keyColor
        self.titleLabel.textAlignment = .center
        self.titleLabel.numberOfLines = 0
        self.titleLabel.lineBreakMode = .byWordWrapping
        self.titleLabel.font = UIFont.systemFont(ofSize: self.titleFontSize, weight: UIFont.Weight.heavy)

        self.labelContainer.addArrangedSubview(self.titleLabel)
    }
    
    private func setupSubtitleLabel() {
        self.subtitleLabel.textColor = self.keyColor
        self.subtitleLabel.textAlignment = .center
        self.subtitleLabel.numberOfLines = 0
        self.subtitleLabel.lineBreakMode = .byWordWrapping
        self.subtitleLabel.font = UIFont.systemFont(ofSize: self.subtitleFontSize, weight: UIFont.Weight.regular)

        self.labelContainer.addArrangedSubview(self.subtitleLabel)
    }
}
