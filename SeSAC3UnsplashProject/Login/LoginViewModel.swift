//
//  LoginViewModel.swift
//  SeSAC3UnsplashProject
//
//  Created by 서승우 on 2023/09/12.
//

import Foundation

class LoginViewModel {

    var id = Observable("")
    var pw = Observable("")
    var isValid = Observable(false)

    func checkValidation() {
        if id.value.count >= 6 && pw.value.count >= 4 {
            isValid.value = true
        } else {
            isValid.value = false
        }
    }

    func signIn(completion: () -> ()) {
        // 서버, 닉네임, id
        UserDefaults.standard.set(id.value, forKey: "id")
        completion()
    }

}
