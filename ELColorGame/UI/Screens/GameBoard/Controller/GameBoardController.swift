//
//  GameBoardController.swift
//  ELColorGame
//
//  Created by Dariusz Rybicki on 27/11/15.
//  Copyright © 2015 EL Passion. All rights reserved.
//

import Foundation
import CoreGraphics

class GameBoardController: NSObject, CircleViewDelegate {
    
    let view: GameBoardView
    var myTimer: NSTimer?
    
    init(view: GameBoardView) {
        self.view = view
        super.init()
    }
    
    var isInserting: Bool {
        return myTimer != nil
    }
    
    func startInserting() {
        guard myTimer == nil else { return }
        myTimer = NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: "timerTick:", userInfo: nil, repeats: true)
    }
    
    func stopInserting() {
        guard let timer = myTimer else { return }
        timer.invalidate()
        myTimer = nil
    }
    
    func restartGame() {
        stopInserting()
        view.enumerateSlotViewsUsingBlock { (slotView, x, y) -> Void in
            slotView.circleView = nil
        }
        startInserting()
    }
    
    func timerTick(timer: NSTimer) {
        insertCircle()
    }
    
    private func insertCircle() {
        guard let slot = view.allSlotViews.emptySlotViews.randomSlotView else { return }
        let circleView = CircleView(type: CircleTypes.randomType!)
        circleView.delegate = self
        slot.circleView = circleView
    }
    
    // MARK: CircleViewDelegate
    
    func circleViewDidMove(view: CircleView, from: CGPoint, to: CGPoint) {
        print("did move from \(from) to \(to)")
    }
    
}
