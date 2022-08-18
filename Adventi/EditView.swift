//
//  EditView.swift
//  Adventi
//
//  Created by Travis Holman on 11/17/21.
//

import SwiftUI

struct EditView: View {
    @Binding var eventData: Event.Data
    @State private var newAttendee = ""
    var body: some View {
        List {
            Section(header: Text("Assignment Info")) {
                TextField("Title", text: $eventData.title)
                HStack {
                    Slider(value: $eventData.lengthInMinutes, in: 5...30, step: 1.0) {
                        Text("Length")
                    }
                    .accessibilityValue(Text("\(Int(eventData.lengthInMinutes)) minutes"))
                    Spacer()
                    Text("\(Int(eventData.lengthInMinutes)) minutes")
                        .accessibilityHidden(true)
                }
                ColorPicker("Color", selection: $eventData.color)
                    .accessibilityLabel(Text("Color picker"))
            }
            Section(header: Text("Attendees")) {
                ForEach(eventData.attendees, id: \.self) { attendee in
                    Text(attendee)
                }
                .onDelete { indices in
                    eventData.attendees.remove(atOffsets: indices)
                }
                HStack {
                    TextField("New Attendee", text: $newAttendee)
                    Button(action: {
                        withAnimation {
                            eventData.attendees.append(newAttendee)
                            newAttendee = ""
                        }
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .accessibilityLabel(Text("Add attendee"))
                    }
                    .disabled(newAttendee.isEmpty)
                }
            }
        }
        .listStyle(InsetGroupedListStyle())
    }
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView(eventData: .constant(Event.data[0].data))
    }
}
