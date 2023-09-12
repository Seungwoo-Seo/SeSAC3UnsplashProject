//
//  LoginViewController.swift
//  SeSAC3UnsplashProject
//
//  Created by 서승우 on 2023/09/12.
//

import UIKit

final class LoginViewController: UIViewController {
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!

    @IBOutlet weak var resultLabel: UILabel!

    let viewModel = LoginViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        loginButton.addTarget(
            self,
            action: #selector(didTapLoginButton),
            for: .touchUpInside
        )
        idTextField.addTarget(
            self,
            action: #selector(didEditChangedIdTextField),
            for: .editingChanged
        )
        pwTextField.addTarget(
            self,
            action: #selector(didEditChangedPwTextField),
            for: .editingChanged
        )

        viewModel.id.bind { text in
            self.resultLabel.text = text
        }

        viewModel.pw.bind { text in
            self.pwTextField.text = text
        }

        viewModel.isValid.bind { bool in
            self.loginButton.isEnabled = bool
            self.loginButton.backgroundColor = bool ? .green : .lightGray
        }

//        var number1 = 10
//        var number2 = 3
//
//        print(number1 - number2)
//
//        number1 = 3
//        number2 = 1
//
//        var number3 = Observable(10)
//        var number4 = Observable(3)
//
//        number3.bind { number in
//            print("Observable", number3.value - number4.value)
//        }
//
//        number3.value = 100
//        number3.value = 500
//        number3.value = 50

//        let sample = Observable(value: 98)
//        sample.bind { nickname in
//            let alert = UIAlertController(title: "안녕", message: nil, preferredStyle: .alert)
//            let confirm = UIAlertAction(title: "확인", style: .default)
//            alert.addAction(confirm)
//            self.present(alert, animated: true)
//        }
//
//        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
//            sample.value = 200
//        }
    }

    @objc func didTapLoginButton(_ sender: UIButton) {
        viewModel.signIn {
            // "로그인 성공했기 때문에 얼럿 띄우기"
            let alert = UIAlertController(
                title: "로그인 성공",
                message: nil,
                preferredStyle: .alert
            )
            let confirm = UIAlertAction(
                title: "확인",
                style: .default
            )
            alert.addAction(confirm)
            present(alert, animated: true)
        }
    }

    @objc func didEditChangedIdTextField(_ sender: UITextField) {
        viewModel.id.value = sender.text ?? ""
        viewModel.checkValidation()
    }

    @objc func didEditChangedPwTextField(_ sender: UITextField) {
        viewModel.pw.value = sender.text ?? ""
        viewModel.checkValidation()
    }

}
