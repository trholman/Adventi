//
//  AdventioApp.swift
//  Adventio
//
//  Created by Travis Holman on 7/15/21.
//

import SwiftUI

@main
struct AdventioApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
