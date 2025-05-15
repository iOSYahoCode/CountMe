//
//  CountMeTests.swift
//  CountMeTests
//
//  Created by Yaroslaw Homziak on 15.05.2025.
//

import XCTest
@testable import CountMe

final class CountMeTests: XCTestCase {
    
    func testIncrementAndReset() throws {
        // Arrange
        let vm = CounterViewModel(targetScore: 3)
        
        // Act
        vm.increment()
        vm.increment()
        vm.increment()
        
        //Asset
        XCTAssertEqual(vm.score, 3, "After imcrement with step 1 score should be 3")
        
        vm.reset()
        
        XCTAssertEqual(vm.score, 0, "After reset score should be 0")
    }
    
}
