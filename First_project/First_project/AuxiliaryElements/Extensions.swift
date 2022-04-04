//
//  Extensions.swift
//  First_project
//
//  Created by Taras Kyparenko on 21.03.2022.
//

import Foundation
import UIKit

extension UITextField {
        func setLeftPaddingPoints() {
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: self.frame.size.height))
            self.leftView = paddingView
            self.leftViewMode = .always
        }
        func setRightPaddingPoints() {
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: self.frame.size.height))
            self.rightView = paddingView
            self.rightViewMode = .always
        }
    }

