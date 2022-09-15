// swift-tools-version:5.3
import PackageDescription

let realmVersion = "v10.29.0"

func buildTargets() -> [Target] {
    let baseURL = "https://github.com/pcpl2/RealmPrebuilt/releases/download/\(realmVersion)"

    #if swift(>=5.7)
    let xcodeVersion = "14.0"
    let realmChecksum = "3b3e78c31de5a590c97cc96a67cbcf3b2aa44d73ad70a4e6cf56aefb380789a6"
    let realmSwiftChecksum = "95cbf31d30a00bc270024954b9928ed640c1aaf579b698ef628c1d34d5a6bbb2"
    #elseif swift(>=5.6)
    let xcodeVersion = "13.3.1"
    let realmChecksum = "e7589d1d586a8bad26f4f85c13ecb208c9d201160c50377dde49f3ae49c1a560"
    let realmSwiftChecksum = "a2593e60fc116e806dfde863d9835e66d092e963e0bc186a5c819df949cc6a7c"
    #elseif swift(>=5.5.2)
    let xcodeVersion = "13.2.1"
    let realmChecksum = "b79e0cd7e42c5f892aa8ea4ec4eda65b80f052f97366140caf7cd05206e95ad0"
    let realmSwiftChecksum = "9a60734b099a777caa6e3607c08582d712513e624fce5b28a55c737f40b69ed5"
    #elseif swift(>=5.5.1)
    let xcodeVersion = "13.1"
    let realmChecksum = "ebb071b7ae77f642ef303b512c38427f2480ea3136da5629302b5f5a8e6e8e80"
    let realmSwiftChecksum = "d21c9d614b7b361a2fa130b9aa78201ea9cb56f13e72e8f11fe538904c96a547"
    #elseif swift(>=5.5)
    let xcodeVersion = "13.0"
    let realmChecksum = "07f25c85ee66b33174e4a310da9b83c4a739b9af2a731d1c09ce26792f481979"
    let realmSwiftChecksum = "e9fce418c5ee28f2eda64d1323e93aae096b987526264bb03869181d42154bfe"
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

