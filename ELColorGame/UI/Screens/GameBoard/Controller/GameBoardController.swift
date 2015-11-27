//
//  GameBoardController.swift
//  ELColorGame
//
//  Created by Dariusz Rybicki on 27/11/15.
//  Copyright © 2015 EL Passion. All rights reserved.
//

import Foundation

class GameBoardController: NSObject {
    
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
    
    func timerTick(timer: NSTimer) {
        insertCircle()
    }
    
    private func insertCircle() {
        guard let slot = view.allSlotViews.emptySlotViews.randomSlotView else { return }
        slot.circleView = CircleView()
    }
    
}
