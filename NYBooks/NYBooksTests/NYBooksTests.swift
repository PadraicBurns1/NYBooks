//
//  NYBooksTests.swift
//  NYBooksTests
//
//  Created by Padraic Burns on 8/8/22.
//

import XCTest
import Combine
@testable import NYBooks

class NYBooksTests: XCTestCase {
    
    var subs = Set<AnyCancellable>()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCategoryGetUrlParameter() throws {
        XCTAssert(Category.hardcoverFiction.getUrlParameter() == "hardcover-fiction")
        XCTAssert(Category.hardcoverNonfiction.getUrlParameter() == "hardcover-nonfiction")
        XCTAssert(Category.paperbackBooks.getUrlParameter() == "paperback-books")
        XCTAssert(Category.paperbackNonfiction.getUrlParameter() == "paperback-nonfiction")
    }
    
    func testListViewModelRequestBooks() throws {
        let viewModel = ListViewModel(network: MockNetworkManager())
        let expectation = XCTestExpectation()
        viewModel.requestBooks()
        
        viewModel.$books.dropFirst().sink(receiveValue: { value in
            expectation.fulfill()
        }).store(in: &subs)
        
        wait(for: [expectation], timeout: 3)
        XCTAssertTrue(viewModel.books != nil)
        
        guard let books: [Book] = viewModel.books else {
            return XCTFail()
        }
        
        XCTAssertFalse(books.isEmpty)
    }

}
