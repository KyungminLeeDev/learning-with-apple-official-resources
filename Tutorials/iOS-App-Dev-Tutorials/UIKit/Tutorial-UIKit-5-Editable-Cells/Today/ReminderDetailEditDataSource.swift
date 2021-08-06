//
//  ReminderDetailEditDataSource.swift
//  Today
//
//  Created by Kyungmin Lee on 2021/08/06.
//

import UIKit

class ReminderDetailEditDataSource: NSObject {
    enum ReminderSection: Int, CaseIterable {
        case title
        case dueDate
        case notes
        
        var displayText: String {
            switch self {
            case .title:
                return "title"
            case .dueDate:
                return "Date"
            case .notes:
                return "Notes"
            }
        }
        
        var numRows: Int {
            switch self {
            case .title, .notes: return 1
            case .dueDate: return 2
            }
        }
        
        func cellIdentifier(for row: Int) -> String {
            switch self {
            case .title:
                return "EditTitleCell"
            case .dueDate:
                return row == 0 ? "EditDateLabelCell" : "EditDateCell"
            case .notes:
                return "EditNotesCell"
            }
        }
    }
    
    static var dateLabelCellIdentifier: String {
        return ReminderSection.dueDate.cellIdentifier(for: 0)
    }
    
    var reminder: Reminder
    
    init(reminder: Reminder) {
        self.reminder = reminder
    }
    
    private func dequeueAndConfigureCell(for indexPath: IndexPath, from tableView: UITableView) -> UITableViewCell {
        guard let section = ReminderSection(rawValue: indexPath.section) else {
            fatalError("Section index out of range")
        }
        let identifier = section.cellIdentifier(for: indexPath.row)
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        
        switch section {
        case .title:
            if let titleCell = cell as? EditTitleCell {
                titleCell.configure(title: reminder.title)
            }
        case .dueDate:
            if indexPath.row == 0 {
                cell.textLabel?.text = reminder.dueDate.description
            } else {
                if let dueDateCell = cell as? EditDateCell {
                    dueDateCell.configure(date: reminder.dueDate)
                }
            }
        case .notes:
            if let notesCell = cell as? EditNotesCell {
                notesCell.configure(notes: reminder.notes)
            }
        }
        return cell
    }
}

extension ReminderDetailEditDataSource: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return ReminderSection.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ReminderSection(rawValue: section)?.numRows ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return dequeueAndConfigureCell(for: indexPath, from: tableView)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let section = ReminderSection(rawValue: section) else {
            fatalError("Section index out of range")
        }
        return section.displayText
    }
}
