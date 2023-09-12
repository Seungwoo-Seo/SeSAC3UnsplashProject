//
//  PhotoViewModel.swift
//  SeSAC3UnsplashProject
//
//  Created by 서승우 on 2023/09/12.
//

import Foundation

class PhotoViewModel {

    var list = Observable(
        Photo(total: 0, total_pages: 0, results: [])
    )

    var numberOfRowsInSection: Int {
        return list.value.results?.count ?? 0
    }

    func cellForRow(at indexPath: IndexPath) -> URL? {
        let full = list.value.results?[indexPath.row].urls.full ?? ""
        return URL(string: full)
    }

    func fetchPhoto() {
        APIService.shared.searchPhoto(
            query: "sky"
        ) { photo in
            guard let photo = photo else {return}

            self.list.value = photo
        }
    }
}
