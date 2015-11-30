//
//  GameViewDelegate.swift
//  ELColorGame
//
//  Created by Dariusz Rybicki on 30/11/15.
//  Copyright © 2015 EL Passion. All rights reserved.
//

import Foundation

protocol GameViewDelegate: class {
    
    func gameViewDidTapPause(gameView: GameView)
    func gameViewDidTapRestart(gameView: GameView)
    
}
