import Foundation
import UIKit

class CalendarItem: UIButton {
    private static let defaultFocusColor: UIColor = #colorLiteral(red:0.7098, green:0.396, blue:0.396, alpha:1)
    private static let defaultTextColor: UIColor = #colorLiteral(red: 0.4276, green: 0.4, blue: 0.4078, alpha: 1)
    
    lazy private(set) var date = Date.today.withoutTime
    lazy var dayNumber = UILabel()
    lazy var weekday = UILabel()
    lazy var underline = UIView()
    lazy var box = UIStackView()
    
    public var action: (CalendarItem) -> Void = { (selector: CalendarItem) in }
    
    public var focusColor: UIColor? = defaultFocusColor {
        didSet {
            refreshSelection()
        }
    }
    public var textColor: UIColor? = defaultTextColor {
        didSet {
            refreshSelection()
        }
    }
    public var weekdayLabel: String? {
        get {
            return weekday.text
        }
        set {
            weekday.text = newValue
        }
    }
    private let titleFontSize: CGFloat = 30
    private let minorFontSize: CGFloat = 15
    private let underlineHeight: CGFloat = 10
    
    let weekdayNames = [String]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupStackView()
        setupBox()
        setupMainLabel()
        setupMinorLabel()
        setupUnderline()
        setupActions()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc public func onClick() {
        if !isSelected {
            self.action(self)
            self.select()
        }
    }
    
    private func setupStackView() {
        box.isUserInteractionEnabled = false
        box.axis = .vertical
        box.alignment = .fill
        box.spacing = 0
        box.distribution = .fill
    }
    
    private func setupActions() {
        addTarget(self, action: #selector(self.onClick), for: .touchUpInside)
    }
    
    public func setupDate(to date: Date) {
        self.date = date
        self.setupDayLabel(to: date.day)
    }
    
    public func setupDayLabel(to day: Int) {
        self.dayNumber.text = String(day)
    }
    
    private func setupMainLabel() {
        self.dayNumber.textColor = self.textColor
        self.dayNumber.textAlignment = .center
        self.dayNumber.font = UIFont.systemFont(ofSize: self.titleFontSize, weight: UIFont.Weight.regular)
        self.dayNumber.translatesAutoresizingMaskIntoConstraints = false
        
        self.box.addArrangedSubview(self.dayNumber)
        
        NSLayoutConstraint.activate([
            dayNumber.centerXAnchor.constraint(equalTo: self.box.centerXAnchor)
        ])
    }
    
    private func setupMinorLabel() {
        self.weekday.textColor = self.textColor
        self.weekday.textAlignment = .center
        self.weekday.font = UIFont.systemFont(ofSize: self.minorFontSize, weight: UIFont.Weight.regular)
        self.weekday.translatesAutoresizingMaskIntoConstraints = false
        
        self.box.addArrangedSubview(self.weekday)
        
        NSLayoutConstraint.activate([
            weekday.centerXAnchor.constraint(equalTo: self.box.centerXAnchor)
            ])
    }
    
    private func setupBox() {
        self.box.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(self.box)
        
        NSLayoutConstraint.activate([
            box.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            box.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
    
    private func setupUnderline() {
        self.underline.backgroundColor = self.focusColor
        self.underline.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(underline)
        
        NSLayoutConstraint.activate([
            underline.topAnchor.constraint(equalTo: self.box.bottomAnchor, constant: 5),
            underline.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            underline.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8),
            underline.heightAnchor.constraint(equalToConstant: 4.0)
            ])
    }
    
    private func refreshSelection() {
        if isSelected {
            select()
        } else {
            deselect()
        }
        self.underline.backgroundColor = focusColor
    }
    
    public func select() {
        self.isSelected = true
        self.underline.isHidden = false
        self.dayNumber.textColor = self.focusColor
        self.weekday.textColor = self.focusColor
    }
    
    public func deselect() {
        self.isSelected = false
        self.underline.isHidden = true
        self.dayNumber.textColor = self.textColor
        self.weekday.textColor = self.textColor
    }
    
    public static func == (lhs: CalendarItem, rhs: CalendarItem) -> Bool {
        return Calendar.current.isDate(lhs.date, inSameDayAs: rhs.date)
    }
    
    public static func != (lhs: CalendarItem, rhs: CalendarItem) -> Bool {
        return !Calendar.current.isDate(lhs.date, inSameDayAs: rhs.date)
    }
    
    public func setupFocusColor(to color: UIColor) {
        self.focusColor = color
        if isSelected { self.select() }
    }
    
    public func setupTextColor(to color: UIColor) {
        self.textColor = color
        if !isSelected { self.deselect() }
    }
}
