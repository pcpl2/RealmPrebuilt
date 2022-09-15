// swift-tools-version:5.3
import PackageDescription

let realmVersion = "v10.28.5"

func buildTargets() -> [Target] {
    let baseURL = "https://github.com/pcpl2/RealmPrebuilt/releases/download/\(realmVersion)"

    #if swift(>=5.7)
    let xcodeVersion = "14.0"
    let realmChecksum = "506534a3d78a646e8c47aa8ed094077c90a268c7ed2deff81eb3133418acef2e"
    let realmSwiftChecksum = "c2a01616e7ae91bada14e831923437b501a62146fe0dc7960df8b41987904cdf"
    #elseif swift(>=5.6)
    let xcodeVersion = "13.3.1"
    let realmChecksum = "fc72fd549cb18aae214ea6febe17d0c9f73026b90c150168d97a8ecd7539af41"
    let realmSwiftChecksum = "e3e90e9d7ac269f8c4406a472474dd301eda53249ce357099e6582805369df7b"
    #elseif swift(>=5.5.2)
    let xcodeVersion = "13.2.1"
    let realmChecksum = "b7376270fe07d15630a0452ed6f430a510594fca4b5d8820ff072805cad3c01a"
    let realmSwiftChecksum = "76dc25e8323359a86ba65b0154f33682b74d183b7f559ae556c1d4d897ecdaac"
    #elseif swift(>=5.5.1)
    let xcodeVersion = "13.1"
    let realmChecksum = "23ea8a0f1400e5159504b2724d434acdc3f21610f611663b53feff544c3fd9c4"
    let realmSwiftChecksum = "80876b401b59e762781664e0f3abce2ac786229e415016f029da8d030db39062"
    #elseif swift(>=5.5)
    let xcodeVersion = "13.0"
    let realmChecksum = "f4672466d13e107a7796803b4e21a45bd2cdbb4595292b8c9e2d1ee595adb05d"
    let realmSwiftChecksum = "0fa87319bfe2408562bfd1e2e91fbf4c03d72471ed87a7bd8aaad251ebfcac32"
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

