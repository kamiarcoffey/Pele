//
//  PeleTests.swift
//  PeleTests
//
//  Created by Kamiar Coffey on 11/21/19.
//  Copyright © 2019 Kamiar Coffey. All rights reserved.
//

import XCTest
@testable import Pele

var sutRoutine: PeleRoutine!
var sutExercise: [PeleExercise]!

class PeleTests: XCTestCase {

    override func setUp() {
        super.setUp()
        sutExercise = [PeleExercise("exercise1"), PeleExercise("exercise2")]
        sutRoutine = PeleRoutine(with: "test", with: sutExercise)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testRoutineContainer() {
        
        XCTAssertEqual(sutRoutine.exerciseCount, "2", "Routine contains the wrong number of exercises")
        XCTAssertEqual(sutRoutine.containsExercise(sutExercise[0]), true, "Routine does not contain an exercise it should")
        XCTAssertEqual(sutRoutine.containsExercise(PeleExercise("falseExercise")), false, "Routine does not contain an exercise it should")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
