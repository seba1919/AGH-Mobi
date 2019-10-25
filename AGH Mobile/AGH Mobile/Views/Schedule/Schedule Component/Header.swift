import UIKit

public protocol ScheduleDatePickerDelegate: class {
    func onDateSelect(_ date: Date?)
}

public class CalendarHeader: UIViewController {
    
    private(set) var selection: CalendarItem? {
        didSet {
            self.updateSelection(selection: self.selection)
            self.datePickerDelegate?.onDateSelect(self.selection?.date)
        }
    }
    
    public weak var datePickerDelegate: ScheduleDatePickerDelegate?
    public var labelDelegate: ScheduleLabelDelegate? {
        didSet {
            for page in pageViews {
                page.labelDelegate = labelDelegate
            }
        }
    }
    public var selectedDate: Date? {
        get {
            return selection?.date
        }
        set {
            guard let newValue = newValue?.withoutTime else { return }
            currentDate = newValue.previous(.monday, considerToday: true)
            prepareImagesAndViews()
            let numberOfDays = Int(floor(newValue.timeIntervalSince(currentDate).days))
            updateSelection(selection: pageViews[1].items[numberOfDays])
        }
    }
    public var backgroundColor: UIColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0) {
        didSet {
            self.view.backgroundColor = self.backgroundColor
        }
    }
    public var focusColor: UIColor = #colorLiteral(red:0.7098, green:0.396, blue:0.396, alpha:1) {
        didSet {
            pageViews.forEach({ [unowned self] in $0.focusColor = self.focusColor})
        }
    }
    public var textColor: UIColor = #colorLiteral(red: 0.4276, green: 0.4, blue: 0.4078, alpha: 1) {
        didSet {
            pageViews.forEach({ [unowned self] in $0.textColor = self.textColor})
        }
    }
    public var currentWeekDate: Date {
        get {
            return currentDate
        }
        set {
            currentDate = newValue
            prepareImagesAndViews()
        }
    }
    public var daysPerView: Int = 7 {
        didSet {
            pageViews.forEach({[unowned self] in $0.amountOfItems = self.daysPerView})
            prepareImagesAndViews()
        }
    }
    public var daysSkipped: Int = 0 {
        didSet {
            prepareImagesAndViews()
        }
    }
    private var isDragging = false
    private let height: CGFloat = 75
    
    lazy var scrollView = UIScrollView()
    private var scrollViewSize: CGSize = .zero

    lazy private var pageViews: [CalendarView] = [CalendarView(), CalendarView(), CalendarView()]
    private var currentDate = Date.today.previous(.monday, considerToday: true)
    
    override public func loadView() {
        super.loadView()
        self.view.backgroundColor = self.backgroundColor
        self.scrollView.isUserInteractionEnabled = true
        self.scrollView.isPagingEnabled = true
        self.scrollView.showsVerticalScrollIndicator = false
        self.scrollView.showsHorizontalScrollIndicator = false
        self.scrollView.delegate = self
        self.view.addSubview(scrollView)

        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.view.topAnchor, constant: self.height)
            ])
    }

    override public func viewDidLoad() {
        super.viewDidLoad()
        prepareImagesAndViews()
        configureGesture()
    }

    override public func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        scrollViewSize = scrollView.frame.size
        scrollView.contentSize = CGSize(width: scrollViewSize.width * 3, height: scrollViewSize.height)
        scrollView.contentOffset = CGPoint(x: scrollViewSize.width, y: 0)
        layoutImages()
    }

    private func configureGesture() {
        scrollView.gestureRecognizers?.forEach({ recognizer in
            if recognizer is UISwipeGestureRecognizer
                || recognizer is UIPanGestureRecognizer {
                view.addGestureRecognizer(recognizer)
            }
        })
    }
    
    private func updateSelection(selection: CalendarItem?) {
        guard let currentSelection = selection else { return }
        for page in pageViews {
            page.updateSelection(selected: currentSelection)
        }
    }
    
    private func onSelect(selection: CalendarItem) {
        self.selection = selection
    }
    
    private func prepareImagesAndViews() {
        (0..<3).forEach { index in
            let page = CalendarView()
            page.focusColor = self.focusColor
            page.textColor = self.textColor
            page.action = self.onSelect(selection:)
            page.amountOfItems = self.daysPerView
            page.setupDates(from: Calendar.current.date(byAdding: .day, value: (daysPerView+daysSkipped)*(index-1), to: currentDate)!)
            page.labelDelegate = labelDelegate
            pageViews[index] = page
        }
        layoutImages()
        currentDate = pageViews[1].startDate
        scrollView.contentOffset = CGPoint(x: scrollViewSize.width, y: 0)
    }

    private func layoutImages() {
        pageViews.enumerated().forEach { (index: Int, _) in
            scrollView.addSubview(pageViews[index])
            pageViews[index].frame = CGRect(x: scrollViewSize.width*CGFloat(index)-1, y: 0, width: scrollViewSize.width, height: scrollViewSize.height)
        }
    }
    
    private func moveLeft() {
        currentDate = pageViews[0].startDate
        pageViews[0].setupDates(from: Calendar.current.date(byAdding: .day, value: -daysPerView-daysSkipped, to: currentDate)!)
        pageViews[1].setupDates(from: currentDate)
        pageViews[2].setupDates(from: Calendar.current.date(byAdding: .day, value: daysPerView+daysSkipped, to: currentDate)!)
        
        scrollView.contentOffset.x += scrollViewSize.width
    }
    
    private func moveRight() {
        currentDate = pageViews[2].startDate
        pageViews[0].setupDates(from: Calendar.current.date(byAdding: .day, value: -daysPerView-daysSkipped, to: currentDate)!)
        pageViews[1].setupDates(from: currentDate)
        pageViews[2].setupDates(from: Calendar.current.date(byAdding: .day, value: daysPerView+daysSkipped, to: currentDate)!)
        
        scrollView.contentOffset.x -= scrollViewSize.width
    }
}

extension CalendarHeader: UIScrollViewDelegate {
    public func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        isDragging = true
    }

    public func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        isDragging = false
    }

    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if !self.isDragging { return }
        let offsetX = scrollView.contentOffset.x

        if offsetX > scrollView.frame.size.width*1.5 {
            self.isDragging = false
            DispatchQueue.main.async {
                self.moveRight()
            }
        }
        if offsetX < scrollView.frame.size.width*0.5 {
            self.isDragging = false
            DispatchQueue.main.async {
                self.moveLeft()
            }
        }
        self.updateSelection(selection: self.selection)
    }
}
