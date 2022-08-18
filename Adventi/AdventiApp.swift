//
//  AdventioApp.swift
//  Adventio
//
//  Created by Travis Holman on 7/15/21.
//

import SwiftUI

@main
struct AdventiApp: App {
    @ObservedObject private var data = EventData()
    var body: some Scene {
        WindowGroup {
            NavigationView {
                EventssView(events: $data.events) {
                    data.save()
                }
            }
            .onAppear {
                data.load()
            }
        }
    }
}
