//
//  CNItem.swift
//  CNChalllengeOne
//
//  Created by Guglielmo Deletis on 01/08/22.
//

import Foundation

protocol FetchableItem {
    var isbn: String? { get set }
    var title: String? { get set }
    var author: String? { get set }
}

struct Item: FetchableItem {
    var isbn: String?
    var title: String?
    var author: String?
}

struct ComicBook: FetchableItem {
    var isbn: String?
    var title: String?
    var author: String?
    var marvelUniverse: Bool?
}
