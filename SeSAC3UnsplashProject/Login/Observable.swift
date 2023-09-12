//
//  Observable.swift
//  SeSAC3UnsplashProject
//
//  Created by 서승우 on 2023/09/12.
//

import Foundation

// didSet -> 단방향
class Observable<T> {

    private var listener: ((T) -> ())?

    var value: T {
        didSet {
            listener?(value)
        }
    }

    init(_ value: T) {
        self.value = value
    }

    func bind(_ closure: @escaping (T) -> ()) {
        closure(value)
        listener = closure
    }

}
