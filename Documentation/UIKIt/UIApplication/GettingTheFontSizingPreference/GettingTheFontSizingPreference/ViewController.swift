//
//  ViewController.swift
//  GettingTheFontSizingPreference
//
//  Created by Kyungmin Lee on 2021/09/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var fontSizeLabel: UILabel!
    @IBOutlet weak var accessiblityLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 현재 텍스트 크기 설정 표시
        fontSizeLabel.text = UIApplication.shared.preferredContentSizeCategory.rawValue
        accessiblityLabel.text = "isAccessibilityCategory? \(UIApplication.shared.preferredContentSizeCategory.isAccessibilityCategory)"
        
        
        // 텍스트 크기 설정 변경을 알려주는 노티피케이션 등록
        NotificationCenter.default.addObserver(forName: UIContentSizeCategory.didChangeNotification, object: nil, queue: .main) { (notification) in
            guard let preferredContentSizeCategory = notification.userInfo?[UIContentSizeCategory.newValueUserInfoKey] as? UIContentSizeCategory else {
                return
            }
            self.fontSizeLabel.text = preferredContentSizeCategory.rawValue
            self.accessiblityLabel.text = "isAccessibilityCategory? \(preferredContentSizeCategory.isAccessibilityCategory)"
        }
    }
    
    deinit {
        // 노티피케이션 제거
        NotificationCenter.default.removeObserver(self, name: UIContentSizeCategory.didChangeNotification, object: nil)
    }

}
