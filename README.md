# DocumentID

The Firebase iOS SDK provides a Swift extension as FirebaseFirestoreSwift, and I created this library for the following reasons.

1. The official library is too heavy for SwiftUI.
2. optional ID of DocumentID is difficult to use.

In the Identifiable use case, it is unlikely that the ID will be nil. Also, the DocumentID of Firestore itself can never be nil. This is because the DocumentID in Firestore is provided as a random AutoID by the client.

In this library, DocumentID is not optional, and AutoID can be used to issue the same AutoID as Firebase.
Also, by using it together with [FirestoreSwift](https://github.com/1amageek/FirestoreSwift), you can use FirestoreEncoder and FirestoreDecoder in the same way as FirebaseFirestoreSwift.

# Usage

```swift
public struct YourItem: Identifiable {

    @DocumentID public var id: String

    public var text: String

    public init(id: String = AutoID.generate(), text: String) {
        self.id = id
        self.text = text
    }
}
```
