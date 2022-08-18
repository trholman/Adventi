//
//  Event.swift
//  Adventi
//
//  Created by Travis Holman on 11/17/21.
//

import SwiftUI
import Foundation

struct Event: Identifiable, Codable {
    let id: UUID
    var title: String
    var attendees: [String]
    //var lengthInMinutes: Int
    var eventDate: Date
    var color: Color
    var history: [History]

    init(id: UUID = UUID(), title: String, attendees: [String], eventDate: Date, color: Color, history: [History] = []) {
        self.id = id
        self.title = title
        self.attendees = attendees
        //self.lengthInMinutes = lengthInMinutes
        self.eventDate = eventDate
        self.color = color
        self.history = history
    }
}

extension Event {
    static var data: [Event] {
        [
            Event(title: "Holman Christmas", attendees: ["Cathy", "Daisy", "Simon", "Jonathan"], eventDate: Date(), color: Color("Holman Christmas")),
            Event(title: "Thanks Giving", attendees: ["Katie", "Gray", "Euna", "Luis", "Darla"], eventDate: Date(), color: Color("App Dev")),
            Event(title: "Saint Patricks", attendees: ["Chella", "Chris", "Christina", "Eden", "Karla", "Lindsey", "Aga", "Chad", "Jenn", "Sarah"], eventDate: Date(), color: Color("Saint Patricks"))
        ]
    }
}

extension Event {
    struct Data {
        var title: String = ""
        var attendees: [String] = []
        var eventDate: Date
        var color: Color = .random
    }

    var data: Data {
        return Data(title: title, attendees: attendees, eventDate: eventDate, color: color)
    }

    mutating func update(from data: Data) {
        title = data.title
        attendees = data.attendees
        eventDate = data.eventDate
        color = data.color
    }
}
