//
//  GameBoardSlotView.swift
//  ELColorGame
//
//  Created by Dariusz Rybicki on 12/10/15.
//  Copyright © 2015 EL Passion. All rights reserved.
//

import UIKit

class GameBoardSlotView: UIView {
    
    init() {
        super.init(frame: CGRectZero)
        loadSubviews()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: UIView
    
    override func layoutSubviews() {
        backgroundView.frame = bounds
        backgroundView.layer.cornerRadius = CGFloat(backgroundView.frame.width / 2)
    }
    
    // MARK: Subviews

    private func loadSubviews() {
        addSubview(backgroundView)
    }
    
    private let backgroundView: UIView = {
        let view = UIView(frame: CGRectZero)
        view.backgroundColor = UIColor(red:0.24, green:0.23, blue:0.37, alpha:1)
        return view
    }()
    
}