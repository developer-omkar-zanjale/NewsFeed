//
//  DummyData.swift
//  NewsFeed
//
//  Created by Omkar Zanjale on 18/12/24.
//

import Foundation

struct DummyData {
    static let Article1 = ArticleDataModel(source: ArticleSourceDataModel(id: "", name: "Phandroid - News for Android"), author: "Tyler Lee", title: "Samsung Galaxy S25 launch date revealed!", description: "The launch date of the Samsung Galaxy S25 series might have been confirmed to take place on the 25th of January, 2025.\nThe post Samsung Galaxy S25 launch date revealed! appeared first on Phandroid.", url: "https://phandroid.com/2024/12/16/samsung-galaxy-s25-launch-date-revealed/", urlToImage: "https://phandroid.com/wp-content/uploads/2024/01/samsung-galaxy-s24-launch-9-scaled.jpg", publishedAt: "2024-12-16T06:45:27Z", content: "If youre considering the Samsung Galaxy S25 to be your next smartphone purchase, then a potential launch date for the handset might have been revealed. According to a post on X by @sondesix, the laun… [+1173 chars]")
    
    static let Article2 = ArticleDataModel(source: ArticleSourceDataModel(id: "", name: "Android Police"), author: "Rajesh Pandey", title: "Samsung Galaxy S25 Ultra could come in a stunning jet black shade", description: "Galaxy S25 Ultra could come in a bunch of colors", url: "https://www.androidpolice.com/samsung-galaxy-s25-ultra-could-come-stunning-jet-black-shade/", urlToImage: "https://static1.anpoimages.com/wordpress/wp-content/uploads/wm/2024/07/169-17.png", publishedAt: "2024-12-16T11:28:06Z", content: "")
    
    static let articlesArray = [Article1, Article2]
}
    
