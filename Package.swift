// swift-tools-version:5.3
import PackageDescription

let realmVersion = "v10.21.1"

func buildTargets() -> [Target] {
    let baseURL = "https://github.com/pcpl2/RealmPrebuilt/releases/download/\(realmVersion)"

    #if swift(>=5.5.2)
    let xcodeVersion = "13.2"
    let realmChecksum = "cd43def859d4f22026d268fafad9f0d031994bced4e308a9f6ea9f0768d6997d"
    let realmSwiftChecksum = "796b05ad9128cd2a2bed1027a05e62ade34f7ffb63e81ffb594871ef0043e265"
    #elseif swift(>=5.5.1)
    let xcodeVersion = "13.1"
    let realmChecksum = "b6ca4c8fc65b3d4cb062f8b7a92b9a7c0c78141a4a24dba16e1a388bd7b71887"
    let realmSwiftChecksum = "6e2df778307fd5f0fb89e4bed464b878e5a5178a99fcb481c3ccdd035abfedc4"
    #elseif swift(>=5.5)
    let xcodeVersion = "13.0"
    let realmChecksum = "069e06e2f1f85bc5c0f1c387d40817fd29f5b75ec96a8c62197c0364473311f3"
    let realmSwiftChecksum = "53d6161f88940d626029f7ae4af44f37577c5185b5411b53da59f3e7bccd2ed4"
    #elseif swift(>=5.4.2)
    let xcodeVersion = "12.5.1"
    let realmChecksum = "e3001048e07401d66e5ee67b503ed8d134a4fec2d478b049262fa1c7bdb1fbea"
    let realmSwiftChecksum = "0e92f4647b6b32fb6944676894cb937f909faad02cad61c95b97550a765c5bbe"
    #elseif swift(>=5.3.2)
    let xcodeVersion = "12.4"
    let realmChecksum = "f40c17e49ee0fda206f2ca5d04944ee60cc3ff555299cee15e3f19e3d9537bcf"
    let realmSwiftChecksum = "003fe6d4004ee65b3bee9a56c840cc2ef4276be5a1cc7fbe28dab4e83c5820eb"
    #elseif swift(>=5.3.1)
    let xcodeVersion = "12.2"
    let realmChecksum = "b3077b8c4c62d062baeecfe702ad4a9f6788cf908d0b542ee8922f07cf5ae0d7"
    let realmSwiftChecksum = "14f5a06cdc642ebd36660fe9b282a16548599aab7fc4aee267a27913068786c8"
    #elseif swift(>=5.3)
    let xcodeVersion = "12.0.1"
    let realmChecksum = "e4d5f26495c599bdb44ac0ec195aa36d2673216db6e122d890b40dfb40b3ceed"
    let realmSwiftChecksum = "b2776925c8ded5e27495c0f870edcd16acaed59d945e857188ee1582097d3924"
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

