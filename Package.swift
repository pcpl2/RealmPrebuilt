// swift-tools-version:5.3
import PackageDescription

let realmVersion = "v10.25.2"

func buildTargets() -> [Target] {
    let baseURL = "https://github.com/pcpl2/RealmPrebuilt/releases/download/\(realmVersion)"

    if swift(>=5.5.2)
    let xcodeVersion = "13.2"
    let realmChecksum = "08a8f3536bb4a1d60089c23cc3c8e7065b40fceca197d6d4a2c53e89e113821e"
    let realmSwiftChecksum = "d887a7fe20b4369903a7f45790853ef970c2423d95f6a8ccb571f7b977c9bf6a"
    #elseif swift(>=5.5.1)
    let xcodeVersion = "13.1"
    let realmChecksum = "58827f0922f87b3ad1aae0fa1ee4935b59c90e90dece50d187f2b64fcdb1ee0e"
    let realmSwiftChecksum = "b52e49e7d25ea1771b0314eabe3aab987e9ee7a3c0aa5e2b9da6b4e6b3103038"
    #elseif swift(>=5.5)
    let xcodeVersion = "13.0"
    let realmChecksum = "4d8ba8ee5f0194eb67ac5d501061ca47c3729eef95f168517d3cca955ba6584d"
    let realmSwiftChecksum = "5d7f5ad312b59a523f3c995f914631744068860c28d2d0d64efcb8aae602f6e9"
    #elseif swift(>=5.4.2)
    let xcodeVersion = "12.5.1"
    let realmChecksum = "1491970a1d94e17cfd86975761479c534be137ea48694138106e1f5fe1579e77"
    let realmSwiftChecksum = "0f4d16a1c620cda759fe10927758a7301b27731ad89375f93ea4e26b88567cfe"
    #elseif swift(>=5.3.2)
    let xcodeVersion = "12.4"
    let realmChecksum = "de8636c4bf647bc9b8b63bd5e4dc783331c4ded3d989a723934871984b6b0add"
    let realmSwiftChecksum = "75a1f3eaafb53e7030f4a762a0fc03ea90a2cc56cb983700e27d03fee9884667"
    #elseif swift(>=5.3.1)
    let xcodeVersion = "12.2"
    let realmChecksum = "429a2d927038aa4adeb21540f45d36b567a9ef70dd0ac7653cc2be9c323b7a34"
    let realmSwiftChecksum = "ca97e9eae4ea176074d52f8096f124657567275284934a77c40adf524a840008"
    #elseif swift(>=5.3)
    let xcodeVersion = "12.0.1"
    let realmChecksum = "9a7935c36b0d2cb3122e531fc84dd92001e25963d9f5ab29f385d069a9473d6b"
    let realmSwiftChecksum = "dbbb7d09760398a3dd0ce28f54c78ea367dfae39b5f892e421bea643643ae9fc"
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

