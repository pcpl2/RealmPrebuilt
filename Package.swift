// swift-tools-version:5.3
import PackageDescription

let realmVersion = ""

func buildTargets() -> [Target] {
    let baseURL = "https://github.com/pcpl2/RealmPrebuilt/releases/download/\(realmVersion)"

    #if swift(>=5.7)
    let xcodeVersion = "14.0"
    let realmChecksum = "9649c1e6a3866c884f9d1e3479276496b3c87e338f61e06735a0a47c880d6966"
    let realmSwiftChecksum = "89ae4b524e91be30aaabd8ae1557c0d5c9e3f2849bd0be0b11a885d55c10e32e"
    #elseif swift(>=5.6)
    let xcodeVersion = "13.3.1"
    let realmChecksum = "a585eb9aa06ba24fccb84e3db02d0f0237d11eba6d20e661fd88277515b27b99"
    let realmSwiftChecksum = "009d1114d321b5de5ed7ecc175e46bbe325e42f36efae6e0dae8f01929270004"
    #elseif swift(>=5.5.2)
    let xcodeVersion = "13.2.1"
    let realmChecksum = "aec60ff2f4a0a38dfd2779ad85cc5c5aeb0aea1fab1e34f79bf132c5aa471827"
    let realmSwiftChecksum = "99e6154d4072bf723c7fd33f4a2bd9ee8a83bd725917c704dede34d00a6c7e56"
    #elseif swift(>=5.5.1)
    let xcodeVersion = "13.1"
    let realmChecksum = "df2316a8891811ad4ea65a23b08a0c209ac96ee6cb0f32d03c96cf352d36c1a1"
    let realmSwiftChecksum = "d51b0bc3e1e94716560f755208df976c5efe62e22a79c5330925939e5441861d"
    #elseif swift(>=5.5)
    let xcodeVersion = "13.0"
    let realmChecksum = "e9ca71c2f5485058b438cb3483a9ded955615274d8a254167159b959038af210"
    let realmSwiftChecksum = "e295f9998f8d8656c029153ef53092a4dc7b6f7ec06503f229c12d17af815bad"
    #endif
    
    return [
        .binaryTarget(
            name: "Realm",
            url: "\(baseURL)/Realm_\(xcodeVersion).xcframework.zip",
            checksum: realmChecksum
        ),
        .binaryTarget(
            name: "RealmSwift",
            url: "\(baseURL)/RealmSwift_\(xcodeVersion).xcframework.zip",
            checksum: realmSwiftChecksum
        )
    ]
}

let package = Package(
    name: "RealmPrebuilt",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "Realm",
            targets: ["Realm"]),
        .library(
            name: "RealmSwift",
            targets: ["Realm", "RealmSwift"])
    ],
    targets: buildTargets()
)

