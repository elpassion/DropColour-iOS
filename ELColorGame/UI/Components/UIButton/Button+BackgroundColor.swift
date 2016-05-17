//
//  Created by Mateusz Szklarek on 19/04/16.
//  Copyright © 2016 EL Passion. All rights reserved.
//

import UIKit

extension Button {

    func setBackgroundColor(backgroundColor: UIColor, forUIControlState state: UIControlState) {
        self.setBackgroundImage(imageFromColor(backgroundColor), forState: state)
    }

    private func imageFromColor(color: UIColor) -> UIImage {
        let rect = CGRectMake(0.0, 0.0, 1.0, 1.0)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        CGContextSetFillColorWithColor(context, color.CGColor)
        CGContextFillRect(context, rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }

}
