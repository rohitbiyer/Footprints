//
//  LoginTextField.swift
//  make-footprints-great-again
//
//  Created by Rohit B Iyer on 5/6/16.
//  Copyright © 2016 Rohit Bhaskar. All rights reserved.
//

import UIKit

class LoginTextField: UITextField {
    
    override func awakeFromNib() {
        layer.cornerRadius = 2.0       
        
    }
    
        //for placeholder we need to override the below function
        override func textRectForBounds(bounds: CGRect) -> CGRect {
            return CGRectInset(bounds, 10, 0)
        }
    
        //for editable text
        override func editingRectForBounds(bounds: CGRect) -> CGRect {
            return CGRectInset(bounds, 10, 0)
    }


   
}
