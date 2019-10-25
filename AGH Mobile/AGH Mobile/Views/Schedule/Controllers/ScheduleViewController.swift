//
//  ScheduleViewController.swift
//  AGH Mobile
//
//  Created by Bartłomiej Pluta on 07/10/2019.
//  Copyright © 2019 AGH University of Science and Technology. All rights reserved.
//

import UIKit

class ScheduleViewController: UIViewController {
    // MARK: - Private properties
    private var scheduleView: ScheduleView { return self.view as! ScheduleView }
    
    // MARK: - Lifecycle
    override func loadView() {
        self.view = ScheduleView(frame: UIScreen.main.bounds)
        scheduleView.actionDelegate = self
        scheduleView.dataSourceDelegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.scheduleView.setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.setupNavigationAttributs()
    }
    // MARK: - Mock data
    let subjects = [
    SubjectItem(
        id: 1,
        name: "Lorem Ipsum 1",
        classType: "Ćwicz. lab",
        location: "C-2 315",
        startDate: "2019-05-12T08:00:00+02:00",
        endDate: "2019-05-12T09:30:00+02:00"
    ),
    SubjectItem(
        id: 2,
        name: "Lorem Ipsum 2",
        classType: "Ćwicz. lab",
        location: "C-2 315",
        startDate: "2019-05-12T09:30:00+02:00",
        endDate: "2019-05-12T15:00:00+02:00"
    ),
    SubjectItem(
        id: 3,
        name: "Lorem Ipsum 3",
        classType: "Ćwicz. lab",
        location: "C-2 315",
        startDate: "2019-05-12T10:00:00+02:00",
        endDate: "2019-05-12T14:00:00+02:00"
    ),
    SubjectItem(
        id: 4,
        name: "Lorem Ipsum 3a",
        classType: "Ćwicz. lab",
        location: "C-2 315",
        startDate: "2019-05-12T11:10:00+02:00",
        endDate: "2019-05-12T12:00:00+02:00"
    ),
    SubjectItem(
        id: 5,
        name: "Lorem Ipsum 3b",
        classType: "Ćwicz. lab",
        location: "C-2 315",
        startDate: "2019-05-12T12:30:00+02:00",
        endDate: "2019-05-12T13:30:00+02:00"
    ),
    SubjectItem(
        id: 6,
        name: "Lorem Ipsum 4",
        classType: "Ćwicz. lab",
        location: "C-2 315",
        startDate: "2019-05-12T16:10:00+02:00",
        endDate: "2019-05-12T17:30:00+02:00"
    ),
    SubjectItem(
        id: 7,
        name: "Lorem Ipsum 5",
        classType: "Ćwicz. lab",
        location: "C-2 315",
        startDate: "2019-05-12T18:15:00+02:00",
        endDate: "2019-05-12T19:45:00+02:00"
    )]
}

extension ScheduleViewController {
        
    // MARK: - Setup
    private func setupNavigationAttributs() {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
}

// MARK: - Data updating
extension ScheduleViewController: ScheduleDataSourceDelegate {
    func scheduleData(for date: Date) -> [SubjectItem] {
        if date.withoutTime == Date.today.withoutTime {
            return subjects
        }
        return []
    }
    
    func scheduleData(since date: Date) -> [[SubjectItem]] {
        return []
    }
}

// MARK: - Actions
extension ScheduleViewController: ScheduleActionDelegate {
    
    func setupOnTapAction(to view: UIView) {
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.onTap)))
    }
    
    func setupPeekAndPopAction(to view: UIView) {
        if #available(iOS 13.0, *) {
            view.addInteraction(UIContextMenuInteraction(delegate: self))
        } else {
            if traitCollection.forceTouchCapability == .available {
                self.registerForPreviewing(with: self, sourceView: view)
            }
        }
    }
    
    @objc func onTap(sender: UITapGestureRecognizer) {
        guard let id = (sender.view as? Box)?.identifier else { return }
    }
    
    func onSegmentedControlChange(_ sender: UISegmentedControl) {
        
    }
    
    func onDateSelect(_ date: Date?) {
        guard let date = date else { return }
        scheduleView.currentDate = date
    }
    
    func getSubjectPageViewController(id: Int) -> UIViewController {
        let someViewController = UIViewController()
        someViewController.view.backgroundColor = #colorLiteral(red: 0.4276, green: 0.4, blue: 0.4078, alpha: 1)
        return someViewController
    }
}

@available(iOS 13, *)
extension ScheduleViewController: UIContextMenuInteractionDelegate {
    func contextMenuInteraction(_ interaction: UIContextMenuInteraction, configurationForMenuAtLocation location: CGPoint) -> UIContextMenuConfiguration? {
        return UIContextMenuConfiguration(identifier: nil, previewProvider: { [weak self] in
            self?.onPeek(sender: interaction)
        }, actionProvider: nil)
    }
    
    private func onPeek(sender: UIContextMenuInteraction) -> UIViewController? {
        guard let id = (sender.view as? Box)?.identifier else { return nil }
        return getSubjectPageViewController(id: id)
    }
}

extension ScheduleViewController: UIViewControllerPreviewingDelegate {
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        return onPeek(sender: previewingContext)
    }
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
        self.navigationController?.show(viewControllerToCommit, sender: nil)
    }
    
    private func onPeek(sender: UIViewControllerPreviewing) -> UIViewController? {
        if #available(iOS 13, *) { return nil } else {
            guard let id = (sender.sourceView as? Box)?.identifier else { return nil }
            return getSubjectPageViewController(id: id)
        }
    }
}
