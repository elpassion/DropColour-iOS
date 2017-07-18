//
//  Created by Dariusz Rybicki on 30/11/15.
//  Copyright © 2015 EL Passion. All rights reserved.
//

import Foundation

protocol GameViewDelegate: class {

    func gameViewDidTapPause(_ gameView: GameView)
    func gameViewDidTapRestart(_ gameView: GameView)
    func gameViewCanMoveCircle(fromLocation: SlotLocation, toLocation: SlotLocation) -> Bool
    func gameViewMoveCircle(fromLocation: SlotLocation, toLocation: SlotLocation)

}
