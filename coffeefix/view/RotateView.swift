//
//  RotateView.swift
//  coffeefix
//
//  Created by Kasey Schlaudt on 8/31/19.
//  Copyright © 2019 Kasey Schlaudt. All rights reserved.
//

import UIKit

class RotateView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    func setupView() {
        rotate(degrees: CGFloat(integerLiteral: -90))
    }
    
    func rotate(degrees: CGFloat) {
        rotate(radians: CGFloat.pi * degrees / 180.0)
    }
    
    func rotate(radians: CGFloat) {
        self.transform = CGAffineTransform(rotationAngle: radians)
    }
}
