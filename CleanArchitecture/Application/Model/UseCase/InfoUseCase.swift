//
//  InfoUseCase.swift
//  CleanArchitecture
//
//  Created by Su Ho V. on 12/20/18.
//  Copyright © 2018 mlsuho. All rights reserved.
//

import Foundation
import RxSwift

protocol InfoUseCase {
    func about() -> Observable<Info>
}
