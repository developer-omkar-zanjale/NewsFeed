//
//  NewsService.swift
//  NewsFeed
//
//  Created by Omkar Zanjale on 17/12/24.
//

import Foundation

class NewsService: NewsServiceProtocol {
    
    func fetchTopHeadlines(completion: @escaping (Result<[ArticleDataModel], ErrorModel>) -> Void) {
        let params = [
            "country": "us",
            "category": "business"
        ]
        NetworkManager.shared.createRequest(endPoint: Endpoints.topHeadlines, params: params, resultType: NewsFeedResponseModel.self) { [weak self] result in
            let articles = self?.mapArticles(result.articles ?? []) ?? []
            completion(.success(articles))
        } onFailure: { error in
            completion(.failure(error))
        }
    }
    
    
    func fetchArticlesFrom(_ date: String, query: String, completion: @escaping (Result<[ArticleDataModel], ErrorModel>) -> Void) {
        let params = [
            "q": query,
            "from": date
        ]
        NetworkManager.shared.createRequest(endPoint: Endpoints.everything, params: params, resultType: NewsFeedResponseModel.self) { [weak self] result in
            let articles = self?.mapArticles(result.articles ?? []) ?? []
            completion(.success(articles))
        } onFailure: { error in
            completion(.failure(error))
        }
    }
    
    private func mapArticles(_ data: [ArticleResponseModel]) -> [ArticleDataModel] {
        let convertedData = data.map { item in
            let sourceObj = ArticleSourceDataModel(id: item.source?.id ?? "", name: item.source?.name ?? "")
            return ArticleDataModel (
                source: sourceObj,
                author: item.author ?? "",
                title: item.title ?? "",
                description: item.description ?? "",
                url: item.url ?? "",
                urlToImage: item.urlToImage ?? "",
                publishedAt: item.publishedAt ?? "",
                content: item.content ?? ""
            )
        }
        return convertedData
    }
    
}
