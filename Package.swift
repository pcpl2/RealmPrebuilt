// swift-tools-version:5.3
import PackageDescription

let realmVersion = "v10.20.1"

func buildTargets() -> [Target] {
    let baseURL = "https://github.com/pcpl2/RealmPrebuilt/releases/download/\(realmVersion)"

    #if swift(>=5.5.2)
    let xcodeVersion = "13.2"
    let realmChecksum = "3b658c56bdc67fcae8ed5de7696fc53c4de439dc7cac3f84c1fc07b32d083d57"
    let realmSwiftChecksum = "8d96965e4bd4fe53144073a69ba12b47b27ab91335f2b02e41d72fad3d7725d4"
    #elseif swift(>=5.5.1)
    let xcodeVersion = "13.1"
    let realmChecksum = "d5f10a6990be50e1a02fdbc8e927baaf425c1cd017a314c7407097e60e8237fb"
    let realmSwiftChecksum = "3fc780e35ae1201aadc14cd60fac06be32dbd8a8ab786cf509b50bf7a1d07c99"
    #elseif swift(>=5.5)
    let xcodeVersion = "13.0"
    let realmChecksum = "42e3701666437ec097596073cf902695ec4406b55a2aca1f5a1700e7859ff4be"
    let realmSwiftChecksum = "c8c682af9d6c8babdfd7c8fa991aeb5e63fb0f1b544dcfed156aa5e5964f981b"
    #elseif swift(>=5.4.2)
    let xcodeVersion = "12.5.1"
    let realmChecksum = "a57e30fe92eebda41272b71f2d0f7e84101a873d7dbe6363f21504efc9eb6697"
    let realmSwiftChecksum = "90cc412e1219a6bb00e28135a44d9717eb13a016b08c50fe2d2e85ab06ecce18"
    #elseif swift(>=5.3.2)
    let xcodeVersion = "12.4"
    let realmChecksum = "f9b70aee16d5727dcc1038913f61f2e71b4f264aa90e37056dd1ec8f777c1f58"
    let realmSwiftChecksum = "089ee1238e44f589fd8a0ada8cf6f53e380270a3687a2d26c6eb3a0f91433772"
    #elseif swift(>=5.3.1)
    let xcodeVersion = "12.2"
    let realmChecksum = "903765fb0a48afae0bb4dd6c8365c31ad63b7b0b27f58ee162d2c1fd2b5157af"
    let realmSwiftChecksum = "11ec78badd1b4336e9e5fae26f2449402251254cfbdba34028545226d82c4ced"
    #elseif swift(>=5.3)
    let xcodeVersion = "12.0.1"
    let realmChecksum = "a91d9e47ebbd35a6d1834b83eb90ca70a108252c00a617cce3a3f05710c530d9"
    let realmSwiftChecksum = "931865dde75036f539eee2cb245f2ba2b63392bb8c733770f433ae99a9b81d29"
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

