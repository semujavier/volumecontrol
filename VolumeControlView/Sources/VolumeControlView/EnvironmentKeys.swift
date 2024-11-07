//
//  EnvironmentKeys.swift
//  VolumeControlView
//
//  Created by Javier Serrano Muñoz on 7/11/24.
//
import SwiftUI

private struct FilledColorKey: EnvironmentKey {
    static let defaultValue: Color = .accentColor
}

private struct UnfilledColorKey: EnvironmentKey {
    static let defaultValue: Color = .secondary
}

extension EnvironmentValues {
    var filledColor: Color {
        get { self[FilledColorKey.self] }
        set { self[FilledColorKey.self] = newValue }
    }
    
    var unfilledColor: Color {
        get { self[UnfilledColorKey.self] }
        set { self[UnfilledColorKey.self] = newValue }
    }
}
