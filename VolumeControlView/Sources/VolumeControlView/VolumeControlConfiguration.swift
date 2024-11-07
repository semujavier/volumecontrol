public struct VolumeControlConfiguration {
    var totalBars: Int
    var filledColor: Color
    var unfilledColor: Color
    
    public init(totalBars: Int, filledColor: Color, unfilledColor: Color) {
        self.totalBars = totalBars
        self.filledColor = filledColor
        self.unfilledColor = unfilledColor
    }
}