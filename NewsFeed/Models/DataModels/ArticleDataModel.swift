//
//  ArticleDataModel.swift
//  NewsFeed
//
//  Created by Omkar Zanjale on 17/12/24.
//

import Foundation

struct ArticleDataModel: Hashable, Identifiable {
    let id = UUID()
    let source: ArticleSourceDataModel
    let author: String
    let title: String
    let description: String
    let url: String
    let urlToImage: String
    let publishedAt: String
    let content: String
}

struct ArticleSourceDataModel: Hashable, Identifiable {
    let uuid = UUID()
    let id: String
    let name: String
}

