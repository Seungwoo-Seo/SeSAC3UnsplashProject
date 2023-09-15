//
//  SampleViewController.swift
//  SeSAC3UnsplashProject
//
//  Created by 서승우 on 2023/09/12.
//

import UIKit

struct User {
    let name: String
    let age: Int

    var introduce: String {
        return "\(name), \(age)살"
    }
}

final class SampleViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!

    let viewModel = SampleViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
    }

}

extension SampleViewController: UITableViewDataSource {

    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return viewModel.numberOfRowsInSection
    }

    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        // 이전
//        let cell = tableView.dequeueReusableCell(withIdentifier: "sampleCell", for: indexPath)
//        let data = viewModel.cellForRowAt(at: indexPath)
//        cell.textLabel?.text = data.introduce

        // 이후
        // SwiftUI의 UI들이 구조체로 이루어져 있어서
        // UI를 구성할 때 구조체 기반으로 변하고 있다.
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()
        content.text = "테스트"    // textLabel
        content.secondaryText = "안녕하세요 \(indexPath.row)"    // detailLabel
        cell.contentConfiguration = content

        return cell
    }

}

extension SampleViewController: UITableViewDelegate {

}
