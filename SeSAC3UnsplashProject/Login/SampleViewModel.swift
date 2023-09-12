//
//  SampleViewModel.swift
//  SeSAC3UnsplashProject
//
//  Created by 서승우 on 2023/09/12.
//

import Foundation

class SampleViewModel {

    var userList = [
        User(name: "Hue", age: 23),
        User(name: "Jack", age: 21),
        User(name: "Bran", age: 20),
        User(name: "Kokojong", age: 20)
    ]

    var numberOfRowsInSection: Int {
        return userList.count
    }

    func cellForRowAt(at indexPath: IndexPath) -> User {
        return userList[indexPath.item]
    }

}
