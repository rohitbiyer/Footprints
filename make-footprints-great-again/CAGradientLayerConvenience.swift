//
//  CAGradientLayerConvenience.swift
//  make-footprints-great-again
//
//  Created by Rohit B Iyer on 5/6/16.
//  Copyright © 2016 Rohit Bhaskar. All rights reserved.
//

import Foundation
import UIKit

extension CAGradientLayer{
    
    func orangeColor() -> CAGradientLayer {
        let topColor = UIColor(red: 244/255.0, green: 81/255.0, blue: 30/255.0, alpha: 1)
        let bottomCollor = UIColor(red: 255/255.0, green: 171/255.0, blue: 145/255.0, alpha: 1)
        
        let gradientColors: [CGColor] = [topColor.CGColor, bottomCollor.CGColor]
        let gradientLocations: [Float] = [0.0,1.0]
        
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        gradientLayer.colors = gradientColors
        gradientLayer.locations = gradientLocations
        
        return gradientLayer
        
    }
}