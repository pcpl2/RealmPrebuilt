// swift-tools-version:5.3
import PackageDescription

let realmVersion = "v10.22.0"

func buildTargets() -> [Target] {
    let baseURL = "https://github.com/pcpl2/RealmPrebuilt/releases/download/\(realmVersion)"

    #if swift(>=5.5.2)
    let xcodeVersion = "13.2"
    let realmChecksum = "af654dc101977555d17843806aa0bab040c2f13950d179777ca9411d587faaf0"
    let realmSwiftChecksum = "161e4a9c2a89d83a7169c87a79ad8726362a3eef3728766ff9e2a9fac704f2f4"
    #elseif swift(>=5.5.1)
    let xcodeVersion = "13.1"
    let realmChecksum = "1188f7eb336319072e05b65ba1329fd2b4e84b3b66f442df367409bbdf78d228"
    let realmSwiftChecksum = "cb8ebe93d9ef696fe58f644c3ba1bf04a2621a0eaeae8ac1de1c7e91d3988b43"
    #elseif swift(>=5.5)
    let xcodeVersion = "13.0"
    let realmChecksum = "8502b99bc694bed28f2f6f4359efcb22ed7635bfc295c6594cc53e6d5b601a5f"
    let realmSwiftChecksum = "99a9fd7a347ac94b12a65043abb38f4e707b3268abc55df069ce9463144f76a7"
    #elseif swift(>=5.4.2)
    let xcodeVersion = "12.5.1"
    let realmChecksum = "51416a1a03fb685a73efd7c675463bac9a4f22bd722ca7f891583bd809f471ee"
    let realmSwiftChecksum = "1096edd57c4182627ab1bda3edb2fcba4cb0124c3bc1cfa9db354baaf4c433dc"
    #elseif swift(>=5.3.2)
    let xcodeVersion = "12.4"
    let realmChecksum = "dc0622a793d006e434ee5c7e2dfe1ae94af04933e0a70b56aeadce5dc27d536e"
    let realmSwiftChecksum = "252b8e3f53a9c7f0c9bc5cfffceb428eba1eb2e1af13507289d463531dac970a"
    #elseif swift(>=5.3.1)
    let xcodeVersion = "12.2"
    let realmChecksum = "cf5782172c02f30767217ac3e61a8980f133e7134fbad23a2b0dbbbd8e55011b"
    let realmSwiftChecksum = "75c24ad1de92083d319e4800bdd134d61bae55e5f74ad30c0e85174b1f3a8645"
    #elseif swift(>=5.3)
    let xcodeVersion = "12.0.1"
    let realmChecksum = "783a3a37e27bed3198e92518943508604d676c93f66f1dfb85ff33beaa5dae2e"
    let realmSwiftChecksum = "db2ef98e581f26cc7da4dc9e4a4afb81165d54726128db21b1d747e56c7e0808"
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

