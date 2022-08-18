//
//  EventsView.swift
//  Adventio
//
//  Created by Travis Holman on 11/17/21.
//

import SwiftUI

struct EventsView: View {
    @Binding var events: [DailyScrum]
    @Environment(\.scenePhase) private var scenePhase
    @State private var isPresented = false
    @State private var newEventData = DailyScrum.Data()
    let saveAction: () -> Void
    var body: some View {
        List {
            ForEach(events) { event in
                NavigationLink(destination: DetailView(event: binding(for: event))) {
                    CardView(event: event)
                }
                .listRowBackground(event.color)
            }
        }
        .navigationTitle("Advent Events")
        .navigationBarItems(trailing: Button(action: {
            isPresented = true
        }) {
            Image(systemName: "plus")
        })
        .sheet(isPresented: $isPresented) {
            NavigationView {
                EditView(eventData: $newEventData)
                    .navigationBarItems(leading: Button("Dismiss") {
                        isPresented = false
                    }, trailing: Button("Add") {
                        let newEvent = AdventEvent(title: newEventData.title, attendees: newEventData.attendees,
                                                  lengthInMinutes: Int(newEventData.lengthInMinutes), color: newEventData.color)
                        event.append(newEvent)
                        isPresented = false
                    })
            }
        }
        .onChange(of: scenePhase) { phase in
            if phase == .inactive { saveAction() }
        }
    }

    private func binding(for event: AdventEvent) -> Binding<AdventEvent> {
        guard let eventIndex = events.firstIndex(where: { $0.id == event.id }) else {
            fatalError("Cannot find event in array")
        }
        return $events[eventIndex]
    }
}

struct EventsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            EventsView(events: .constant(AdventEvent.data), saveAction: {})
        }
    }
}
