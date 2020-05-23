//
//  DataModel.swift
//  UrbanDictionary
//
//  Created by Ramill Ibragimov on 23.05.2020.
//  Copyright © 2020 Ramill Ibragimov. All rights reserved.
//

import Foundation

struct AllItems: Decodable {
    let list: [List]
}

struct List: Decodable {
    let id: UUID = UUID()
    let definition: String?
    let permalink: String?
    let thumbs_up: Int?
    let sound_urls: [String?]
    let author: String?
    let word: String?
    let defid: Int?
    let current_vote: String?
    let written_on: String?
    let example: String?
    let thumbs_down: Int?
}
