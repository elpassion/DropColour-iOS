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

    func circleViewDidMove(view: CircleView, from: CGPoint, to: CGPoint)
    
}

class CircleView: SpringView {
    
    let type: CircleType
    var delegate:CircleViewDelegate? = nil
    var lastLocation = CGPointZero
    var colorsArray = [UIColor]()
    
    init(type: CircleType) {
        self.type = type
        super.init(frame: CGRectZero)
        clipsToBounds = true
        backgroundColor = UIColor.clearColor()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = bounds.width / 2
        gradientLayer = createGradientLayer([self.type.topColor, self.type.bottomColor])
    }
    
    // MARK: Touch handling
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        lastLocation = center
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        guard let location = touches.first?.locationInView(superview!) else { return }
        center = location
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        delegate?.circleViewDidMove(self, from: lastLocation, to: center)
    }
    
    // MARK: Gradient backgorund
    
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
