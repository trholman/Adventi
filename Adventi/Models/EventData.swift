//
//  EventData.swift
//  Adventi
//
//  Created by Travis Holman on 11/17/21.
//

import Foundation

class EventData: ObservableObject {
    private static var documentsFolder: URL {
        do {
            return try FileManager.default.url(for: .documentDirectory,
                                               in: .userDomainMask,
                                               appropriateFor: nil,
                                               create: false)
        } catch {
            fatalError("Cannot find documents directory.")
        }
    }
    private static var fileURL: URL {
        return documentsFolder.appendingPathComponent("events.data")
    }
    @Published var events: [Event] = []

    func load() {
        DispatchQueue.global(qos: .background).async { [weak self] in
            guard let data = try? Data(contentsOf: Self.fileURL) else {
                #if DEBUG
                DispatchQueue.main.async {
                    self?.events = Event.data
                }
                #endif
                return
            }
            guard let dailyEvents = try? JSONDecoder().decode([Event].self, from: data) else {
                fatalError("Cannot decode saved event data.")
            }
            DispatchQueue.main.async {
                self?.events = dailyEvents
            }
        }
    }
    func save() {
        DispatchQueue.global(qos: .background).async { [weak self] in
            guard let events = self?.events else { fatalError("Self out of scope") }
            guard let data = try? JSONEncoder().encode(events) else { fatalError("Error encoding data") }
            do {
                let outfile = Self.fileURL
                try data.write(to: outfile)
            } catch {
                fatalError("Cannot write to file")
            }
        }
    }
}
