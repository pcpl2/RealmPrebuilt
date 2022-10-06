// swift-tools-version:5.3
import PackageDescription

let realmVersion = "v10.31.0"

func buildTargets() -> [Target] {
    let baseURL = "https://github.com/pcpl2/RealmPrebuilt/releases/download/\(realmVersion)"

    #if swift(>=5.7)
    let xcodeVersion = "14.0"
    let realmChecksum = "b180aa49d38ed8cf59206e1e1018b3dd640c14ad5a9307263e08daa1ffd36d21"
    let realmSwiftChecksum = "7b2923b761c94113146ccb506b6e6152efed7d795c25316e935424a80cfc1e78"
    #elseif swift(>=5.6)
    let xcodeVersion = "13.3.1"
    let realmChecksum = "48e90a3a28e1b5cf02145b7190b25d87b53bc63aaf7db879169895f8c5beb0ea"
    let realmSwiftChecksum = "c1e1469b0606246c1aa182ef87ac44db8ead8b2752c2ebb83588c68290255cd5"
    #elseif swift(>=5.5.2)
    let xcodeVersion = "13.2.1"
    let realmChecksum = "10b511c30601627a20c8a51741b86afa85e2a4b9aa5d1bdfac7b3c05de43dd57"
    let realmSwiftChecksum = "4d00dca5a8ac482d6346c951d390f4fe0e2b9e24d24a57edb0ba3112e12fdd41"
    #elseif swift(>=5.5.1)
    let xcodeVersion = "13.1"
    let realmChecksum = "267d8a9268a71667b15ffd511dc505a970b07dc2000ec0bc1b2812100606ed15"
    let realmSwiftChecksum = "aede87650360a7c38f7745680c7b9831a0ba4ae0eab4c2aec5e90fa61b918e9b"
    #elseif swift(>=5.5)
    let xcodeVersion = "13.0"
    let realmChecksum = "a31c6656f603a8478698270afbc0b6957357dc1cf036192db90638cb103e77ae"
    let realmSwiftChecksum = "f33c3a40243c34a5ce1dbfa80b3845c0fa637e723572b0e0856956c4d4c2ab51"
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

