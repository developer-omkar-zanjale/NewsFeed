//
//  NewsServiceProtocol.swift
//  NewsFeed
//
//  Created by Omkar Zanjale on 17/12/24.
//

import Foundation

protocol NewsServiceProtocol {
    
    func fetchTopHeadlines(completion: @escaping (Result<[ArticleDataModel], ErrorModel>) -> Void)
    
    func fetchArticlesFrom(_ date: String, query: String, completion: @escaping (Result<[ArticleDataModel], ErrorModel>) -> Void)
}
