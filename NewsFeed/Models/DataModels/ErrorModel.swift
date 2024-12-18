//
//  ErrorModel.swift
//  NewsFeed
//
//  Created by Omkar Zanjale on 17/12/24.
//

import Foundation

struct ErrorModel: Error {
    var code: Int = 0
    var message: String
}
