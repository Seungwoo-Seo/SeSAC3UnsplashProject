//
//  NewSimpleTableViewController.swift
//  SeSAC3UnsplashProject
//
//  Created by 서승우 on 2023/09/14.
//

import UIKit

final class NewSimpleTableViewController: UITableViewController {

    let userList = [
        User(name: "Hue", age: 23),
        User(name: "Jack", age: 21),
        User(name: "Bran", age: 20),
        User(name: "Kokojong", age: 20)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()
        content.text = userList[indexPath.row].name
        content.secondaryText = "\(userList[indexPath.row].age)"
        cell.contentConfiguration = content
        return cell
    }

}
