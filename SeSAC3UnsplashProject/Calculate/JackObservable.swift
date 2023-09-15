//
//  JackObservable.swift
//  SeSAC3UnsplashProject
//
//  Created by 서승우 on 2023/09/13.
//

import Foundation

class CustomObservable<T> {

    var listener: ((T) -> ())?

    var value: T {
        didSet {
            listener?(value)
            print("사용자의 이름이 \(value)로 변경되었다.")
        }
    }

    init(_ value: T) {
        self.value = value
    }

    func bind(_ sample: @escaping (T) -> ()) {
        print("저는 \(value)입니다.")
        sample(value)
        listener = sample
    }

}
