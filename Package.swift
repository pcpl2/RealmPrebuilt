// swift-tools-version:5.3
import PackageDescription

let realmVersion = "v10.24.0"

func buildTargets() -> [Target] {
    let baseURL = "https://github.com/pcpl2/RealmPrebuilt/releases/download/\(realmVersion)"

    #if swift(>=5.5.2)
    let xcodeVersion = "13.2"
    let realmChecksum = "bf12c7636890811f0e7960c5d3b61f276fe1be179ffb1b1dcc3d019e31572e45"
    let realmSwiftChecksum = "f49843de08c8015e8a65707179ae1cc3b5947b44da175ab97e828b1bea035f24"
    #elseif swift(>=5.5.1)
    let xcodeVersion = "13.1"
    let realmChecksum = "62a2dd52175161b5779f3b11d00fae767cbce6ffb350ef5354310c4242d73c56"
    let realmSwiftChecksum = "a1ab411f6558924293f113dfee790ef8c73ab0cecc06d5f74338a4bb049e3a04"
    #elseif swift(>=5.5)
    let xcodeVersion = "13.0"
    let realmChecksum = "9b8160be3e0a4028bded2181a550fa4d4fe2573cb78718b192ef26dca73bdbb0"
    let realmSwiftChecksum = "ad8322391bd0692cb1ca7f67872fac0fe25a0161feb4bd3a871892d61551f59e"
    #elseif swift(>=5.4.2)
    let xcodeVersion = "12.5.1"
    let realmChecksum = "80dcc65fac1caec04cf73c985ddfc839cfc6938d4606d44fdf8002b060e70ab1"
    let realmSwiftChecksum = "d46684f72136c1a1a79ab8c7f0614aec666345b7b2e3297aee08e8c312de4474"
    #elseif swift(>=5.3.2)
    let xcodeVersion = "12.4"
    let realmChecksum = "b15b95d5f2cc281af0bc26c46464af3c861df9bab09c9b349dce2f52d0beb7e9"
    let realmSwiftChecksum = "7b827d5049f58544d55480504f8d65840a9719f8c11c610d29688e7da640c073"
    #elseif swift(>=5.3.1)
    let xcodeVersion = "12.2"
    let realmChecksum = "75a096373e47c6a45d9c3cb75e7f28ecee89a6afe2350a212009437411e06efb"
    let realmSwiftChecksum = "1b0674f86ed46de9bc760262c0255c312a0636dd65735d079bef3e5181b97d32"
    #elseif swift(>=5.3)
    let xcodeVersion = "12.0.1"
    let realmChecksum = "9dc1a519838627555e4d3752e70cee2ceac1e980ea4f0f133224c2e68facd1c3"
    let realmSwiftChecksum = "8397e3ec8fc524e2a31c7ff6e5b7c9d5b80f2738a84d7bdfa726d8f19c020f01"
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

