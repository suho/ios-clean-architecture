//
//  Network.swift
//  CleanArchitecture
//
//  Created by Su Ho V. on 12/16/18.
//  Copyright © 2018 mlsuho. All rights reserved.
//

import Foundation
import RxAlamofire
import Alamofire
import RxSwift

protocol NetworkRouter: class {
    associatedtype Target: TargetType
    func request(_ target: Target) -> Observable<Data>
}

final class Router<Target: TargetType>: NetworkRouter {

    private let scheduler: ConcurrentDispatchQueueScheduler

    init() {
        let qos = DispatchQoS(qosClass: DispatchQoS.QoSClass.background,
                              relativePriority: 1)
        self.scheduler = ConcurrentDispatchQueueScheduler(qos: qos)
    }

    func request(_ target: Target) -> Observable<Data> {
        guard let manager = NetworkReachabilityManager(), manager.isReachable else {
            return Observable.error(NetworkError.offline)
        }
        let url = target.baseURL + target.path
        switch target.task {
        case .requestPlain:
            return RxAlamofire
                .request(target.method, url, headers: target.headers)
                .observeOn(scheduler)
                .data()
        case .requestParameters(let parameters, let encoding):
            return RxAlamofire
                .request(target.method, url, parameters: parameters, encoding: encoding, headers: target.headers)
                .observeOn(scheduler)
                .data()
        }
    }
}
