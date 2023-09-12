//
//  PhotoViewController.swift
//  SeSAC3UnsplashProject
//
//  Created by 서승우 on 2023/09/12.
//

import Kingfisher
import UIKit

final class PhotoViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    let viewModel = PhotoViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 80

        viewModel.list.bind { _ in

            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }

        viewModel.fetchPhoto()
    }

}

extension PhotoViewController: UITableViewDataSource {

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
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        let url = viewModel.cellForRow(at: indexPath)
        cell.imageView?.kf.setImage(with: url)

        return cell
    }

}

extension PhotoViewController: UITableViewDelegate {


}
