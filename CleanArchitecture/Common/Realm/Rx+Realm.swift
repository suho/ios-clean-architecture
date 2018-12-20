//
//  Rx+Realm.swift
//  CleanArchitecture
//
//  Created by Su Ho V. on 12/19/18.
//  Copyright © 2018 mlsuho. All rights reserved.
//

import Foundation
import Realm
import RealmSwift
import RxSwift

extension Reactive where Base: Realm {

    func save<S: Sequence>(_ objects: S, update: Bool = true) -> Observable<S> where S.Element: RealmRepresentable,
        S.Element.RealmType: Object {
        return Observable.create { observer in
            do {
                try self.base.write {
                    self.base.add(objects.map { $0.asRealm() }, update: update)
                }
                observer.onNext(objects)
                observer.onCompleted()
            } catch {
                observer.onError(error)
            }
            return Disposables.create()
        }
    }

    func save<R: RealmRepresentable>(_ object: R, update: Bool = true) -> Observable<R> where R.RealmType: Object {
        return Observable.create { observer in
            do {
                try self.base.write {
                    self.base.add(object.asRealm(), update: update)
                }
                observer.onNext(object)
                observer.onCompleted()
            } catch {
                observer.onError(error)
            }
            return Disposables.create()
        }
    }

    func delete<R: RealmRepresentable>(_ object: R) -> Observable<Void> where R.RealmType: Object {
        return Observable.create { observer in
            do {
                guard let object = self.base.object(ofType: R.RealmType.self, forPrimaryKey: object.uid) else { fatalError() }
                try self.base.write {
                    self.base.delete(object)
                }
                observer.onNext(())
                observer.onCompleted()
            } catch {
                observer.onError(error)
            }
            return Disposables.create()
        }
    }
}
