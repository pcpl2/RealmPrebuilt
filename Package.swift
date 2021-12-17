// swift-tools-version:5.3
import PackageDescription

let realmVersion = "v10.20.1"

func buildTargets() -> [Target] {
    let baseURL = "https://github.com/pcpl2/RealmPrebuilt/releases/download/\(realmVersion)"

    #if swift(>=5.5.2)
    let xcodeVersion = "13.2"
    let realmChecksum = "a2b799af76da7a5126d0b319bd29dc4b9f401465fed8cc744602eb224564cd3e"
    let realmSwiftChecksum = "eb73709ae5cf947011a0152c3b3da368ee8336417f8a887755b526e5758e335a"
    #elseif swift(>=5.5.1)
    let xcodeVersion = "13.1"
    let realmChecksum = "269c3239c540191c178c0e37b41cb31a0a8f9f418bcb6380bb29c19b4a857c60"
    let realmSwiftChecksum = "57e116fb0c2117b3efc3a502a894ed0289acf70ad48546884e53d63b826207f3"
    #elseif swift(>=5.5)
    let xcodeVersion = "13.0"
    let realmChecksum = "cf4540a6097ecc9c76d0b898f6de99e7120226f1dec6215b68c254e2662fa950"
    let realmSwiftChecksum = "f6219a2da7a7fc512cb9e92d0e891bde97f42e1512304eb1fe895ae2996c877f"
    #elseif swift(>=5.4.2)
    let xcodeVersion = "12.5.1"
    let realmChecksum = "e3ab37a9f2f6ce3b2376f35ed2d4459759b78d121b060062e9908a06402a8770"
    let realmSwiftChecksum = "5c22f2afa516d57615aa762ee00854040611614f2323d5f84e0b74496cc1cf5b"
    #elseif swift(>=5.3.2)
    let xcodeVersion = "12.4"
    let realmChecksum = "05a319370f4ffa4beb03c3a839faad7357b1329dd283c0ad75ceb45b08df7977"
    let realmSwiftChecksum = "f8d1b8708a911ab4247c217653f95c3a87b81866780ff6fc8218f4bd05ddac72"
    #elseif swift(>=5.3.1)
    let xcodeVersion = "12.2"
    let realmChecksum = "ed32a78c42734ab461d16b59e367412d0f38002f7a1bd2a5a34bc26c281dd913"
    let realmSwiftChecksum = "d19a970d950ccee5b69111c12ba379619497292e63b891c2311eea9c2994f77e"
    #elseif swift(>=5.3)
    let xcodeVersion = "12.0.1"
    let realmChecksum = "613883faa373923e7af9476a30726304df407952f5b34b6805ca0e746a42ba86"
    let realmSwiftChecksum = "896d460fdb067070a1806b663998b468026e3bc54e6671bf7f8313bd9284acf5"
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

