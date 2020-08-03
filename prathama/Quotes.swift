//
//  Quotes.swift
//  prathama
//
//  Created by Dharma Developer on 03/08/2020.
//  Copyright © 2020 Dharma Developer. All rights reserved.
//

import Foundation

struct Quote: Codable {
    var content: String = ""
    var author: String = ""
    var length: Int
}

struct Tags: Codable {
    var index: String = ""
}

