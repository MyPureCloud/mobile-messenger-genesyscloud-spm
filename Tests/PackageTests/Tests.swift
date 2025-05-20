import XCTest
import GenesysCloud

final class PackageTests: XCTestCase {
    func testImport() {
        XCTAssertNotNil(GenesysCloud.ChatController.self)
    }
}
