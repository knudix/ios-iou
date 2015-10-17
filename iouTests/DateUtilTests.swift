//
//  DateUtilTests.swift
//  iou
//
//  Created by Knut Nygaard on 17/10/15.
//  Copyright © 2015 APM solutions. All rights reserved.
//

import Foundation
import XCTest

class DateUtilTests : XCTestCase {
    
    override func setUp() {
        
    }
    
    func testDateFromUTCString() {
        let dateString = "2014-06-29T11:34:14Z"
        
        XCTAssertNotNil(dateFromUTCString(dateString))
    }


}