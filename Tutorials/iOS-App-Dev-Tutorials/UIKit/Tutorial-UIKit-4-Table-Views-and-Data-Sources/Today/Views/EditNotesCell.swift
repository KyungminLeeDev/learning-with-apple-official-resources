//
//  EditNotesCell.swift
//  Today
//
//  Created by Kyungmin Lee on 2021/08/05.
//

import UIKit

class EditNotesCell: UITableViewCell {
    @IBOutlet var notesTextView: UITextView!
    
    func configure(notes: String?) {
        notesTextView.text = notes
    }
}
