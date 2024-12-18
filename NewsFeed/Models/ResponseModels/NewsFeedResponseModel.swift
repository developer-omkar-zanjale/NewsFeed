//
//  NewsFeedResponseModel.swift
//  NewsFeed
//
//  Created by Omkar Zanjale on 17/12/24.
//

import Foundation

struct NewsFeedResponseModel: BaseResponse {
    let status: String?
    let totalResults: Int?
    let articles: [ArticleResponseModel]?
}

struct ArticleResponseModel: BaseResponse {
    let source: SourceResponseModel?
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
}

struct SourceResponseModel: BaseResponse {
    let id: String?
    let name: String?
}
