//
//  tests.swift
//
//
//  Created by Jeremy Bannister on 7/28/24.
//

///
final class distinct_type_tests: XCTestCase {
    
    ///
    func test_UUID_coding() throws {
        
        ///
        enum DummyDistinguisher { }
        
        ///
        typealias Subject = DistinctType<UUID, DummyDistinguisher>
        
        ///
        let uuid = UUID()
        
        ///
        let subject = Subject(underlyingValue: uuid)
        
        ///
        let jsonData = try subject.asJSONData()
        
        ///
        try jsonData
            .utf8String
            .assertEqual(to: uuid.asJSONData().utf8String)
        
        ///
        try jsonData
            .jsonDecoded(as: Subject.self)
            .assertEqual(to: subject)
        
        ///
        try uuid
            .asJSONData()
            .jsonDecoded(as: Subject.self)
            .assertEqual(to: subject)
    }
}
