// swift-tools-version:5.3
import PackageDescription

let realmVersion = "v10.28.6"

func buildTargets() -> [Target] {
    let baseURL = "https://github.com/pcpl2/RealmPrebuilt/releases/download/\(realmVersion)"

    #if swift(>=5.7)
    let xcodeVersion = "14.0"
    let realmChecksum = "f97a448392d445b496cd437353a4996d97e164653919d36db8cfbedf5738adc3"
    let realmSwiftChecksum = "0b1e90df338bd161fec087c791c49f739d7f7b7f797348457740ba18376fe9e5"
    #elseif swift(>=5.6)
    let xcodeVersion = "13.3.1"
    let realmChecksum = "51bb688443b55cd7c91ebd5995f4363ade0041f791200a59a52b2cad2ed8bd56"
    let realmSwiftChecksum = "369e811eead6cab1836a8e7a689896cd1812c33df5d63ebaf4faf6afd8ff5086"
    #elseif swift(>=5.5.2)
    let xcodeVersion = "13.2.1"
    let realmChecksum = "cbdca08485da8eac6c7f68d2ba4a46d8df4adabbd079ed6c205a4193dd7e3907"
    let realmSwiftChecksum = "66ce093fa9aa7379ddcc5f46f188ef9c025278689f43176a4c589f54bcdec58b"
    #elseif swift(>=5.5.1)
    let xcodeVersion = "13.1"
    let realmChecksum = "301627762537b665fff5dea3b9967e83e3fac8fb19e190bf20aa751268ab83c7"
    let realmSwiftChecksum = "3c560dd0848eac45f3cf0ab2ce9f62e5b9fb8759d167c46225eebf27547004d0"
    #elseif swift(>=5.5)
    let xcodeVersion = "13.0"
    let realmChecksum = "fe0d56a9ff28c4b69601d079c59ea417d95034abfbebcc72e55b1e57a8c8f3e0"
    let realmSwiftChecksum = "0c7e18838426b98cb0d7dd6782cdf7f0ac2d86103be6f9e112bbe1b6583a30d5"
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

