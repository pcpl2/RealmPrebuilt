// swift-tools-version:5.3
import PackageDescription

let realmVersion = "v10.30.0"

func buildTargets() -> [Target] {
    let baseURL = "https://github.com/pcpl2/RealmPrebuilt/releases/download/\(realmVersion)"

    #if swift(>=5.7)
    let xcodeVersion = "14.0"
    let realmChecksum = "072381a6dd56d2bd008fa244fd41f1cbf521bff944fe46a6bc2bebbc454e2c87"
    let realmSwiftChecksum = "62dfb095fd5960246cbcfb98260988529c5210803ebe6dbc538b21e2b0d45f0b"
    #elseif swift(>=5.6)
    let xcodeVersion = "13.3.1"
    let realmChecksum = "ade709c6c6e5fff1403fea58327c26025cf46699803301958fb8b22aab1a83f8"
    let realmSwiftChecksum = "c631966f577ff16bd38d935c7a3b1ce43ea20ac1f8b814150204456f5abdcb8a"
    #elseif swift(>=5.5.2)
    let xcodeVersion = "13.2.1"
    let realmChecksum = "2d52d3c6e45ba90669b0974ecb094a12ddd5fd00e9cd242c9f94f6827d4a2998"
    let realmSwiftChecksum = "5c68f49d0e0eb2b3b31e4c8c1e3aaaf8840797ebee2692431a04bb7b4a9ac477"
    #elseif swift(>=5.5.1)
    let xcodeVersion = "13.1"
    let realmChecksum = "0b84fd7a54258620dca1ece269a106e3334f1d36eaf96d517c1035b765ceb0f2"
    let realmSwiftChecksum = "462bf17ac40778655ba0dccf0e644128f85379bd0185233034a56c1a72309012"
    #elseif swift(>=5.5)
    let xcodeVersion = "13.0"
    let realmChecksum = "8d7c014cc829484a8123c32ccd8ed8d067d6a1133acb43554bba639f95c29ecf"
    let realmSwiftChecksum = "5eac27188be09c4d00ba545b375f636a8ec8087dcb3c8d7d928ce823306dbcb1"
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

