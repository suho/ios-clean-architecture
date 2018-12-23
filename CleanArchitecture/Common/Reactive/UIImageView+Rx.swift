//
//  UIImageView.swift
//  CleanArchitecture
//
//  Created by Su Ho V. on 12/19/18.
//  Copyright © 2018 mlsuho. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import Kingfisher

extension Reactive where Base: UIImageView {

    /// Bindable sink for `url` property.
    public var url: Binder<URL?> {
        return Binder(base) { imageView, url in
            imageView.kf.setImage(with: url)
        }
    }
}
