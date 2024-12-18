//
//  Enums.swift
//  NewsFeed
//
//  Created by Omkar Zanjale on 17/12/24.
//

import Foundation

enum HTTPMethod: String {
    case GET = "GET"
}

enum ConnectionType: String {
    case secure = "https://"
    case insecure = "http://"
}

enum DataPopulation : String {
    case STATIC = "STATIC"
    case DYNAMIC = "DYNAMIC"
}

enum Environments {
    case DEV
    case QA
    case STAGE
    case PROD
}

enum BottomTab: String {
    case topHeadlines = "Top Headlines"
    case home = "Home"
    case fav = "Favorite"
}

enum Fonts {
    static let figtreeBold = "Figtree-Bold"
    static let figtreeExtraBold = "Figtree-ExtraBold"
    static let figtreeLight = "Figtree-Light"
    static let figtreeMedium = "Figtree-Medium"
    static let figtreeRegular = "Figtree-Regular"
    static let figtreeSemiBold = "Figtree-SemiBold"
    static let figtreeItalic = "Figtree-Italic"
}

enum DateFormats: String {
    case YYYY_MM_DDTHH_mm_ssZ = "yyyy-MM-dd'T'HH:mm:ssZ"
    case yyyy_MM_dd = "yyyy-MM-dd"
    case E_MMM_dd = "E, MMM dd"
}
