// swift-tools-version:5.3
import PackageDescription

let realmVersion = "v10.24.2"

func buildTargets() -> [Target] {
    let baseURL = "https://github.com/pcpl2/RealmPrebuilt/releases/download/\(realmVersion)"

    #if swift(>=5.5.2)
    let xcodeVersion = "13.2"
    let realmChecksum = "9ce03bae49f5b4576c0d7b2f27f5a1e76a61730c99e5b28aa7d35654b42b6c00"
    let realmSwiftChecksum = "2eafceb080cc22bd862050d2ffdfe1a2d8c0135523484eca101300aeea638278"
    #elseif swift(>=5.5.1)
    let xcodeVersion = "13.1"
    let realmChecksum = "df568d79cae67afa37efda11c4ea90d6e004933ff1e38ea350ca5b864d9f894d"
    let realmSwiftChecksum = "ec9d5a1486053a59ab8c1a2061562e1f64c2a9731e0952bf3f632f0b6048fd7c"
    #elseif swift(>=5.5)
    let xcodeVersion = "13.0"
    let realmChecksum = "12ff2517f2194c57a6c4f7974a100c589b9f1f5c0199f08661dd84afaa21213a"
    let realmSwiftChecksum = "c1cb3e5030c194cc0901e3fb6d395476b1ca38a9239869e0a9c5a06ce055c7c2"
    #elseif swift(>=5.4.2)
    let xcodeVersion = "12.5.1"
    let realmChecksum = "8369d479595c58d8ceb7d7b0328195a144d5c24a0929496ec83490d5dced96ac"
    let realmSwiftChecksum = "3f5759c3cfd68dc3263ba1d9a8a1eb0256e0463556efb616d59d43b60ff87fa5"
    #elseif swift(>=5.3.2)
    let xcodeVersion = "12.4"
    let realmChecksum = "6f761983cfa262526394e8dd622eb087a179190cee08ec19f15770f2deca92e1"
    let realmSwiftChecksum = "4b4a493e455ba35a8b7cc5f602bf93fee9e185829e40ce2c6f350c48b057c2a5"
    #elseif swift(>=5.3.1)
    let xcodeVersion = "12.2"
    let realmChecksum = "e3ce819927db7cb2d0b73504d5271ba32ade811d2cd7b4f7fecfb3b4c0f5f67f"
    let realmSwiftChecksum = "ed3ff9f10b3aa98a1ca687564c5d2aee4d0fe054c25d8aa90977577530f8da9d"
    #elseif swift(>=5.3)
    let xcodeVersion = "12.0.1"
    let realmChecksum = "a6d45dbab3348e9a1dd9a6237f4f37e1efde673aeb499310cd2faf847b65579c"
    let realmSwiftChecksum = "c1b73aa9f0855baf59120439d06a026522e5dced23b703e740b7c2a39f8a360a"
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

