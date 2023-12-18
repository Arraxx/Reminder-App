//
//  Reminder.swift
//  Reminder_App
//
//  Created by Arrax on 18/12/23.
//

import Foundation

public struct Reminder: Identifiable, Encodable {
    public var id: String = UUID().uuidString
    var date: String
    var context: String
    
    init(date: String, context: String) {
        self.date = date
        self.context = context
    }

    enum CodingKeys: String, CodingKey {
        case id
        case date
        case context
    }

    // Convert Reminder to [String: String]
    public func toDictionary() -> [String: String] {
        return [
            "id": id,
            "date": date,
            "context": context
        ]
    }

    // Initialize Reminder from [String: String]
    init(dictionary: [String: String]) {
        self.id = dictionary["id"] ?? UUID().uuidString
        self.date = dictionary["date"] ?? ""
        self.context = dictionary["context"] ?? ""
    }

    // Encodable protocol method for custom encoding
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(date, forKey: .date)
        try container.encode(context, forKey: .context)
    }
}

