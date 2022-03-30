// swift-tools-version:5.3
import PackageDescription

let realmVersion = "v10.25.0"

func buildTargets() -> [Target] {
    let baseURL = "https://github.com/pcpl2/RealmPrebuilt/releases/download/\(realmVersion)"

    #if swift(>=5.5.2)
    let xcodeVersion = "13.2"
    let realmChecksum = "be06bfb86cb4a9c918a65370a48a400fea6cf9d1ffe3ec0c347972b9a99ac56f"
    let realmSwiftChecksum = "218ba9f428119ddbe6d06fb57b64251270b6f6ef30263bd738f611c2981b5dac"
    #elseif swift(>=5.5.1)
    let xcodeVersion = "13.1"
    let realmChecksum = "d4314b3352abd7a7b23ddb0b0724c82365f4f7a3c4cdfbfbd70520f3278f1811"
    let realmSwiftChecksum = "714e6d4307f6a6d4cdc84cecee2a87f9b9b2a69f71203bf0306d56095f559821"
    #elseif swift(>=5.5)
    let xcodeVersion = "13.0"
    let realmChecksum = "5c08d6c16130b7f474a33195b2e2b04770375fff1b7f63f3c5c9fe69a01250e0"
    let realmSwiftChecksum = "8d06c54e651ad215c96c550b7c5bf28e3f94624d07681d139b1e3b073416aa7a"
    #elseif swift(>=5.4.2)
    let xcodeVersion = "12.5.1"
    let realmChecksum = "671c428b06c8f81a335b5e108debedfbb1f9ce6dbd5d8a760c869849a11ee3fe"
    let realmSwiftChecksum = "7fc51eccf43d2d3fc59d398f1a2b8f48bcdecce80ef819171a576f01d836d030"
    #elseif swift(>=5.3.2)
    let xcodeVersion = "12.4"
    let realmChecksum = "3ef61aa7bcf5015527b76ad5ad666249b25ccf3d82692afc55287b9d11d5a27a"
    let realmSwiftChecksum = "e02f970b1656609541998f5227dd7087ba9cdea5f044b77c76cb79be336cf6df"
    #elseif swift(>=5.3.1)
    let xcodeVersion = "12.2"
    let realmChecksum = "50a508c48869e38b6fd11d7d5dbc8c8e24bed165c9c383ccf2491b0302aa155b"
    let realmSwiftChecksum = "0f981f32cd31cd24b30086932be45cf5751665a56e2ac6bc5b42df682a0bb95a"
    #elseif swift(>=5.3)
    let xcodeVersion = "12.0.1"
    let realmChecksum = "9b1ff13581f634e7d247eb53d125a5eb1d22df71e4a85a30b2e67df79d27f319"
    let realmSwiftChecksum = "a521126e6d6bcae4a77b1288411bc2bfc36ef7b0bc81847182df7bde495fec3f"
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

