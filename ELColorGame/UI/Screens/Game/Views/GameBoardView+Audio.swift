import Foundation
import AVFoundation

extension GameBoardView {

    func playSound() {
        if let soundURL = Bundle.main.url(forResource: "bubble_pop_sound", withExtension: "m4a") {
            var mySound: SystemSoundID = 0
            AudioServicesCreateSystemSoundID(soundURL as CFURL, &mySound)
            AudioServicesPlaySystemSound(mySound)
        }
    }

}
