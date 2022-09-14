// swift-tools-version:5.3
import PackageDescription

let realmVersion = "v10.29.0"

func buildTargets() -> [Target] {
    let baseURL = "https://github.com/pcpl2/RealmPrebuilt/releases/download/\(realmVersion)"

    #if swift(>=5.7)
    let xcodeVersion = "14.0"
    let realmChecksum = "a51eafc71e5f4bbad7980fc8d08e18697408882592eb56596ef63ad8596501f9"
    let realmSwiftChecksum = "fe9cdbc0ae39e927f30f1f1a3987dca41032656636c764bd158bbebb901525d9"
    #elseif swift(>=5.6)
    let xcodeVersion = "13.3.1"
    let realmChecksum = "34f17a8ba908bb96be1df9820edb575b33ce0e8b261f7a616f20ae26eccfaee7"
    let realmSwiftChecksum = "27034828430331ecb38777e6fda0eaff63fb5a15a51c37680eca71026654c07f"
    #elseif swift(>=5.5.2)
    let xcodeVersion = "13.2.1"
    let realmChecksum = "3787e6be51d9fb481082ca9c23e8314a6c446f58625f9106dd5a410601ce021c"
    let realmSwiftChecksum = "6539aac54eec17f3aeee6413a20c0eb34a6e6c9e34ebc98b69a4de983dc8ad39"
    #elseif swift(>=5.5.1)
    let xcodeVersion = "13.1"
    let realmChecksum = "5d62787ccd78b1be35d71bce61e9359eaa69ff38cb49eacdac1438aa4238506a"
    let realmSwiftChecksum = "990cf63592a26b509f5f974fe77a1ea4af33dea9d9c896cde26aeb5a2abfbf1b"
    #elseif swift(>=5.5)
    let xcodeVersion = "13.0"
    let realmChecksum = "72fda182530458158da576975c838fd63b5d0d5a4dfa55bb67f9f2eb6271ade3"
    let realmSwiftChecksum = "d14df7319aef9eb01f4920e05331f0842524416583bfdf7a48573a09893f0a5c"
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

