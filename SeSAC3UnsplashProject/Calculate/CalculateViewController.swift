//
//  CalculateViewController.swift
//  SeSAC3UnsplashProject
//
//  Created by 서승우 on 2023/09/13.
//

import UIKit

final class CalculateViewController: UIViewController {
    @IBOutlet weak var firstTextField: UITextField!
    @IBOutlet weak var secondTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!

    @IBOutlet weak var tempLabel: UILabel!

    let viewModel = CalculateViewModel()

    @objc func chagedFirstTextField(_ sender: UITextField) {
        viewModel.firstNumber.value = sender.text
        viewModel.calculate()
        viewModel.presentNumberFormat()
    }

    @objc func chagedSecondTextField(_ sender: UITextField) {
        viewModel.secondNumber.value = sender.text
        viewModel.calculate()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        firstTextField.addTarget(self, action: #selector(chagedFirstTextField), for: .editingChanged)
        firstTextField.addTarget(self, action: #selector(chagedSecondTextField), for: .editingChanged)

        viewModel.firstNumber.bind { number in
            self.firstTextField.text = number
            print("firstNumber changed \(number)")
        }

        viewModel.secondNumber.bind { number in
            self.secondTextField.text = number
            print("secondNumber changed \(number)")
        }

        viewModel.resultText.bind { text in
            self.resultLabel.text = text
        }

        viewModel.tempText.bind { text in
            self.tempLabel.text = text
        }

//        let person = Person("새싹이")
//        person.name = "카스타드"
//        person.name = "칙촉"
//
//        person.introduce { value in
//            self.resultLabel.text = value
//            self.view.backgroundColor = [
//                UIColor.orange,
//                UIColor.lightGray,
//                UIColor.lightGray
//            ].randomElement()!
//        }
//
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//            person.name = "바나나"
//        }
//        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
//            person.name = "키위"
//        }
//
//
//        firstTextField.text = viewModel.firstNumber.value
//        secondTextField.text = viewModel.secondNumber.value
    }

}
