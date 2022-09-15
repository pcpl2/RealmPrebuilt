// swift-tools-version:5.3
import PackageDescription

let realmVersion = "v10.28.0"

func buildTargets() -> [Target] {
    let baseURL = "https://github.com/pcpl2/RealmPrebuilt/releases/download/\(realmVersion)"

    #if swift(>=5.7)
    let xcodeVersion = "14.0"
    let realmChecksum = "4340bf1bf76ed0b0f6991a3ac8594719e6cb7631ec923d56f93ae1b5c6de9f36"
    let realmSwiftChecksum = "fe78bcabb021fef4070ff75edbb61f7d94308848fa762b0dc889fb49a45727d9"
    #elseif swift(>=5.6)
    let xcodeVersion = "13.3.1"
    let realmChecksum = "02f275a8ee609f4422c4108fa05371c89f71a99ac42227be128308d7cc9fc689"
    let realmSwiftChecksum = "2c9808bc5bbb7a6ba559c47511a6a75dc67ab543dbb4d72c5704d2547ddbb10f"
    #elseif swift(>=5.5.2)
    let xcodeVersion = "13.2.1"
    let realmChecksum = "cdfa72bed65566c9d75c1a0313557c8c90ac9da61d74b5012ee46fc81fafa639"
    let realmSwiftChecksum = "930bb1730832dd295cb1903739fcb8c191ef17750d98eaf41cbf55add71ee4d1"
    #elseif swift(>=5.5.1)
    let xcodeVersion = "13.1"
    let realmChecksum = "69cc8bdc5b421bc9f130cf50088929ba0c95327fba7ed81cddd0e24d88c85b1b"
    let realmSwiftChecksum = "68b83e604886cc4a62a30f0d37e9077a1513d1225f08fa7fd521bc4744c5e7cf"
    #elseif swift(>=5.5)
    let xcodeVersion = "13.0"
    let realmChecksum = "88ebb4e2101ed20987cbcfb1fa5975ec75b1a659953e844f67b91e9472c873f3"
    let realmSwiftChecksum = "eb17456e656d26361f31aec4e3614e600714e3c248dfd4b1c8b1cbe27d172be2"
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

