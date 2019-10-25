//
//  ScheduleView.swift
//  AGH Mobile
//
//  Created by Bartłomiej Pluta on 07/10/2019.
//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.
//

import Foundation
import SnapKit

public protocol ScheduleDataSourceDelegate: class {
    func scheduleData(for date: Date) -> [SubjectItem]
    func scheduleData(since date: Date) -> [[SubjectItem]]
}
public protocol ScheduleLabelDelegate: ScheduleBreakLabelDelegate, ScheduleWeekdayLabelDelegate, ScheduleEmptyStateDelegate { }
public protocol ScheduleActionDelegate: ScheduleTapDelegate, ScheduleDatePickerDelegate { }

class ScheduleView: UIView {
    
    // MARK: - Colors
    public let keyColor: UIColor = UIColor.mainRed
    public let backgroundBoxColor: UIColor = UIColor.white
    public let calendarTextColor: UIColor = UIColor.customDarkGray
    public let titleColor: UIColor = UIColor.black
    public let separatorColor: UIColor = UIColor.customMediumGray
    
    // MARK: - Delegates
    public weak var dataSourceDelegate: ScheduleDataSourceDelegate?
    public var actionDelegate: ScheduleActionDelegate? {
        didSet {
            tapDelegate = actionDelegate
            datePickerDelegate = actionDelegate
        }
    }
    private var tapDelegate: ScheduleTapDelegate? {
        didSet {
            schedule.actionDelegate = tapDelegate
        }
    }
    private var datePickerDelegate: ScheduleDatePickerDelegate? {
        didSet {
            slider.datePickerDelegate = datePickerDelegate
        }
    }
    
    @objc private func onSegmentedControlChange(_ sender: UISegmentedControl) {
        getScheduleData()
    }
    
    private func getScheduleData() {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            guard let dailyData = dataSourceDelegate?.scheduleData(for: currentDate) else { return }
            schedule.setupContent(from: dailyData)
            return
        case 1:
            let startDate = currentDate.previous(.monday, considerToday: true)
            guard let weeklyData = dataSourceDelegate?.scheduleData(since: startDate) else { return }
            schedule.setupContent(from: weeklyData.first ?? [])
            return
        default:
            return
        }
    }
    
    // MARK: - Private properties
    private lazy var screenHeight = self.frame.height
    private lazy var screenWidth = self.frame.width
    private lazy var topPadding = self.frame.height * 0.0225
    
    public var currentDate = Date.today.withoutTime {
        didSet {
            schedule.setupTitle(to: getDayTitleLabel())
            getScheduleData()
        }
    }
    
    // MARK: - Components of View
    private lazy var tabBarTitle: UILabel = {
        let label = TabBarPageTitleLabel(
            title: "ScheduleView_Schedule".localized)
            .build()
        return label
    }()
    
    private lazy var slider: CalendarHeader = { [unowned self] in
        let slider = CalendarHeader()
        slider.focusColor = keyColor
        slider.textColor = calendarTextColor
        slider.backgroundColor = backgroundBoxColor
        
        slider.labelDelegate = self
        slider.datePickerDelegate = datePickerDelegate
        
        slider.daysPerView = 7
        slider.daysSkipped = 0
        return slider
    }()
    
    private lazy var calendarSlider: UIView = { [unowned self] in
        let sliderContainer = UIView()
        sliderContainer.translatesAutoresizingMaskIntoConstraints = false
        sliderContainer.addSubview(self.slider.view)
        self.slider.view.frame = sliderContainer.frame
        return sliderContainer
    }()
    
    public lazy var schedule: DailyScheduleView = { [unowned self] in
        let schedule = DailyScheduleView()
        schedule.labelDelegate = self
        schedule.actionDelegate = tapDelegate
        
        schedule.setupTitle(to: getDayTitleLabel())
        
        schedule.backgroundColor = backgroundBoxColor
        schedule.keyColor = keyColor
        schedule.textColor = backgroundBoxColor
        schedule.titleColor = titleColor
        schedule.translatesAutoresizingMaskIntoConstraints = false
        
        return schedule
    }()
    
    private lazy var separator: UIView = { [unowned self] in
        let separator = UIView()
        separator.backgroundColor = separatorColor
        separator.translatesAutoresizingMaskIntoConstraints = false
        return separator
    }()
    
    private lazy var segmentedControl: UISegmentedControl = { [unowned self] in
        let segmentedControl = UISegmentedControl(items: ["ScheduleView_Day".localized, "ScheduleView_Week".localized])
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.layer.cornerRadius = 5.0
        segmentedControl.backgroundColor = backgroundBoxColor
        segmentedControl.addTarget(self, action: #selector(onSegmentedControlChange), for: .valueChanged)
        
        if #available(iOS 13.0, *) {
            segmentedControl.backgroundColor = keyColor
            segmentedControl.selectedSegmentTintColor = backgroundBoxColor
            segmentedControl.setTitleTextAttributes([.foregroundColor: backgroundBoxColor], for: .normal)
            segmentedControl.setTitleTextAttributes([.foregroundColor: keyColor], for: .selected)
        } else {
            segmentedControl.tintColor = keyColor
        }
        return segmentedControl
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ScheduleView {
    
    // MARK: - Setup View
    public func setupUI() {
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        self.backgroundColor = backgroundBoxColor
        self.addSubview(tabBarTitle)
        self.addSubview(segmentedControl)
        self.addSubview(calendarSlider)
        self.addSubview(separator)
        self.addSubview(schedule)
        
        let date = Date.today.withoutTime
        slider.selectedDate = date
        currentDate = date
    }
    
    // MARK: - Setup Constraints
    private func setupConstraints() {
        tabBarTitle.snp.makeConstraints { (make) in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(topPadding)
            make.centerX.equalTo(safeAreaLayoutGuide.snp.centerX)
        }
        
        segmentedControl.snp.makeConstraints { (make) in
            make.top.equalTo(tabBarTitle.snp.bottom).offset(screenHeight * 0.02)
            make.centerX.equalTo(safeAreaLayoutGuide.snp.centerX)
            make.width.equalTo(screenWidth * 0.6)
        }
        
        calendarSlider.snp.makeConstraints { (make) in
            make.top.equalTo(segmentedControl.snp.bottom).offset(screenHeight * 0.02)
            make.left.equalTo(safeAreaLayoutGuide.snp.left)
            make.right.equalTo(safeAreaLayoutGuide.snp.right)
            make.height.equalTo(75)
        }
        
        separator.snp.makeConstraints { (make) in
            make.top.equalTo(calendarSlider.snp.bottom).offset(screenHeight * 0.02)
            make.left.equalTo(safeAreaLayoutGuide.snp.left)
            make.right.equalTo(safeAreaLayoutGuide.snp.right)
            make.height.equalTo(0.5)
        }
        
        schedule.snp.makeConstraints { (make) in
            make.top.equalTo(separator.snp.bottom)
            make.left.equalTo(safeAreaLayoutGuide.snp.left).offset(12)
            make.right.equalTo(safeAreaLayoutGuide.snp.right).offset(-12)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
        }
    }
}

// MARK: Setup Labels
extension ScheduleView: ScheduleLabelDelegate {
    func getDayTitleLabel() -> String {
        guard let weekday = WeekdayObject(rawValue: currentDate.weekday-1) else { return "" }
        guard let month = MonthObject(rawValue: currentDate.month-1) else { return "" }
        let day = currentDate.day
        return "\(weekday.fullNameLocalizeKey.localized),\n\(day)\u{00a0}\(month.localizeKey.localized)"
    }
    
    func getEmptyStateTitle() -> String {
        return "ScheduleView_EmptyStateTitle".localized
    }
    
    func getEmptyStateSubtitle() -> String {
        return "ScheduleView_EmptyStateSubitle".localized
    }
    
    func getShortenWeekdayLabel(weekday: Int) -> String? {
        guard let weekday = WeekdayObject(rawValue: weekday) else { return nil }
        return weekday.shortNameLocalizeKey.localized
    }
    
    func getBreakLabel(time: TimeInterval) -> String {
        let andLocalizeString = "And"
        let breakLabelLocalizeString = "ScheduleView_BreakLabel"
        
        func buildBreakLabel(mainTime: String, detailTime: String? = nil) -> String {
            var timeLabel = "\(mainTime)"
            if let detailTime = detailTime {
                timeLabel += " \(andLocalizeString.localized) \(detailTime)"
            }
            return breakLabelLocalizeString.localized(timeLabel)
        }
        
        func getLabel(of type: TimeObject) -> String {
            let timeDividor = type.rawValue
            let childTimeDividor = type.child?.rawValue ?? 1
            
            let leftover = Int((time - floor(time/timeDividor)*timeDividor)/childTimeDividor)
            let time = Int(time/timeDividor)
            
            let mainTime = type.localizeKey.localized(time)
            let detailTime = leftover >= 1 ? type.child?.localizeKey.localized(leftover) : nil
            return buildBreakLabel(mainTime: mainTime, detailTime: detailTime)
        }
        
        if time.minutes < 1 {
            return getLabel(of: .seconds)
        } else if time.hours < 1 {
            return getLabel(of: .minutes)
        } else if time.days < 1 {
            return getLabel(of: .hours)
        } else if time.years < 1 {
            return getLabel(of: .days)
        } else {
            return getLabel(of: .years)
        }
    }
}

// MARK: Time Labels Localization
fileprivate extension ScheduleView {
    enum TimeObject: TimeInterval {
        case seconds = 1
        case minutes = 60
        case hours = 3600
        case days = 86400
        case years = 31536000
        
        var child: TimeObject? {
            switch self {
            case .seconds:
                return nil
            case .minutes:
                return .seconds
            case .hours:
                return .minutes
            case .days:
                return .hours
            case .years:
                return .days
            }
        }
        
        var localizeKey: String {
            switch self {
            case .seconds:
                return "Seconds"
            case .minutes:
                return "Minutes"
            case .hours:
                return "Hours"
            case .days:
                return "Days"
            case .years:
                return "Years"
            }
        }
    }
    
    enum MonthObject: Int {
        case january
        case february
        case march
        case april
        case may
        case june
        case july
        case august
        case september
        case october
        case november
        case december
        
        var localizeKey: String {
            switch self {
            case .january:
                return "January"
            case .february:
                return "February"
            case .march:
                return "March"
            case .april:
                return "April"
            case .may:
                return "May"
            case .june:
                return "June"
            case .july:
                return "July"
            case .august:
                return "August"
            case .september:
                return "September"
            case .october:
                return "October"
            case .november:
                return "November"
            case .december:
                return "December"
            }
        }
    }
    
    enum WeekdayObject: Int {
        case sunday
        case monday
        case tuesday
        case wednesday
        case thursday
        case friday
        case saturday

        var fullNameLocalizeKey: String {
            switch self {
            case .sunday:
                return "Sunday"
            case .monday:
                return "Monday"
            case .tuesday:
                return "Tuesday"
            case .wednesday:
                return "Wednesday"
            case .thursday:
                return "Thursday"
            case .friday:
                return "Friday"
            case .saturday:
                return "Saturday"
            }
        }
        
        var shortNameLocalizeKey: String {
            switch self {
            case .sunday:
                return "Sunday_Short"
            case .monday:
                return "Monday_Short"
            case .tuesday:
                return "Tuesday_Short"
            case .wednesday:
                return "Wednesday_Short"
            case .thursday:
                return "Thursday_Short"
            case .friday:
                return "Friday_Short"
            case .saturday:
                return "Saturday_Short"
            }
        }
    }
}

