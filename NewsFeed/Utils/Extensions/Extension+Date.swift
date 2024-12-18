//
//  Extension+Date.swift
//  NewsFeed
//
//  Created by Omkar Zanjale on 18/12/24.
//

import Foundation

extension Date {
    var dayBeforeFormatted: String {
        let calendar = Calendar.current
        let formatter = DateFormatter()
        formatter.dateFormat = DateFormats.yyyy_MM_dd.rawValue
        
        if let dayBefore = calendar.date(byAdding: .day, value: -1, to: self) {
            return formatter.string(from: dayBefore)
        }
        
        return ""
    }
    
    static func convertDateString(_ dateStr: String, from inputFormat: String = DateFormats.YYYY_MM_DDTHH_mm_ssZ.rawValue) -> String {
        if dateStr.isEmpty {
            return ""
        }
        let inputFormatter = DateFormatter()
        inputFormatter.locale = Locale(identifier: "en_US_POSIX")
        inputFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        inputFormatter.dateFormat = inputFormat
        
        let outputFormatter = DateFormatter()
        outputFormatter.locale = Locale(identifier: "en_US_POSIX")
        outputFormatter.dateFormat = DateFormats.E_MMM_dd.rawValue
        
        if let date = inputFormatter.date(from: dateStr) {
            return outputFormatter.string(from: date)
        }
        
        return ""
    }
}
