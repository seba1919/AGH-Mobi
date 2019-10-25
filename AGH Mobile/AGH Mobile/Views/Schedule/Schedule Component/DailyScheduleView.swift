import Foundation
import UIKit

public class DailyScheduleView: UIScrollView {
    
    public var labelDelegate: ScheduleLabelDelegate? {
        didSet {
            schedule?.labelDelegate = labelDelegate
        }
    }
    public var keyColor: UIColor? {
        didSet {
            for item in schedule?.items ?? [] {
                item.keyColor = self.keyColor
            }
        }
    }
    public var textColor: UIColor? {
        didSet {
            for item in schedule?.items ?? [] {
                item.textColor = self.textColor
            }
        }
    }
    public var titleColor: UIColor? {
        didSet {
            self.title.textColor = titleColor
        }
    }
    public override var backgroundColor: UIColor? {
        didSet {
            for item in schedule?.items ?? [] {
                item.backgroundBoxColor = self.backgroundColor
            }
        }
    }
    public var actionDelegate: ScheduleTapDelegate? {
        didSet {
            schedule?.actionDelegate = actionDelegate
        }
    }
    
    lazy var header = UIView()
    lazy var title = UILabel()
    lazy var stackView = UIStackView()
    private var schedule: Schedule?
    private var emptyStateView: EmptyScheduleView?
    public var headerController = CalendarHeader()
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupTitle() {
        self.title.textColor = titleColor ?? .black
        self.title.textAlignment = .left
        self.title.font = UIFont.systemFont(ofSize: 30, weight: UIFont.Weight.heavy)
        self.title.adjustsFontSizeToFitWidth = true
        self.title.numberOfLines = 0
        self.title.minimumScaleFactor = 25/30
        self.addSubview(title)
        self.title.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            title.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            title.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
            title.trailingAnchor.constraint(equalTo: self.trailingAnchor)
            ])
    }
    
    private func setupStackView() {
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = 0
        stackView.distribution = .fill
        self.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: self.title.bottomAnchor, constant: 20),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),
            stackView.widthAnchor.constraint(equalTo: self.widthAnchor)
            ])
    }
    
    private func setupView() {
        self.setupTitle()
        self.setupStackView()
        self.setupScrollView()
    }
    
    public func setupContent(from subjects: [SubjectItem]) {
        removeAllContent()
        
        if subjects.isEmpty {
            setupEmptyState()
        } else {
            setupSubjects(from: subjects)
        }
    }
    
    private func removeAllContent() {
        emptyStateView?.removeFromSuperview()
        schedule?.items.forEach { item in
            item.removeFromSuperview()
        }
    }
    
    private func setupSubjects(from subjects: [SubjectItem]) {
        schedule = Schedule(of: subjects)
        schedule?.actionDelegate = actionDelegate
        schedule?.labelDelegate = labelDelegate
        schedule!.items.forEach { item in
            item.translatesAutoresizingMaskIntoConstraints = false
            item.backgroundBoxColor = backgroundColor
            item.keyColor = keyColor
            item.textColor = backgroundColor
            self.stackView.addArrangedSubview(item)
        }
    }
    
    private func setupEmptyState() {
        emptyStateView = EmptyScheduleView()
        emptyStateView?.labelDelegate = labelDelegate
        emptyStateView?.backgroundBoxColor = backgroundColor
        emptyStateView?.keyColor = keyColor
        self.addSubview(emptyStateView!)
        emptyStateView!.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            emptyStateView!.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            emptyStateView!.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            emptyStateView!.topAnchor.constraint(equalTo: self.stackView.topAnchor),
            emptyStateView!.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    public func setupScrollView() {
        self.showsVerticalScrollIndicator = false
        self.showsHorizontalScrollIndicator = false
    }
    
    public func setupTitle(to label: String) {
        self.title.text = label
    }
}
