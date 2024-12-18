//
//  NewsViewModelTest.swift
//  NewsFeedTests
//
//  Created by Omkar Zanjale on 18/12/24.
//

import XCTest
@testable import NewsFeed

final class NewsViewModelTest: XCTestCase {
    class MockNewsService: NewsServiceProtocol {
        var topHeadlinesResult: Result<[ArticleDataModel], ErrorModel>?
        var articlesQueryResult: Result<[ArticleDataModel], ErrorModel>?
        
        func fetchTopHeadlines(completion: @escaping (Result<[ArticleDataModel], ErrorModel>) -> Void) {
            if let result = topHeadlinesResult {
                completion(result)
            }
        }
        
        func fetchArticlesFrom(_ date: String, query: String, completion: @escaping (Result<[ArticleDataModel], ErrorModel>) -> Void) {
            if let result = articlesQueryResult {
                completion(result)
            }
        }
    }
    
    func testLoadTopHeadlinesSuccess() {
        // Arrange
        let mockService = MockNewsService()
        let expectedArticles = DummyData.articlesArray
        mockService.topHeadlinesResult = .success(expectedArticles)
        let viewModel = NewsViewModel(service: mockService)
        
        // Act
        viewModel.loadTopHeadlines()
        
        // Assert
        asyncAfter {
            XCTAssertEqual(viewModel.articles, expectedArticles)
            XCTAssertFalse(viewModel.isLoading)
            XCTAssertFalse(viewModel.isShowAlert)
        }
    }
    
    func testLoadTopHeadlinesFailure() {
        // Arrange
        let mockService = MockNewsService()
        let expectedError = ErrorModel(message: "Network Error")
        mockService.topHeadlinesResult = .failure(expectedError)
        let viewModel = NewsViewModel(service: mockService)
        
        // Act
        viewModel.loadTopHeadlines()
        
        // Assert
        asyncAfter {
            XCTAssertTrue(viewModel.articles.isEmpty)
            XCTAssertEqual(viewModel.alertMessage, expectedError.message)
            XCTAssertTrue(viewModel.isShowAlert)
            XCTAssertFalse(viewModel.isLoading)
        }
    }
    
    func testLoadArticleForQuerySuccess() {
        // Arrange
        let mockService = MockNewsService()
        let expectedArticles = DummyData.articlesArray
        mockService.articlesQueryResult = .success(expectedArticles)
        let viewModel = NewsViewModel(service: mockService)
        
        // Act
        viewModel.loadArticleForQuery()
        
        // Assert
        asyncAfter {
            XCTAssertEqual(viewModel.articles, expectedArticles)
            XCTAssertFalse(viewModel.isLoading)
            XCTAssertFalse(viewModel.isShowAlert)
        }
    }
    
    func testLoadArticleForQueryFailure() {
        // Arrange
        let mockService = MockNewsService()
        let expectedError = ErrorModel(message: "Network Error")
        mockService.articlesQueryResult = .failure(expectedError)
        let viewModel = NewsViewModel(service: mockService)
        
        // Act
        viewModel.loadArticleForQuery()
        
        // Assert
        asyncAfter {
            XCTAssertTrue(viewModel.articles.isEmpty)
            XCTAssertEqual(viewModel.alertMessage, expectedError.message)
            XCTAssertTrue(viewModel.isShowAlert)
            XCTAssertFalse(viewModel.isLoading)
        }
    }
}
