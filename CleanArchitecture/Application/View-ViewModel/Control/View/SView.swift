//
//  View.swift
//  CleanArchitecture
//
//  Created by Su Ho V. on 1/17/19.
//  Copyright © 2019 mlsuho. All rights reserved.
//

import UIKit

@IBDesignable
class SView: UIView {

    @IBInspectable var topLeft: Bool = false {
        didSet {
            if topLeft {
                rectCorner.insert(.topLeft)
            } else {
                rectCorner.remove(.topLeft)
            }
        }
    }

    @IBInspectable var topRight: Bool = false {
        didSet {
            if topRight {
                rectCorner.insert(.topRight)
            } else {
                rectCorner.remove(.topRight)
            }
        }
    }

    @IBInspectable var bottomLeft: Bool = false {
        didSet {
            if bottomLeft {
                rectCorner.insert(.bottomLeft)
            } else {
                rectCorner.remove(.bottomLeft)
            }
        }
    }

    @IBInspectable var bottomRight: Bool = false {
        didSet {
            if bottomRight {
                rectCorner.insert(.bottomRight)
            } else {
                rectCorner.remove(.bottomRight)
            }
        }
    }

    @IBInspectable var cornerRadius: CGFloat = 0
    @IBInspectable var borderColor: UIColor = .white
    @IBInspectable var fillColor: UIColor = .white
    @IBInspectable var isFill: Bool = false
    @IBInspectable var isShadow: Bool = true
    @IBInspectable var lineWidth: CGFloat = 0
    @IBInspectable var insetDx: CGFloat = 0
    @IBInspectable var insetDy: CGFloat = 0
    @IBInspectable var shadowOffset: CGSize = CGSize.zero
    @IBInspectable var shadowBlur: CGFloat = 10
    @IBInspectable var shadowColor: UIColor = .black

    private var rectCorner: UIRectCorner = [.allCorners]

    convenience init(cornerRadius: CGFloat, rectCorner: UIRectCorner) {
        self.init(frame: CGRect(origin: .zero, size: CGSize(width: 200, height: 200)))
        self.cornerRadius = cornerRadius
        self.rectCorner = rectCorner
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        drawBackground(rectangle: rect)
    }

    private func drawBackground(rectangle backgroundRectangle: CGRect) {
        let tileRectangle = backgroundRectangle.insetBy(dx: insetDx, dy: insetDy)
        let context = UIGraphicsGetCurrentContext()
        if let context = context {
            if cornerRadius < 0 {
                let minCorner = min(backgroundRectangle.size.width, backgroundRectangle.size.height)
                cornerRadius = minCorner / 2
            }
            context.beginTransparencyLayer(auxiliaryInfo: nil)
            let borderPath = UIBezierPath(roundedRect: tileRectangle,
                                          byRoundingCorners: rectCorner,
                                          cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
            if isShadow {
                context.setShadow(offset: shadowOffset, blur: shadowBlur, color: shadowColor.withAlphaComponent(0.8).cgColor)
            } else {
                let maskLayer = CAShapeLayer()
                maskLayer.path = borderPath.cgPath
                layer.mask = maskLayer
            }
            borderColor.set()
            borderPath.lineWidth = lineWidth
            borderPath.lineCapStyle = .square
            borderPath.stroke()
            if isFill {
                fillColor.setFill()
                borderPath.fill()
            }
            context.endTransparencyLayer()
        }
    }
}
