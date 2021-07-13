//
//  EditDateCell.swift
//  Today
//
//  Created by Kyungmin Lee on 2021/07/13.
//

import UIKit

class EditDateCell: UITableViewCell {
    @IBOutlet var datePicker: UIDatePicker!

    func configure(date: Date) {
        datePicker.date = date
    }
}
