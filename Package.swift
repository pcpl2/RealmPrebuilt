// swift-tools-version:5.3
import PackageDescription

let realmVersion = "v10.32.3"

func buildTargets() -> [Target] {
    let baseURL = "https://github.com/pcpl2/RealmPrebuilt/releases/download/\(realmVersion)"

    #if swift(>=5.7.1)
    let xcodeVersion = "14.1"
    let realmChecksum = "05ef1406ba7eec7a0b63201fc2e63ba2e222512f2e3d0bcc8e2030fa43e9ad25"
    let realmSwiftChecksum = "95907d99254ec18c03b34b572d6c962587bc7b8cd21e2bd72e37cec37a05bb2d"
    #elseif swift(>=5.7)
    let xcodeVersion = "14.0"
    let realmChecksum = "3d6dd1cb7f1a8ca8052d80953c273bc207b7e02d1bef3d5e532afd35def2b3f9"
    let realmSwiftChecksum = "55a971ffd8b5975cda2d95a9d3396b083d3841d0b9c6d0a42c07d080a7deb654"
    #elseif swift(>=5.6)
    let xcodeVersion = "13.3.1"
    let realmChecksum = "c70cba2fa827abe9cbda243bf582711899879372f30a5e0a85335623b3ba4b1a"
    let realmSwiftChecksum = "983565ed034f52837475ced4dc20b3928b10b47a8103fbca3ecf987f8b309aad"
    #elseif swift(>=5.5.2)
    let xcodeVersion = "13.2.1"
    let realmChecksum = "d522f49673aa350b92e058224e2b0a464df88497724d5fa7ddd43860d5766b2f"
    let realmSwiftChecksum = "afa8e8883a3b6bff91b19fa452ce92e2aa26adc515d09c2b598023a681b01c6c"
    #elseif swift(>=5.5.1)
    let xcodeVersion = "13.1"
    let realmChecksum = "cf30db900457ce084367e6f74715d815e3cc412a031ec454f2315fecf153f830"
    let realmSwiftChecksum = "ab944319b26e99535e9e63e2f86b060bd011df71d27efc4c1982250b4be147ef"
    #elseif swift(>=5.5)
    let xcodeVersion = "13.0"
    let realmChecksum = "50bb0df4753a06206782d4e59eeef2242cb1475863a3c340eba8c83a0e2c9e9c"
    let realmSwiftChecksum = "cfe42c3db9cf982ef840cf470a58cbafc6c07b7228404d04be5696b0c2a36d86"
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

