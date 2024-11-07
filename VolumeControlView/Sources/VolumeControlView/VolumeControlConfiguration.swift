//
//  VolumeControlConfiguration.swift
//  VolumeControlView
//
//  Created by Javier Serrano Muñoz on 7/11/24.
//

import SwiftUI

public struct VolumeControlStyle {
    var totalBars: Int
    var filledColor: Color
    var unfilledColor: Color
    
    public init(totalBars: Int, filledColor: Color, unfilledColor: Color) {
        self.totalBars = totalBars
        self.filledColor = filledColor
        self.unfilledColor = unfilledColor
    }
}
