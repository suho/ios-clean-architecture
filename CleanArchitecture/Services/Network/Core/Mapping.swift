//
//  Mapping.swift
//  CleanArchitecture
//
//  Created by Su Ho V. on 12/17/18.
//  Copyright © 2018 mlsuho. All rights reserved.
//

import Foundation
import RxSwift

// MARK: - Mapping from data
extension Observable where E == Data {
    func map<T>(_ type: T.Type, atKeyPath keyPath: String? = nil) -> Observable<T> where T: Decodable {
        if let keyPath = keyPath {
            return map { (data) -> T in
                guard let value = try? JSONSerialization.jsonObject(with: data, options: []),
                    let json = value as? [String: Any] else { throw APIError.json }
                guard let dataJSON = json.value(of: keyPath) else { throw APIError.json }
                let dataFromJSON = try JSONSerialization.data(withJSONObject: dataJSON, options: [])
                return try JSONDecoder.shared.decode(T.self, from: dataFromJSON)
            }
        } else {
            return map { data -> T in
                return try JSONDecoder.shared.decode(T.self, from: data)
            }
        }
    }
}
