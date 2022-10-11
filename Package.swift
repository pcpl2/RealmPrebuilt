// swift-tools-version:5.3
import PackageDescription

let realmVersion = "v10.32.0"

func buildTargets() -> [Target] {
    let baseURL = "https://github.com/pcpl2/RealmPrebuilt/releases/download/\(realmVersion)"

    #if swift(>=5.7)
    let xcodeVersion = "14.0"
    let realmChecksum = "da888fd813b0e82c053672ca037b1ffceef1484513cb29aafb2eb184523eea08"
    let realmSwiftChecksum = "b07eb6ccac488b15919b45be6088d04b24980097baeb3924d42de57f3381566e"
    #elseif swift(>=5.6)
    let xcodeVersion = "13.3.1"
    let realmChecksum = "5eac7788ebfe781c43e2bb72996b1fede8424d3b690c677fd9ef02c86179bd57"
    let realmSwiftChecksum = "7da6f5a4b2fdc99b9730949e62c5499c546d36b05d0220b65daf02f51062eee5"
    #elseif swift(>=5.5.2)
    let xcodeVersion = "13.2.1"
    let realmChecksum = "ad86f5885ba688e5871d619bad8f468ea29611e15f288529ecfa64905567a554"
    let realmSwiftChecksum = "6395a03efdf0666401724bba877fa4b96e2b682e45da58976a7d1c9d262327f7"
    #elseif swift(>=5.5.1)
    let xcodeVersion = "13.1"
    let realmChecksum = "b8ca08dd69cf0acf3754999ec8917586a77702db44810f1b4d22a34dc1e017d3"
    let realmSwiftChecksum = "f672cc35406755985741e3ae386daae957c13a511b608d4adeaef771ae1088bd"
    #elseif swift(>=5.5)
    let xcodeVersion = "13.0"
    let realmChecksum = "45f5a684989ae9f0a295eaaf7cfa4662dbeeeebfe2303f74efbc3381f0806de2"
    let realmSwiftChecksum = "b45e9f330c53da518471a68058e3f78f0acc03dc68543cf93a0bc20139b9bca0"
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

