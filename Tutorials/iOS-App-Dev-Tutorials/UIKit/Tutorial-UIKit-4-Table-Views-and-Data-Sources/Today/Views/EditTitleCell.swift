//
//  EditTitleCell.swift
//  Today
//
//  Created by Kyungmin Lee on 2021/08/05.
//

import UIKit

class EditTitleCell: UITableViewCell {
    @IBOutlet var titleTextField: UITextField!
    
    func configure(title: String) {
        titleTextField.text = title
    }
}
