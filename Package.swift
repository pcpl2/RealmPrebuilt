import PackageDescription

let realmVersion = "10.20.0"

func buildTargets() -> [Target] {
    let baseURL = "https://github.com/pcpl2/RealmPrebuilt/releases/download/v\(realmVersion)"
    
    let xcodeVersion = "13"
    let realmChecksum = "9200517da6fb77eb9ba99b4158f64c2458aa21d403a2a6b84fcaebb80deb88f6"
    let realmSwiftChecksum = "b1d4be6a3f08f322f066d59963bcfe23f7711122c8e7be674a0c371a2b4cbee7"
    
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
    platforms: [.iOS("13.4")],
    products: [
        .library(
            name: "Realm",
            targets: ["Realm"]),
        .library(
            name: "RealmSwift",
            targets: ["RealmSwift"])
    ],
    targets: buildTargets()
)

