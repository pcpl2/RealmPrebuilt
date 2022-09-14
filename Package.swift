// swift-tools-version:5.3
import PackageDescription

let realmVersion = "v10.26.0"

func buildTargets() -> [Target] {
    let baseURL = "https://github.com/pcpl2/RealmPrebuilt/releases/download/\(realmVersion)"

    #if swift(>=5.7)
    let xcodeVersion = "14.0"
    let realmChecksum = "e8c78b62cb5f32b4ea43c6300285bb0da6ec8268575abe6981d0ca17866d818a"
    let realmSwiftChecksum = "49c63aef6e49e44b4e0a31b04f81c244c249278ed87c8b225134b1ac1b2dc340"
    #elseif swift(>=5.6)
    let xcodeVersion = "13.3.1"
    let realmChecksum = "b1c1c223a3a2c420c5de5068e31523b127576582e0f26a0079d6f59d62fff063"
    let realmSwiftChecksum = "16b2ca845df4b877375a08a48f5abb1657ecc3b9d83097debfaed36c7987c169"
    #elseif swift(>=5.5.2)
    let xcodeVersion = "13.2.1"
    let realmChecksum = "95d6f01a1f6e0d0ec4d7a300266f93c2e6b8cd8141ca338972665a9b01de3ca6"
    let realmSwiftChecksum = "e19a9f36102dbe4a33015f1bd3df09084a0e80b79b25e5de252b0a8d4ad53946"
    #elseif swift(>=5.5.1)
    let xcodeVersion = "13.1"
    let realmChecksum = "854b7a4c83bfbc204fdae959690d6ed8b5fd949f0469d64e75d2eea072f5124f"
    let realmSwiftChecksum = "ce67836d98bf5bc894c628148f8c67ef95d03986b7293c8e5f71d1c036333630"
    #elseif swift(>=5.5)
    let xcodeVersion = "13.0"
    let realmChecksum = "4d9caa203ae569296d886acc688e23ad81f0ab500a0735cdb0b6ac4af067185a"
    let realmSwiftChecksum = "c1100fb9b7f94c6c7951ce9a257ae83c7617980052a206eef22d2c28cccd64ce"
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

