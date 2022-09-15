// swift-tools-version:5.3
import PackageDescription

let realmVersion = "v10.28.3"

func buildTargets() -> [Target] {
    let baseURL = "https://github.com/pcpl2/RealmPrebuilt/releases/download/\(realmVersion)"

    #if swift(>=5.7)
    let xcodeVersion = "14.0"
    let realmChecksum = "33d0005a664131253ad4a450321be346f9eeefab25e26c16d3278d23c41f1f60"
    let realmSwiftChecksum = "a04e4047012181657e22f454ae25c97abf2a052b344c15d489c4485d3dbd7f51"
    #elseif swift(>=5.6)
    let xcodeVersion = "13.3.1"
    let realmChecksum = "88680f72a40d67e8afd6b5ce83c766e77bd693b502c65ef1d677d238bde5d155"
    let realmSwiftChecksum = "f91f9fe6588a529f6d41d7e34978f5beb1e7c3a285694fd3f00f10da0f53aea9"
    #elseif swift(>=5.5.2)
    let xcodeVersion = "13.2.1"
    let realmChecksum = "cdd329e8e55b1995a5cf562f87efb3ce92f6269f9c3c6500c5b40ba42341656d"
    let realmSwiftChecksum = "1896859741f7095d239ffa405887b5796de41be4e95fa9aac8399194f97c2b4e"
    #elseif swift(>=5.5.1)
    let xcodeVersion = "13.1"
    let realmChecksum = "372b335fd22575a9a503831c6114993727dec32a3b56790a589c8b3524d8e842"
    let realmSwiftChecksum = "7dc7ce70d01dbdbdd655f179c3e6fdf3f4483a1d3cb5a44aa999340782850fc1"
    #elseif swift(>=5.5)
    let xcodeVersion = "13.0"
    let realmChecksum = "efc39f596a2cfddb85a23e12274c311b51816dd3567282b87daadb546259922c"
    let realmSwiftChecksum = "168a2c6a9b6d755fe363bc7b099a3f3a7ac55efc06cde05ecef47fbc2269a7fc"
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

