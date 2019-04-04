//
//  View.swift
//  CleanArchitecture
//
//  Created by Su Ho V. on 1/16/19.
//  Copyright © 2019 mlsuho. All rights reserved.
//

import UIKit

protocol View {
    associatedtype ViewModelType: ViewModel
    var viewModel: ViewModelType! { get set }
}
