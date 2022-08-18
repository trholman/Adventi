//
//  DetailView.swift
//  Adventi
//
//  Created by Travis Holman on 11/17/21.
//

import SwiftUI

struct DetailView: View {
    @Binding var event: Event
    @State private var data: Event.Data = Event.Data()
    @State private var isPresented = false
    var body: some View {
        List {
            Section(header: Text("Assignments")) {
                NavigationLink(
                    destination: AssignmentView(event: $event)) {
                        Label("Make Assignments", systemImage: "person.2")
                            .font(.headline)
                            .foregroundColor(.accentColor)
                            .accessibilityLabel(Text("Make assigmnents"))
                    }
                HStack {
                    Label("Length", systemImage: "clock")
                        .accessibilityLabel(Text("Assignment length"))
                    Spacer()
                    Text("\(event.lengthInMinutes) minutes")
                }
                HStack {
                    Label("Color", systemImage: "paintpalette")
                    Spacer()
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(event.color)
                }
                .accessibilityElement(children: .ignore)
            }
            Section(header: Text("Attendees")) {
                ForEach(event.attendees, id: \.self) { attendee in
                    Label(attendee, systemImage: "person")
                        .accessibilityLabel(Text("Person"))
                        .accessibilityValue(Text(attendee))
                }
            }
            Section(header: Text("History")) {
                if event.history.isEmpty {
                    Label("No assignments yet", systemImage: "calendar.badge.exclamationmark")
                }
                ForEach(event.history) { history in
                    NavigationLink(
                        destination: HistoryView(history: history)) {
                        HStack {
                            Image(systemName: "calendar")
                            Text(history.date, style: .date)
                        }
                    }
                }
            }

        }
        .listStyle(InsetGroupedListStyle())
        .navigationBarItems(trailing: Button("Edit") {
            isPresented = true
            data = event.data
        })
        .navigationTitle(event.title)
        .fullScreenCover(isPresented: $isPresented) {
            NavigationView {
                EditView(eventData: $data)
                    .navigationTitle(event.title)
                    .navigationBarItems(leading: Button("Cancel") {
                        isPresented = false
                    }, trailing: Button("Done") {
                        isPresented = false
                        event.update(from: data)
                    })
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailView(event: .constant(Event.data[0]))
        }
    }
}
