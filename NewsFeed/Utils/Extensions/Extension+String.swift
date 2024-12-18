//
//  Extension+String.swift
//  NewsFeed
//
//  Created by Omkar Zanjale on 18/12/24.
//

import Foundation

extension String {
    func checkToShow(_ defaultValue: String = "-") -> String {
        self.isEmpty ? defaultValue : self
    }
}
