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

    func testEncode() throws {

        struct ModelA: Identifiable, Codable {
            @DocumentID var id: String
            var b: ModelB = ModelB(id: "B")
        }

        struct ModelB: Identifiable, Codable {
            @DocumentID var id: String
        }

        let a: ModelA = ModelA(id: "A")
        let data = try JSONEncoder().encode(a)
        let json = try JSONDecoder().decode(ModelA.self, from: data)
        XCTAssertEqual(json.id, "A")
        XCTAssertEqual(json.b.id, "B")

    }
}
