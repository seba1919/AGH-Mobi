import Foundation
import UIKit

public protocol ScheduleWeekdayLabelDelegate: class {
    func getShortenWeekdayLabel(weekday: Int) -> String?
}

class CalendarView: UIStackView {
    public private(set) var startDate = Date.today.withoutTime
    public var amountOfItems: Int = 7 {
        didSet {
            let difference = amountOfItems-oldValue
            if difference > 0 {
                addItems(difference)
            } else {
                removeItems(-difference)
            }
            setupDates(from: startDate)
        }
    }
    private var selection: CalendarItem?
    public var action: (CalendarItem) -> Void = { (selector: CalendarItem) in }
    lazy var items = [CalendarItem]()
    
    public var labelDelegate: ScheduleWeekdayLabelDelegate? {
        didSet {
            setupWeekdays()
        }
    }

    public var focusColor: UIColor = #colorLiteral(red:0.7098, green:0.396, blue:0.396, alpha:1) {
        didSet {
            items.forEach({ [unowned self] in $0.focusColor = self.focusColor })
        }
    }
    
    public var textColor: UIColor = #colorLiteral(red: 0.4276, green: 0.4, blue: 0.4078, alpha: 1) {
        didSet {
            items.forEach({ [unowned self] in $0.textColor = self.textColor })
        }
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        self.setupStackView()
        self.setupItems()
    }
    
    required public init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func setupDates(from date: Date) {
        self.startDate = date
        var currentDate = date
        let calendar = Calendar.current
       
        for item in items {
            item.setupDate(to: currentDate)
            item.deselect()
            currentDate = calendar.date(byAdding: .day, value: 1, to: currentDate)!
        }
        setupWeekdays()
    }
    
    private func setupItems() {
        for _ in 0..<amountOfItems {
            let item = getCalendarItem()
            items.append(item)
            self.setupItem(item)
        }
    }
    
    private func setupWeekdays() {
        for dayItem in items {
            let weekdayIndex = dayItem.date.weekday-1
            dayItem.weekdayLabel = labelDelegate?.getShortenWeekdayLabel(weekday: weekdayIndex) ?? ""
        }
    }
    
    private func removeItems(_ amount: Int) {
        (0..<amount).forEach({ [unowned self] _ in
            guard let item = self.items.last else { return }
            item.removeFromSuperview()
            self.items.removeLast()
        })
    }
    
    private func addItems(_ amount: Int) {
        let calendar = Calendar.current
        var currentDate = self.items.last?.date ?? startDate
        (0..<amount).forEach({[unowned self] _ in
            currentDate = calendar.date(byAdding: .day, value: 1, to: currentDate)!
            let newItem = getCalendarItem()
            newItem.setupDate(to: currentDate)
            self.setupItem(newItem)
            self.items.append(newItem)
        })
    }
    
    private func getCalendarItem() -> CalendarItem {
        let item = CalendarItem()
        item.focusColor = focusColor
        item.textColor = textColor
        item.action = handleSelection(selected:)
        return item
    }
    
    public func setupStackView() {
        self.axis = .horizontal
        self.alignment = .fill
        self.spacing = 0
        self.distribution = .fillEqually
    }
    
    public func deselectAll() {
        for item in items {
            item.deselect()
        }
    }
    
    public func handleSelection(selected: CalendarItem) {
        self.action(selected)
        self.updateSelection(selected: selected)
    }
    
    public func updateSelection(selected: CalendarItem) {
        for item in items {
            if item != selected {
                item.deselect()
            } else {
                item.select()
            }
        }
    }
    
    private func setupItem(_ item: UIView) {
        self.addArrangedSubview(item)
        item.translatesAutoresizingMaskIntoConstraints = false
    }
    
    public func setupFocusColor(to color: UIColor) {
        for item in items {
            item.setupFocusColor(to: color)
        }
    }
    
    public func setupTextColor(to color: UIColor) {
        for item in items {
            item.setupTextColor(to: color)
        }
    }
}
