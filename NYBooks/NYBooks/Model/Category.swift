//
//  Category.swift
//  NYBooks
//
//  Created by Padraic Burns on 8/8/22.
//

import Foundation

enum Category: String, CaseIterable {
    
    case hardcoverFiction = "Hardcover Fiction"
    case hardcoverNonfiction = "Hardcover Nonfiction"
    case paperbackBooks = "Paperback Books"
    case paperbackNonfiction = "Paperback Nonfiction"
    
    func getUrlParameter() -> String {
        switch self {
        case .hardcoverFiction:
            return "hardcover-fiction"
        case .hardcoverNonfiction:
            return "hardcover-nonfiction"
        case .paperbackBooks:
            return "paperback-books"
        case .paperbackNonfiction:
            return "paperback-nonfiction"
        }
    }
    
}
