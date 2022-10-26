// swift-tools-version:5.3
import PackageDescription

let realmVersion = "v10.32.1"

func buildTargets() -> [Target] {
    let baseURL = "https://github.com/pcpl2/RealmPrebuilt/releases/download/\(realmVersion)"

    #if swift(>=5.7)
    let xcodeVersion = "14.0"
    let realmChecksum = "c1a8e5af6a0b7017319254662c7aaf25db6cc9d6b9ca2ddc057345506896697a"
    let realmSwiftChecksum = "bd891b36ff87e4ac071fe7c17954d8caa90764534431830654d281fecc6ad7a0"
    #elseif swift(>=5.6)
    let xcodeVersion = "13.3.1"
    let realmChecksum = "d8e3c67dec66a3b5659e5ac47cef49c53362fbf729046df4ca5be9d51683a6e9"
    let realmSwiftChecksum = "81d49f98aca63a8a8fd299b100274b2359be8049a3c3fe1b7c8998c72d9398ad"
    #elseif swift(>=5.5.2)
    let xcodeVersion = "13.2.1"
    let realmChecksum = "87f19f7e383b2a2fd5bdfc2d1f22b199f3e0d5f9d2da5c1a173118e6f1035336"
    let realmSwiftChecksum = "6856fc09b1a2786e3ec9b1c3167982378472cfbf60282dbbd4e12e06fa112df5"
    #elseif swift(>=5.5.1)
    let xcodeVersion = "13.1"
    let realmChecksum = "cb3d09e2cf3d71d4618f3b64a4b2d96a9c29800028b2f077b03950e18ef34ad1"
    let realmSwiftChecksum = "af5c01805ac1a648f245bf2e94c23a34628cb523635ba4a47aefe9d6f602aeca"
    #elseif swift(>=5.5)
    let xcodeVersion = "13.0"
    let realmChecksum = "b91b649626ec590e73050fe1dc3c3d8e63c3c5141147f9a2558b1a428f8b05fd"
    let realmSwiftChecksum = "893b1d979d42d79911b0d762e936a6b22058111c967e7a43180ead5125a0f2fe"
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

