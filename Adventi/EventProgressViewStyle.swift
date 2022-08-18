//
//  EventProgressViewStyle.swift
//  Adventi
//
//  Created by Travis Holman on 11/17/21.
//

import SwiftUI

struct EventProgressViewStyle: ProgressViewStyle {
    var eventColor: Color

    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10.0)
                .fill(eventColor.accessibleFontColor)
                .frame(height: 20.0)
            ProgressView(configuration)
                .frame(height: 12.0)
                .padding(.horizontal)
        }
    }
}
