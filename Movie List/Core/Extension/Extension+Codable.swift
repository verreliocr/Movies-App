//
//  Extension+Codable.swift
//  Contacts App
//
//  Created by Verrelio C. Rizky on 13/02/20.
//  Copyright © 2020 Verrelio C. Rizky. All rights reserved.
//

import Foundation

extension Decodable {
    static func decode(from data: Data?) -> Self? {
        guard let data = data else { return nil }
        return try? JSONDecoder().decode(Self.self, from: data)
    }
}

extension Encodable {
    func asDictionary() -> [String: Any]? {
        if let data = try? JSONEncoder().encode(self),
            let dictionary = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] {
            print(dictionary)
            return dictionary
        }
        return nil
    }
}

protocol CaseIterableDefaultsLast: Decodable & CaseIterable & RawRepresentable
where Self.RawValue: Decodable, Self.AllCases: BidirectionalCollection { }

extension CaseIterableDefaultsLast {
    init(from decoder: Decoder) throws {
        self = try Self(rawValue: decoder.singleValueContainer().decode(RawValue.self)) ?? Self.allCases.last!
    }
}
