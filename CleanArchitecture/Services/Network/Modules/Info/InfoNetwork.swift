//
//  InfoNetwork.swift
//  CleanArchitecture
//
//  Created by Su Ho V. on 4/6/19.
//  Copyright © 2019 mlsuho. All rights reserved.
//

import Foundation
import RxSwift

final class InfoNetwork: InfoUseCase {

    private let router: Router<InfoTarget>

    init(router: Router<InfoTarget>) {
        self.router = router
    }

    func about() -> Observable<Info> {
        return router.request(.about).map(Info.self)
    }
}
