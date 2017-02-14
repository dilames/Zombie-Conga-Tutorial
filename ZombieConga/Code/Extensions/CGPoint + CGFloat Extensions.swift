//
//  CGPoint + Extensions.swift
//  ZombieConga
//
//  Created by Andrew Chersky on 1/24/17.
//  Copyright © 2017 com. All rights reserved.
//

import Foundation
import CoreGraphics

#if !(arch(x86_64) || arch(arm64))
    func atan2(y: CGFloat, x: CGFloat) -> CGFloat { return CGFloat(atan2f(Float(y), Float(x))) }
    func sqrt(a: CGFloat) -> CGFloat { return CGFloat(sqrtf(Float(a))) }
#endif
// On 32-bit architecture CGFloat is the same size as Float, so this code makes versions of atan2 and sqrt that accept CGFloat/Float values rather than the default of Double, allowing you to use atan2 and sqrt with CGFloats, regardless of the device’s architectur

extension CGPoint {
    var angle:      CGFloat { return atan2(y, x) }
    var length:     CGFloat { return sqrt(x * x + y * y) }
    var normalized: CGPoint { return self / length }
}

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(Float(arc4random()) / Float(UInt32.max))
    }
    static func random(min: CGFloat, max: CGFloat) -> CGFloat {
        assert(min < max)
        return CGFloat.random() * (max - min) + min
    }
}
