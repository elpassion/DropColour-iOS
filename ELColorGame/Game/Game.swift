//
//  Created by Dariusz Rybicki on 27/11/15.
//  Copyright © 2015 EL Passion. All rights reserved.
//

import Foundation

class Game {
    
    private let board: Board
    
    init(boardSize: BoardSize) {
        self.board = Board(size: boardSize)
        self.board.delegate = self
    }
    
    deinit {
        stopInsertingCircles()
    }
    
    // MARK: Inserting Circles
    
    private var insertingTimer: Timer?
    
    var isInsertingCircles: Bool {
        return insertingTimer != nil
    }
    
    func startInsertingCircles(interval interval: NSTimeInterval) {
        if let _ = insertingTimer {
            stopInsertingCircles()
        }
        insertingTimer = Timer(interval: interval) { [weak self] in
            self?.insertRandomCircle()
        }
    }
    
    func stopInsertingCircles() {
        guard let timer = insertingTimer else { return }
        timer.invalidate()
        insertingTimer = nil
    }
    
    private func insertRandomCircle() {
        guard let randomEmptySlot = board.emptySlots.random else { return }
        guard let randomCircleType = CircleType.allTypes.random else { return }
        randomEmptySlot.circle = Circle(type: randomCircleType)
    }
    
    // MARK: Removing Circles
    
    func removeAllCircles() {
        for slot in board.nonEmptySlots {
            slot.circle = nil
        }
    }
    
}
