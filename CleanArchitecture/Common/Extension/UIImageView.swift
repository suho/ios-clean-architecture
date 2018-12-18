//
//  UIImageView.swift
//  CleanArchitecture
//
//  Created by Su Ho V. on 12/18/18.
//  Copyright © 2018 mlsuho. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Kingfisher

extension UIImageView {
    func addMoveMotion() {
        let min = CGFloat(-15)
        let max = CGFloat(15)

        let xMotion = UIInterpolatingMotionEffect(keyPath: "center.x",
                                                  type: .tiltAlongHorizontalAxis)
        xMotion.minimumRelativeValue = min
        xMotion.maximumRelativeValue = max

        let yMotion = UIInterpolatingMotionEffect(keyPath: "center.y",
                                                  type: .tiltAlongVerticalAxis)
        yMotion.minimumRelativeValue = min
        yMotion.maximumRelativeValue = max

        let effectGroup = UIMotionEffectGroup()
        effectGroup.motionEffects = [xMotion, yMotion]

        addMotionEffect(effectGroup)
    }
}

// MARK: - RxSwift
extension Reactive where Base: UIImageView {

    /// Bindable sink for `url` property.
    public var url: Binder<URL?> {
        return Binder(base) { imageView, url in
            imageView.kf.setImage(with: url)
        }
    }
}
