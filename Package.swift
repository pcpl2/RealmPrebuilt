// swift-tools-version:5.3
import PackageDescription

let realmVersion = "v10.25.0"

func buildTargets() -> [Target] {
    let baseURL = "https://github.com/pcpl2/RealmPrebuilt/releases/download/\(realmVersion)"

    if swift(>=5.5.2)
    let xcodeVersion = "13.2"
    let realmChecksum = "d0a463d6dadad2173c6740f4a56187a5456378ac32384b637e4c15f090143216"
    let realmSwiftChecksum = "14a66fca0a0c45ea82732855d04ee690835c11807256344344d94a3099f58895"
    #elseif swift(>=5.5.1)
    let xcodeVersion = "13.1"
    let realmChecksum = "9ade8f9524d4659b8dac0780e81f700604beb2b696b411961c14e8891c18af73"
    let realmSwiftChecksum = "1cb043a2ce2d4ec526a7982f05e4f1e4127853fd647c90e06d2fae83931327e8"
    #elseif swift(>=5.5)
    let xcodeVersion = "13.0"
    let realmChecksum = "a2cf139e64cb29861f442e1120ddb5861afa385c5c30a7bb784e6d425f432bdb"
    let realmSwiftChecksum = "d3c0fdba1186b889d6e19a7073d96197b5986227a754e89e6d388260b7c5cf3f"
    #elseif swift(>=5.4.2)
    let xcodeVersion = "12.5.1"
    let realmChecksum = "f372cf7b246c182183cab215ec5f347a42e37ed825611d38881f5c76c3b1ee86"
    let realmSwiftChecksum = "296f41f8dece6fba8361df9ce50604346bddc6913911fb01bdb124a0e96100d4"
    #elseif swift(>=5.3.2)
    let xcodeVersion = "12.4"
    let realmChecksum = "5309bac1b7d9ee6fe62afaef952c64394f386bfa64f2371969b31e24b64c9b8f"
    let realmSwiftChecksum = "e5bfcab83cb1c951890bc4a6b6a51cf041f232f701cbd03b25757c1105800146"
    #elseif swift(>=5.3.1)
    let xcodeVersion = "12.2"
    let realmChecksum = "4164cbc4285a4cf55c52487fa49208c970fabbd7081512cd5ae7cf5dee9f1843"
    let realmSwiftChecksum = "759291b39b04f2733dfdfe3c5e159c3a36a33dd496d25829b1a0c88bf0d140a2"
    #elseif swift(>=5.3)
    let xcodeVersion = "12.0.1"
    let realmChecksum = "031066782e45304f7b63995f05bb24f03bc532ebe12f19cbcbee7f8ed31a9182"
    let realmSwiftChecksum = "8d2f4d62a33b42880c8a62d0dd948be3eb11385064e0d6394b56f8067b065f06"
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

