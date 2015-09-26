//
//  CircleView.swift
//  ELColorGame
//
//  Created by Mateusz Szklarek on 24/09/15.
//  Copyright © 2015 EL Passion. All rights reserved.
//

import UIKit
import Spring

protocol CircleViewPointDidChangedDelegate {
    func pointDidChanged(initialPoint:CGPoint, view:CircleView)
}

class CircleView: SpringView {
    
    var delegate:CircleViewPointDidChangedDelegate? = nil
    var lastLocation:CGPoint = CGPointMake(0, 0)
    var colorsArray:[UIColor] = []
    var initialPosition:CGPoint = CGPoint()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let touchRecognizer = UIPanGestureRecognizer(target: self, action: "detectTouch:")
        self.gestureRecognizers = [touchRecognizer]
        colorsArray = [
            UIColor(red:0.31, green:0.84, blue:0.84, alpha:1),
            UIColor(red:0.34, green:0.85, blue:0.09, alpha:1),
            UIColor(red:0.69, green:0.43, blue:0.84, alpha:1),
            UIColor(red:0.91, green:0.14, blue:0.37, alpha:1),
            UIColor(red:0.29, green:0.56, blue:0.89, alpha:1),
        ]
        self.backgroundColor = colorsArray[Int(arc4random() % 4)]
        addGradientForView(self)
        initialPosition = self.center
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func detectTouch(recognizer:UIPanGestureRecognizer) {
        let translation = recognizer.translationInView(self.superview)
        self.center = CGPointMake(lastLocation.x + translation.x, lastLocation.y + translation.y)
        if recognizer.state == .Began {
        } else if recognizer.state == .Changed {
        } else if recognizer.state == .Ended {
            delegate?.pointDidChanged(initialPosition, view: self)
            print("ended")
        }
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.superview?.bringSubviewToFront(self)
        lastLocation = self.center
    }
    
    func addGradientForView(view: UIView) {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = [CGColorCreateCopyWithAlpha(UIColor.whiteColor().CGColor, 0.15)!, CGColorCreateCopyWithAlpha(UIColor.blackColor().CGColor, 0.15)!]
        self.layer.insertSublayer(gradient, atIndex: 0)
        self.layer.cornerRadius = 20
        self.clipsToBounds = true
    }
}
