//
//  Extensions.swift
//  Hogwarts
//
//  Created by Stephanie Staniswinata on 25/11/25.
//

import Foundation

extension String{
    func fromSlugToTitleCase() -> String {
            let decoded = (self.removingPercentEncoding ?? self)
                .replacingOccurrences(of: "-", with: " ")
                .replacingOccurrences(of: "_", with: " ")
                .trimmingCharacters(in: .whitespacesAndNewlines)

            let words = decoded.split(separator: " ").map(String.init)
            let capitalized = words.map { word -> String in
                // keep small words lowercased if you want special rules; for now just Capitalize each
                return word.lowercased().capitalized(with: Locale.current)
            }
            return capitalized.joined(separator: " ")
        }
}
