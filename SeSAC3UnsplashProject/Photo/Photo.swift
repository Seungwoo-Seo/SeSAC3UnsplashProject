//
//  Photo.swift
//  SeSAC3UnsplashProject
//
//  Created by 서승우 on 2023/09/12.
//

import Foundation

struct Photo: Codable {
    let total: Int
    let total_pages: Int
    let results: [PhotoResult]?
}

struct PhotoResult: Codable {
    let id: String
    let created_at: String
    let description: String?
    let urls: PhotoURL
    let links: PhotoLink
    let likes: Int
    let user: PhotoUser
}

struct PhotoURL: Codable {
    let full: String
    let thumb: String
}

struct PhotoLink: Codable {
    let html: String
}

struct PhotoUser: Codable {
    let username: String
}
