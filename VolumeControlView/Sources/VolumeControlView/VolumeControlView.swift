//
//  VolumeControlView.swift
//  VolumenControl
//
//  Created by Javier Serrano Muñoz on 31/10/24.
//


import SwiftUI

public struct VolumeControlView: View {
    var totalBars: Int
    @Binding var volume: Double // Value between 0.0 and 1.0
    @Environment(\.filledColor) private var envFilledColor
    @Environment(\.unfilledColor) private var envUnfilledColor
    
    var filledColor: Color?
    var unfilledColor: Color?
    
    public init(totalBars: Int, volume: Binding<Double>) {
        self.totalBars = totalBars
        self._volume = volume
    }
    
    public var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 2) {
                ForEach(0..<totalBars, id: \.self) { index in
                    Rectangle()
                        .fill(self.barColor(for: index))
                        .frame(width: geometry.size.width, height: self.barHeight(in: geometry.size))
                        .animation(.easeInOut(duration: 0.2), value: volume)
                }
            }
            .gesture(
                DragGesture(minimumDistance: 0)
                    .onChanged { value in
                        self.updateVolume(with: value.location, in: geometry.size)
                    }
            )
        }
    }
    
    func barHeight(in size: CGSize) -> CGFloat {
        (size.height - CGFloat(totalBars - 1) * 2) / CGFloat(totalBars)
    }
    
    func barColor(for index: Int) -> Color {
        let effectiveFilledColor = filledColor ?? envFilledColor
        let effectiveUnfilledColor = unfilledColor ?? envUnfilledColor
        
        let filledBars = Int(Double(totalBars) * volume)
        let reversedIndex = totalBars - index - 1
        return reversedIndex < filledBars ? effectiveFilledColor : effectiveUnfilledColor
    }
    
    func updateVolume(with location: CGPoint, in size: CGSize) {
        let selectedBar = calculateSelectedBar(from: location.y, in: size.height)
        volume = calculateVolume(for: selectedBar)
    }
    
    func calculateVolume(for selectedBar: Int) -> Double {
        return Double(selectedBar) / Double(totalBars)
    }
    
    func calculateSelectedBar(from yPosition: CGFloat, in totalHeight: CGFloat) -> Int {
        let barHeight = self.barHeight(in: CGSize(width: 0, height: totalHeight)) + 2 // Include spacing
        let selectedBar = max(0, min(totalBars, Int((totalHeight - yPosition) / barHeight)))
        return selectedBar
    }
    
}

public extension VolumeControlView {
    func filledColor(_ color: Color) -> Self {
        var copy = self
        copy.filledColor = color
        return copy
    }
    
    func unfilledColor(_ color: Color) -> Self {
        var copy = self
        copy.unfilledColor = color
        return copy
    }
}


struct VolumeControlView_Previews: PreviewProvider {
    @State static var interactiveVolume: Double = 0.2 //between 0 and 1

    static var previews: some View {
        Group {
            VolumeControlView(totalBars: 10, volume: $interactiveVolume)
                .frame(width: 100, height: 200)
                .previewLayout(.sizeThatFits)
                .previewDisplayName("Volume Preview")
        }
    }
}
