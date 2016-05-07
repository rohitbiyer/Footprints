//
//  GradientView.swift
//  make-footprints-great-again
//
//  Created by Rohit B Iyer on 5/7/16.
//  Copyright © 2016 Rohit Bhaskar. All rights reserved.
//

import UIKit

class GradientView: UIView {
    
    override func awakeFromNib() {
        
        let background = CAGradientLayer().orangeColor()
        background.frame = layer.bounds
        layer.insertSublayer(background, atIndex: 0)

        
    }

}
