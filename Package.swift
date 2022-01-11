// swift-tools-version:5.3
import PackageDescription

let realmVersion = "v10.21.0"

func buildTargets() -> [Target] {
    let baseURL = "https://github.com/pcpl2/RealmPrebuilt/releases/download/\(realmVersion)"

    #if swift(>=5.5.2)
    let xcodeVersion = "13.2"
    let realmChecksum = "21e769cda5a11caf9d6e3a419a29a1f524134cf6bbb1676aca2d33061c7e4be6"
    let realmSwiftChecksum = "9f9506694d505100ea331adf1836c9158252c8f544aad92ee6f9b3b122de423d"
    #elseif swift(>=5.5.1)
    let xcodeVersion = "13.1"
    let realmChecksum = "385115267ae5a295ed157c3b20170ec6da0a814d6fcd72f64ea9ad4a5eb4ba8f"
    let realmSwiftChecksum = "47a51fdeb105edd2b98544d5a644293dc56e77f32949ad01e88032f3b49a5690"
    #elseif swift(>=5.5)
    let xcodeVersion = "13.0"
    let realmChecksum = "520f7e7abd88025843e6eee8231d4e6ea9595d2c50148523556bd432f0fef1ec"
    let realmSwiftChecksum = "338a53df1863744582eecd600d1990b8d0ad9156db6aaaaa8ae5a0c1e2c0b64d"
    #elseif swift(>=5.4.2)
    let xcodeVersion = "12.5.1"
    let realmChecksum = "cc2b057325ea646cc50e4446e26926d71489e6428229c4be7a17f5144b80bbd7"
    let realmSwiftChecksum = "290f1c109f7f545da516142af5a7c9bd2de8c820fcf9477752f1f455383ff89d"
    #elseif swift(>=5.3.2)
    let xcodeVersion = "12.4"
    let realmChecksum = "f9cf1771d5864b1bb147742e392ac384927d22cb23081b535980e919165d4ff6"
    let realmSwiftChecksum = "df3ef40f33582c6bbcf414737298bdfc1636607946796debda2fa4caed1193ce"
    #elseif swift(>=5.3.1)
    let xcodeVersion = "12.2"
    let realmChecksum = "aab67955bce941a2e09daabf1e88e2d0e2cfd0c10bc7c3d64a260af0fe79bd31"
    let realmSwiftChecksum = "14554895ca722e17fd7da572cd4c0fa6225d0ed4287a1fc4d8efdab25f67f9b4"
    #elseif swift(>=5.3)
    let xcodeVersion = "12.0.1"
    let realmChecksum = "56a6a415bd50d1e5ed0c341ced688f48ed2437511812ecb1d251497888ea02ca"
    let realmSwiftChecksum = "75405f72ac9c4af3ab30310348594d18f50e2e00e3ad108b9f1bd81eceb6a038"
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
    platforms: [.iOS("13.0")],
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

