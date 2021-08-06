//
//  ReminderListDataSource.swift
//  Today
//
//  Created by Kyungmin Lee on 2021/08/05.
//

import UIKit

class ReminderListDataSource: NSObject {
    private lazy var dateFormatter = RelativeDateTimeFormatter()
}

extension ReminderListDataSource: UITableViewDataSource {
    static let reminderListCellIdentifier = "ReminderListCell"
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Reminder.testData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Self.reminderListCellIdentifier, for: indexPath) as? ReminderListCell else {
            fatalError("Unable to dequeue ReminderCell")
        }
        let reminder = Reminder.testData[indexPath.row]
        let dateText = dateFormatter.localizedString(for: reminder.dueDate, relativeTo: Date())
        cell.configure(title: reminder.title, dateText: dateText, isDone: reminder.isComplete) {
            Reminder.testData[indexPath.row].isComplete.toggle()
            tableView.reloadRows(at: [indexPath], with: .none)
        }
        return cell
    }
}
