// swift-tools-version:5.3
import PackageDescription

let realmVersion = "v10.22.0"

func buildTargets() -> [Target] {
    let baseURL = "https://github.com/pcpl2/RealmPrebuilt/releases/download/\(realmVersion)"

    #if swift(>=5.5.2)
    let xcodeVersion = "13.2"
    let realmChecksum = "52214c9c7f0d08674df5fb863bafaf34a3efaa2b13766f7845f2bb230e24e2c5"
    let realmSwiftChecksum = "22cc73e700bf90b9ed64b1389d779a169e2519993483b82bb279d58dc325d268"
    #elseif swift(>=5.5.1)
    let xcodeVersion = "13.1"
    let realmChecksum = "c449fb35ee9e845b47a7f642806cf5af49e99e68b6a7a9663698a0c34cedd27a"
    let realmSwiftChecksum = "9290dcb2d14dd5f3c28f9e7fd206b90858a6a6af0c4d2d2886c58dbbfc6e3ae3"
    #elseif swift(>=5.5)
    let xcodeVersion = "13.0"
    let realmChecksum = "767af1267a799011558104fc7b129572e64a187e2307905119f07ab13d479a81"
    let realmSwiftChecksum = "d1836c8c55949edbbf90c73023bc830259caec8e4eee0252eacec6cf2d7c222d"
    #elseif swift(>=5.4.2)
    let xcodeVersion = "12.5.1"
    let realmChecksum = "9bd118a5dc207302c6d310e0d9903d39bbc9de4e2795b4c1b837436867b22b23"
    let realmSwiftChecksum = "fefe0b33afea38e0e85c6c02ae450aa7c672c043cee597388134e9cd64f3e59d"
    #elseif swift(>=5.3.2)
    let xcodeVersion = "12.4"
    let realmChecksum = "0f8a848a4b15a20e005039df54855e4d94fa1d20282f72ccdbc7016e782d80a3"
    let realmSwiftChecksum = "b97f07b3131e53228ec1355d8712ee524eb3ba3d1f42ac0249ddfffd77c147c7"
    #elseif swift(>=5.3.1)
    let xcodeVersion = "12.2"
    let realmChecksum = "3b4637473ba85ebd533929ce410b7554a96c443e1d7df38eb9b9f7d585fa0cf2"
    let realmSwiftChecksum = "91743512969cc8d6009ac0bf53c95299ca7578b05ddba1e99683ca652e1026d9"
    #elseif swift(>=5.3)
    let xcodeVersion = "12.0.1"
    let realmChecksum = "c5c2a2e09d41b5ac306517a9373ae43758e3cf497474be3e16e348a698750241"
    let realmSwiftChecksum = "c088f4d1c246deb771d8b6500c753d2ac341d36fb4e0806f51881d90bba92c72"
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

