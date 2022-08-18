//
//  AssignmentView.swift
//  Adventi
//
//  Created by Travis Holman on 11/17/21.
//

import SwiftUI

struct AssignmentView: View {
    @Binding var event: Event
    var gifter: event.attendees
    var giftee: event.attendees

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16.0)
                .fill(event.color)
            VStack {
                
            }
        }
        .padding()
        .foregroundColor(event.color.accessibleFontColor)
    }
}


struct AssignmentView_Previews: PreviewProvider {
    static var previews: some View {
        AssignmentView(event: .constant(Event.data[0]))
    }
}
