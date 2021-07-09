//
//  DetailViewController.swift
//  Today
//
//  Created by Kyungmin Lee on 2021/07/10.
//

import UIKit

class ReminderDetailViewController: UITableViewController {
    
    var reminder: Reminder?
    
    func configure(with reminder: Reminder) {
        self.reminder = reminder
    }
}
