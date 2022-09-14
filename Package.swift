// swift-tools-version:5.3
import PackageDescription

let realmVersion = "v10.27.0"

func buildTargets() -> [Target] {
    let baseURL = "https://github.com/pcpl2/RealmPrebuilt/releases/download/\(realmVersion)"

    #if swift(>=5.7)
    let xcodeVersion = "14.0"
    let realmChecksum = "caec2706de7245e6d7511b7549a9a72cd56eb471f9fa6aee16f9787c9e696793"
    let realmSwiftChecksum = "8ea15c36c46d649ba2b25a84a2aa5f843e7f395df6819b6790753fb21ad034e9"
    #elseif swift(>=5.6)
    let xcodeVersion = "13.3.1"
    let realmChecksum = "aa0147745da45810b4d9ee1f0d9e987bd65ff98b89b99e355f1574b2e7cfeca4"
    let realmSwiftChecksum = "8538788f60eb7583a1738801386769b5c045251da752c2abeac0bfda1fdd85b8"
    #elseif swift(>=5.5.2)
    let xcodeVersion = "13.2.1"
    let realmChecksum = "76c0fc25990d3ebe01a0321713e01ad5dbcd3f783b4d944211b1ecf9dc86dc92"
    let realmSwiftChecksum = "78965080ebd96c79d9a5b0dabccd7b96951c2839c50c98e243f70f8da11bc274"
    #elseif swift(>=5.5.1)
    let xcodeVersion = "13.1"
    let realmChecksum = "b47932e5483a96a6a5c5001859fc76ff667f0c051064f4962f3e80b98105e4d3"
    let realmSwiftChecksum = "ddcaee9b7bc79cba942d96fa9d75dfa9f5b16962ebd8cb7cd3890c8280c092a8"
    #elseif swift(>=5.5)
    let xcodeVersion = "13.0"
    let realmChecksum = "45a40c880b4e6a0e863d5ae02f5a1dd7c6a06cce4f13923403b7cef67ba2af76"
    let realmSwiftChecksum = "34f09a4654a66f9ac5813446642d09d497a15c40c89cfe2228c9bd27cbb214f7"
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

