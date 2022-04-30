// swift-tools-version:5.3
import PackageDescription

let realmVersion = "v10.25.2"

func buildTargets() -> [Target] {
    let baseURL = "https://github.com/pcpl2/RealmPrebuilt/releases/download/\(realmVersion)"

    #if swift(>=5.6)
    let xcodeVersion = "13.3"
    let realmChecksum = "57b7b718bafe7cf6af36b04a32f00587c515fc209be384b5df6af20586b4ea53"
    let realmSwiftChecksum = "281ffced414e60e78851d5c01e02285b878b5f28008e8e1f68382a19df8dd480"
    #elseif swift(>=5.5.2)
    let xcodeVersion = "13.2"
    let realmChecksum = "709d43df0f5661c230c18959bef08e87479b237a4062b407bf188496f7d1f470"
    let realmSwiftChecksum = "9dd0ba583a420b1233be5e22d58ce5f5e9404d01d40ba325bcefb881a6b3bf89"
    #elseif swift(>=5.5.1)
    let xcodeVersion = "13.1"
    let realmChecksum = "4d8319c1ee3bb058fb3884f191198a3d89b9afbdbba954f39fb1d9f8d7d4815a"
    let realmSwiftChecksum = "7524d6925a86d0c85054edcd19861a8b25dcb1c56c0cf9ab986944ee6e65da4f"
    #elseif swift(>=5.5)
    let xcodeVersion = "13.0"
    let realmChecksum = "cbe40b64064e75d7116016fb57f817fe7785855c51e88b00725f1fee30e5650b"
    let realmSwiftChecksum = "232753b69285dd78d96d4b2f646ba9cd66f4478cdaac4bd78d885f8087882837"
    #elseif swift(>=5.4.2)
    let xcodeVersion = "12.5.1"
    let realmChecksum = "a03a0e64dde90e4d23b8ca4a4ef64e07204bbb965ded782ebc0c6b4f49cac230"
    let realmSwiftChecksum = "17b89e590073309b1ec25ccbdde6648e8466dbcb70f6c3cc004ba6bec3c17196"
    #elseif swift(>=5.3.2)
    let xcodeVersion = "12.4"
    let realmChecksum = "a9e0e5f4f566e42f6237adacde37fb507495848b57465a3fb417b922f09fbce4"
    let realmSwiftChecksum = "c0c13560ecd894af8dcb0587e99dcce8ac6f8e04a2fb524192983e92758f6e49"
    #elseif swift(>=5.3.1)
    let xcodeVersion = "12.2"
    let realmChecksum = "7f9348d8a6335e528c6bf82453ab457f1174c165a1ad1712a249e3351269cb46"
    let realmSwiftChecksum = "515164796ad4e8d502a1cda4a4d60ad58fdbfb52fd893beb8e37ae94f66d2da6"
    #elseif swift(>=5.3)
    let xcodeVersion = "12.0.1"
    let realmChecksum = "bb6d4a1dc9a9e77fa8756a1f8cbe7bd900cfd1ba0c46cbaf1564c07aa7f614c9"
    let realmSwiftChecksum = "dbd1095c09a1509d549f387028b2ee8142df6bef150b7e5a11be4c0a98d0d553"
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

