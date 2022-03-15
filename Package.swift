// swift-tools-version:5.3
import PackageDescription

let realmVersion = "v10.24.1"

func buildTargets() -> [Target] {
    let baseURL = "https://github.com/pcpl2/RealmPrebuilt/releases/download/\(realmVersion)"

    #if swift(>=5.5.2)
    let xcodeVersion = "13.2"
    let realmChecksum = "9174cdf9a92f78905d5fdb6bb8891da3771103b95024f0fc1699da1a746b2652"
    let realmSwiftChecksum = "39c2b613202d5c020d2381abd600cf84c307e22710ff29ae3195b8866633dbdb"
    #elseif swift(>=5.5.1)
    let xcodeVersion = "13.1"
    let realmChecksum = "b4ab703cbf97f4ed9a136cd53b0b2d796916bf3845951673fb3311a3fac8b794"
    let realmSwiftChecksum = "5007fc519188b66bf3651e21c819cb0642d5f6f874777209af657f3882253c77"
    #elseif swift(>=5.5)
    let xcodeVersion = "13.0"
    let realmChecksum = "520baa1818773322bb8dc943e032193f5065e4589c383417b5c5e1da3d4ddefa"
    let realmSwiftChecksum = "241906afa635dd11b54394053ee3501013eb18952aeca95ed8127f11dc5763c2"
    #elseif swift(>=5.4.2)
    let xcodeVersion = "12.5.1"
    let realmChecksum = "fd7655d5e9cff39c601aa132661acaedaa2295a11aef11e12f988be9655f7bf5"
    let realmSwiftChecksum = "2c95c23c828ab9025311dd0ffc1d6debe773986ca8a9e0690e79154d6dc31396"
    #elseif swift(>=5.3.2)
    let xcodeVersion = "12.4"
    let realmChecksum = "6a138079e35908d9619b2d2439b81bca3c13b74a08e20129039b741a941b1ee0"
    let realmSwiftChecksum = "13eb6feaa96b795c43a8cf53519e9547485adf70233a451f76240c27ae7d0f15"
    #elseif swift(>=5.3.1)
    let xcodeVersion = "12.2"
    let realmChecksum = "c6a66fb6bab7b93ac3fe964378c748e751407a073dd84e2cf63b97292ab036e7"
    let realmSwiftChecksum = "fe27c04e7a050f234ae612978b40d528e17d6741921b24206965d08dc2ac2026"
    #elseif swift(>=5.3)
    let xcodeVersion = "12.0.1"
    let realmChecksum = "ab122e66319baed6024b35adb19f2724f1ab7ef0fbc9e707ad00ce519356f999"
    let realmSwiftChecksum = "180bcb97f8556be4f021eabf70140d2720d5c0dd41930eb84390819e6da75933"
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

