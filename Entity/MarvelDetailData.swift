//
//  MarvelDetailData.swift
//  mobile_test
//
//  Created by Pablo Somarriba on 30/12/22.
//

import Foundation

// MARK: - MarvelDetailData
struct MarvelDetailData: Codable {
    //let code: Int?
    let status, copyright, attributionText, attributionHTML: String?
    let etag: String?
    let data: DataClassDetail?
}

// MARK: - DataClass
struct DataClassDetail: Codable {
    let offset, limit, total, count: Int?
    let results: [ResultDetail]?
}

// MARK: - Result
struct ResultDetail: Codable {
    let id: Int?
    let name, resultDescription: String?
    let modified: String?
    let thumbnail: ThumbnailDetail?
    let resourceURI: String?
    let comics, series: ComicsDetail?
    let stories: StoriesDetail?
    let events: ComicsDetail?
    let urls: [URLElement]?

    enum CodingKeys: String, CodingKey {
        case id, name
        case resultDescription = "description"
        case modified, thumbnail, resourceURI, comics, series, stories, events, urls
    }
}

// MARK: - Comics
struct ComicsDetail: Codable {
    let available: Int?
    let collectionURI: String?
    let items: [ComicsItemDetail]?
    let returned: Int?
}

// MARK: - ComicsItem
struct ComicsItemDetail: Codable {
    let resourceURI: String?
    let name: String?
}

// MARK: - Stories
struct StoriesDetail: Codable {
    let available: Int?
    let collectionURI: String?
    let items: [StoriesItemDetail]?
    let returned: Int?
}

// MARK: - StoriesItem
struct StoriesItemDetail: Codable {
    let resourceURI: String?
    let name: String?
    let type: TypeEnum?
}

enum TypeEnum: String, Codable {
    case cover = "cover"
    case interiorStory = "interiorStory"
}

// MARK: - Thumbnail
struct ThumbnailDetail: Codable {
    let path: String?
    let thumbnailExtension: String?

    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }
}

// MARK: - URLElement
struct URLElementDetail: Codable {
    let type: String?
    let url: String?
}
