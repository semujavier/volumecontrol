
# Volume Control Project

This project provides an interactive, customizable `VolumeControlView` component that can be used in SwiftUI applications. The project consists of two elements:

- **VolumeControl**: Contains an app demonstrating the integration and usage of `VolumeControlView`. You can open the VolumeContro.xcproject to play with it.
- **VolumeControlView**: A Swift package that contains the `VolumeControlView` component, which is designed to be easily integrated into other projects.

## Overview of VolumeControlView

The `VolumeControlView` component is a highly flexible SwiftUI view for visualizing and interacting with a volume level. It features a customizable number of bars, color options, and an interactive interface for adjusting volume levels between 0 and 100%. This component provides a visual representation of volume with filled and unfilled bars that adapt to the selected volume level.

### Key Features

- **Customizable Bar Count**: You can set the number of bars to display in the view, allowing flexible volume granularity.
- **Volume Range from 0% to 100%**: The volume level can range from 0 (mute) to 1 (full volume) and updates interactively as the user adjusts it.
- **Customizable Colors**: Modify the colors of the filled and unfilled bars using two built-in modifiers.
  - `filledColor(_:)`: Set the color of the filled portion of the volume bar.
  - `unfilledColor(_:)`: Set the color of the unfilled portion of the volume bar.
- **Binding Interface**: Use a `Binding` for the volume property, enabling real-time updates and allowing you to use `VolumeControlView` as a callback interface.

## Usage

### Adding VolumeControlView to Your Project

To use `VolumeControlView` in your project, include it as a Swift package dependency by referencing the `VolumeControlView` directory. 

```swift
import VolumeControlView
```

### Basic Example

Here’s a basic example of integrating `VolumeControlView` with default settings:

```swift
struct ContentView: View {
    @State private var volume: Double = 0.5

    var body: some View {
        VolumeControlView(totalBars: 10, volume: $volume)
            .frame(width: 100, height: 200)
    }
}
```

### Customizing VolumeControlView

You can customize the appearance and behavior of `VolumeControlView` by using its modifiers and adjusting parameters:

```swift
struct ContentView: View {
    @State private var volume: Double = 0.5

    var body: some View {
        VolumeControlView(totalBars: 15, volume: $volume)
            .filledColor(.blue)
            .unfilledColor(.gray)
            .frame(width: 100, height: 250)
    }
}
```

In this example:
- `totalBars: 15` specifies the number of bars in the control.
- `.filledColor(.blue)` sets the color for the filled bars.
- `.unfilledColor(.gray)` sets the color for the unfilled bars.

### Interactive Example

To make the view interactive within SwiftUI Previews, use a `@State` variable for `volume`:

```swift
struct VolumeControlView_Previews: PreviewProvider {
    @State static var interactiveVolume: Double = 0.5

    static var previews: some View {
        VolumeControlView(totalBars: 10, volume: $interactiveVolume)
            .filledColor(.green)
            .unfilledColor(.red)
            .frame(width: 100, height: 200)
    }
}
```
