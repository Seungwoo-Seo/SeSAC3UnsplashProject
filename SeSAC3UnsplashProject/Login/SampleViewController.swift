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
        let cell = tableView.dequeueReusableCell(withIdentifier: "sampleCell", for: indexPath)
        let data = viewModel.cellForRowAt(at: indexPath)
        cell.textLabel?.text = data.introduce
        return cell
    }

}

extension SampleViewController: UITableViewDelegate {

}
