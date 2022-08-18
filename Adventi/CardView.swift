//
//  CardView.swift
//  Adventi
//
//  Created by Travis Holman on 11/17/21.
//

import SwiftUI

struct CardView: View {
    let event: Event
    var body: some View {
        VStack(alignment: .leading) {
            Text(event.title)
                .font(.headline)
            Spacer()
            HStack {
                Label("\(event.attendees.count)", systemImage: "person.3")
                    .accessibilityElement(children: .ignore)
                    .accessibilityLabel(Text("Attendees"))
                    .accessibilityValue(Text("\(event.attendees.count)"))
                Spacer()
                Label("\(event.lengthInMinutes)", systemImage: "calendar")
                    .padding(.trailing, 20)
                    .accessibilityElement(children: .ignore)
                    .accessibilityLabel(Text("Assignment length"))
                    .accessibilityValue(Text("\(event.lengthInMinutes) minutes"))
            }
            .font(.caption)
        }
        .padding()
        .foregroundColor(event.color.accessibleFontColor)
    }
}

struct CardView_Previews: PreviewProvider {
    static var event = Event.data[0]
    static var previews: some View {
        CardView(event: event)
            .background(event.color)
            .previewLayout(.fixed(width: 400, height: 60))
    }
}
