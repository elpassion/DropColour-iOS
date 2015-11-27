//
//  CircleView.swift
//  ELColorGame
//
//  Created by Mateusz Szklarek on 24/09/15.
//  Copyright © 2015 EL Passion. All rights reserved.
//

import UIKit
import Spring

protocol CircleViewDelegate {
    func circleDidTouched(view: CircleView)
    func pointDidChanging(view: CircleView)
    func pointDidChanged(initialPoint:CGPoint, view:CircleView)
}

class CircleView: SpringView {
    
    let type: CircleType
    var delegate:CircleViewDelegate? = nil
    var lastLocation = CGPointZero
    var colorsArray = [UIColor]()
    var initialPosition = CGPointZero
    
    init(type: CircleType) {
        self.type = type
        super.init(frame: CGRectZero)
        clipsToBounds = true
        backgroundColor = UIColor.clearColor()
        addGestureRecognizer(UIPanGestureRecognizer(target: self, action: "detectTouch:"))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = bounds.width / 2
        gradientLayer = createGradientLayer([self.type.topColor, self.type.bottomColor])
    }
    
    func detectTouch(recognizer:UIPanGestureRecognizer) {
        let translation = recognizer.translationInView(self.superview)
        self.center = CGPointMake(lastLocation.x + translation.x, lastLocation.y + translation.y)
        if recognizer.state == .Began {
            delegate?.circleDidTouched(self)
        } else if recognizer.state == .Changed {
            delegate?.pointDidChanging(self)
            self.superview?.bringSubviewToFront(self)
        } else if recognizer.state == .Ended {
            delegate?.pointDidChanged(initialPosition, view: self)
            print("ended")
        }
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        lastLocation = self.center
    }
    
    var gradientLayer: CAGradientLayer? {
        didSet {
            if let oldValue = oldValue {
                oldValue.removeFromSuperlayer()
            }
            if let newValue = gradientLayer {
                layer.insertSublayer(newValue, atIndex: 0)
            }
        }
    }
    
    func createGradientLayer(colors: [UIColor]) -> CAGradientLayer {
        let layer = CAGradientLayer()
        layer.frame = bounds
        layer.colors = colors.map { $0.CGColor }
        return layer
    }
}
