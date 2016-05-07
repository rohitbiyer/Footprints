//
//  dismissKeyboard.swift
//  make-footprints-great-again
//
//  Created by Rohit B Iyer on 5/7/16.
//  Copyright © 2016 Rohit Bhaskar. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
}