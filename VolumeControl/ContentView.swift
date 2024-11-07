//
//  ContentView.swift
//  VolumeControl
//
//  Created by Javier Serrano Muñoz on 7/11/24.
//

import SwiftUI
import VolumeControlView

struct ContentView: View {
    @State private var volume: Double = 0.5

    var body: some View {
        VStack {
            VolumeControlView(totalBars: 20, volume: $volume)
                .filledColor(.red)
                .frame(width: 100, height: 500)
            Text("Volume: \(volume)")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

