//
//  Extensions + Math.swift
//  ZombieConga
//
//  Created by Andrew Chersky on 1/24/17.
//  Copyright © 2017 com. All rights reserved.
//

import Foundation
import CoreGraphics

func + (left: CGPoint, right: CGPoint) -> CGPoint { return CGPoint(x: left.x + right.x, y: left.y + right.y) }
func - (left: CGPoint, right: CGPoint) -> CGPoint { return CGPoint(x: left.x - right.x, y: left.y - right.y) }
func * (left: CGPoint, right: CGPoint) -> CGPoint { return CGPoint(x: left.x * right.x, y: left.y * right.y) }
func / (left: CGPoint, right: CGPoint) -> CGPoint { return CGPoint(x: left.x / right.x, y: left.y / right.y) }

func * (point: CGPoint, scalar: CGFloat) -> CGPoint { return CGPoint(x: point.x * scalar, y: point.y * scalar) }
func / (point: CGPoint, scalar: CGFloat) -> CGPoint { return CGPoint(x: point.x / scalar, y: point.y / scalar) }

func /= (point: inout CGPoint, scalar: CGFloat) { point = point / scalar }
func *= (point: inout CGPoint, scalar: CGFloat) { point = point * scalar }

func += (left: inout CGPoint, right: CGPoint) { left = left + right }
func -= (left: inout CGPoint, right: CGPoint) { left = left - right }
func *= (left: inout CGPoint, right: CGPoint) { left = left * right }
func /= (left: inout CGPoint, right: CGPoint) { left = left / right }

func shortestAngleBetween(currentAngle: CGFloat, destinationAngle: CGFloat) -> CGFloat {
    let pi = CGFloat.pi
    let twoPi = CGFloat.pi * 2
    var angle = (destinationAngle - currentAngle).truncatingRemainder(dividingBy: twoPi)
    if angle >= pi { angle = angle - twoPi }
    if angle <= -pi { angle = angle + twoPi }
    return angle
}

extension CGFloat { func sign() -> CGFloat { return self >= 0.0 ? 1.0 : -1.0 } }
