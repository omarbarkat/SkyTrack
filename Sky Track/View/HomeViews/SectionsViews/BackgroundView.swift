//
//  BackgroundView.swift
//  Sky Track
//
//  Created by eng.omar on 25/08/2024.
//

import SwiftUI

struct BackgroundView: View {
    var isDay: Bool

    var body: some View {
        Image(isDay ? "day_background" : "night_background")
            .resizable()
            .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    BackgroundView(isDay: true)
}
