//
//  UrbanDictionaryUITests.swift
//  UrbanDictionaryUITests
//
//  Created by Ramill Ibragimov on 24.05.2020.
//  Copyright © 2020 Ramill Ibragimov. All rights reserved.
//

import XCTest

class UrbanDictionaryUITests: XCTestCase {

    func testExample() throws {
        
        let app = XCUIApplication()
        app.launch()
        
        let searchList = ["San Fancisco", "New York", "Chicago", "Miami"]
        
        var searchItemCharactersCount = 1
        for searchItem in searchList {
            let searchButton = app.images["searchButton"]
            searchButton.press(forDuration: 2)
            
            let searchField = app.textFields["searchField"]
            searchField.tap()
                
            for _ in 1...searchItemCharactersCount {
                app.keys["delete"].tap()
            }
            searchItemCharactersCount = searchItem.count

            searchField.typeText(searchItem)
            app.keyboards.buttons["Return"].tap()

            searchButton.tap()
            
            sleep(2)
        }
    }
}
