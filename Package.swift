// swift-tools-version:5.3
import PackageDescription

let realmVersion = "v10.33.0"

func buildTargets() -> [Target] {
    let baseURL = "https://github.com/pcpl2/RealmPrebuilt/releases/download/\(realmVersion)"

    #if swift(>=5.7.1)
    let xcodeVersion = "14.1"
    let realmChecksum = "290bced1fa11ba95b1716c68bade49953ef325056e3a6621d8ffcfd43d34c9d9"
    let realmSwiftChecksum = "d25f01df1686f21186dfd9f42f078edb03492009b4fb54d6f0cadd2a29272856"
    #elseif swift(>=5.7)
    let xcodeVersion = "14.0"
    let realmChecksum = "53107aecbf91ae8a7835d60f14fb78b2ec7ec4b81429e49b4ae15ef2b26997c4"
    let realmSwiftChecksum = "4da1185da8aa707ea46d3e5ac5909099caa01b6bb3fb4b62730739833dec52ed"
    #elseif swift(>=5.6)
    let xcodeVersion = "13.3.1"
    let realmChecksum = "5292c475cd3e4bc7b04f5aadd0bb240dc57b654477b9b7b581306dbf0473c418"
    let realmSwiftChecksum = "ad5be21fedd0e51ce133b9e4565626126ea8af8209a9548dc14c948b523e7923"
    #elseif swift(>=5.5.2)
    let xcodeVersion = "13.2.1"
    let realmChecksum = "694a2ee645d0a754d3030fa07b0c90ec1d0910f9acaef7a5bf7843f137da90cf"
    let realmSwiftChecksum = "3c3ba4d6dc85296ea9e8aba30c5e6902d07b189d69df8393c214f605edf065a0"
    #elseif swift(>=5.5.1)
    let xcodeVersion = "13.1"
    let realmChecksum = "c3c4d52ce5a9647653303afaf679936e1d1bdfcd1d0a168d004b35bf8293d58d"
    let realmSwiftChecksum = "a7ba51257939de8d3ae77549608762ac747c6d0eac9288d8cdc77937cbb34bda"
    #elseif swift(>=5.5)
    let xcodeVersion = "13.0"
    let realmChecksum = "3dd0c0f67424b969f30d9a79bca58494715233baab25e8ce2eb49d4f47f9352c"
    let realmSwiftChecksum = "ebaf58502eb029a673a28d171c48cc2793685073e75c9d42de31a65517bfb5e1"
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

