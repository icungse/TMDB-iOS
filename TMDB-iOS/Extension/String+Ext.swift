//
//  String+Ext.swift
//  TMDB-iOS
//
//  Created by Icung on 05/08/23.
//

import Foundation

extension String {
    func formatDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from: self) ?? Date()
        dateFormatter.dateFormat = "dd MMM yyyy"
        let stringDate = dateFormatter.string(from: date)
        return stringDate
    }
}
