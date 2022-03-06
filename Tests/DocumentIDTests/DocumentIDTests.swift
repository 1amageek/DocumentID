import XCTest
@testable import DocumentID

final class DocumentIDTests: XCTestCase {
    func testIncludeID() throws {

        struct Model: Identifiable, Codable {
            @DocumentID var id: String
        }

        let data = ["id": "0000"]
        let jsonData = try JSONSerialization.data(withJSONObject: data, options: .fragmentsAllowed)
        do {
            let json = try JSONDecoder().decode(Model.self, from: jsonData)
            XCTAssertEqual(json.id, "0000")
        } catch {
            print(error)
        }

    }
}
