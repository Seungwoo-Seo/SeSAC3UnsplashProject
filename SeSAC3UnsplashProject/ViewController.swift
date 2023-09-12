//
//  ViewController.swift
//  SeSAC3UnsplashProject
//
//  Created by 서승우 on 2023/09/11.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nicknamTextField: UITextField!
    @IBOutlet weak var changeButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        nicknamTextField.placeholder = "nickname_plecehholder".localized

//        let value = NSLocalizedString("nickname_result", comment: "")
//        resultLabel.text = String(format: value, "고래밥", "다마고치", "콩딱핑")

        resultLabel.text = "age_result".localized(number: 26)
    }

}

