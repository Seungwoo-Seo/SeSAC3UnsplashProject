//
//  NewSimpleCollectionViewController.swift
//  SeSAC3UnsplashProject
//
//  Created by 서승우 on 2023/09/14.
//

import SnapKit
import UIKit

final class NewSimpleCollectionViewController: UIViewController {
    var collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())

    let userList = [
        User(name: "Hue", age: 23),
        User(name: "Jack", age: 21),
        User(name: "Bran", age: 20),
        User(name: "Kokojong", age: 20)
    ]

    var cellRegistration: UICollectionView.CellRegistration<UICollectionViewListCell, User>!

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }

        collectionView.dataSource = self
        collectionView.delegate = self

        // UICollectionView.CellRegistration: iOS 14 이상, 메서드 대신 제네릭을 사용, 셀이 생성될 때마다 클로저가 호출
        cellRegistration = UICollectionView.CellRegistration { cell, indexPath, itemIdentifier in
            // 셀 디자인 및 데이터 처리
            var content = UIListContentConfiguration.valueCell()
            content.text = itemIdentifier.name
            content.textProperties.color = .brown
            content.secondaryText = "\(itemIdentifier.age)"
            content.image = UIImage(systemName: "star.fill")
            content.imageProperties.tintColor = .yellow
            content.prefersSideBySideTextAndSecondaryText = false
            content.textToSecondaryTextVerticalPadding = 30
            cell.contentConfiguration = content

            var backgroundConfig = UIBackgroundConfiguration.listPlainCell()
            backgroundConfig.backgroundColor = .lightGray
            backgroundConfig.cornerRadius = 10
            backgroundConfig.strokeWidth = 2
            backgroundConfig.strokeColor = .systemPink
            cell.backgroundConfiguration = backgroundConfig
        }
    }

    static func createLayout() -> UICollectionViewCompositionalLayout  {
        var configuration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        configuration.showsSeparators = false
        configuration.backgroundColor = .green
        let layout = UICollectionViewCompositionalLayout.list(using: configuration)
        return layout
    }

}

extension NewSimpleCollectionViewController: UICollectionViewDataSource, UICollectionViewDelegate {

    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return userList.count
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell = collectionView.dequeueConfiguredReusableCell(
            using: cellRegistration,
            for: indexPath,
            item: userList[indexPath.item]
        )
        return cell
    }

}
