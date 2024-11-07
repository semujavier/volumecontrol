import XCTest
@testable import VolumeControlView

final class VolumeControlViewTests: XCTestCase {

    @MainActor func testCalculateVolume() {
        let volumeControl = VolumeControlView(totalBars: 10, volume: .constant(0.0))

        XCTAssertEqual(volumeControl.calculateVolume(for: 0), 0.0)
        XCTAssertEqual(volumeControl.calculateVolume(for: 5), 0.5)
        XCTAssertEqual(volumeControl.calculateVolume(for: 10), 1.0)
    }
    
    @MainActor func testDefaultFilledColor() {
        let volumeControl = VolumeControlView(totalBars: 10, volume: .constant(0.5))
        XCTAssertNil(volumeControl.filledColor)
    }
    
    @MainActor func testDefaultUnfilledColor() {
        let volumeControl = VolumeControlView(totalBars: 10, volume: .constant(0.5))
        XCTAssertNil(volumeControl.unfilledColor)
    }
    
    @MainActor func testCustomFilledColor() {
        let volumeControl = VolumeControlView(totalBars: 10, volume: .constant(0.5))
            .filledColor(.blue)
        XCTAssertEqual(volumeControl.filledColor, .blue)
    }
    
    @MainActor func testCustomUnfilledColor() {
        let volumeControl = VolumeControlView(totalBars: 10, volume: .constant(0.5))
            .unfilledColor(.gray)
        XCTAssertEqual(volumeControl.unfilledColor, .gray)
    }
    
    @MainActor func testCalculateSelectedBar() {
        let volumeControl = VolumeControlView(totalBars: 10, volume: .constant(0.0))
        
        XCTAssertEqual(volumeControl.calculateSelectedBar(from: 200, in: 200), 0)
        XCTAssertEqual(volumeControl.calculateSelectedBar(from: -10, in: 200), 10)
        XCTAssertEqual(volumeControl.calculateSelectedBar(from: 90, in: 200), 5)
    }
}

