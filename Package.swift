// swift-tools-version:5.3
import PackageDescription

let realmVersion = "v10.20.1"

func buildTargets() -> [Target] {
    let baseURL = "https://github.com/pcpl2/RealmPrebuilt/releases/download/\(realmVersion)"

    #if swift(>=5.5.2)
    let xcodeVersion = "13.2"
    let realmChecksum = "ee279eba4107013de458a0942366f5c60431e818f4d3f63064ba67dcf74709b1"
    let realmSwiftChecksum = "e7c3278235ad754fc66a70963fa6f042a4101f3abaf62b27f477a1788ee8e74c"
    #elseif swift(>=5.5.1)
    let xcodeVersion = "13.1"
    let realmChecksum = "65984ad1fdfbe5f9c7ef95456467bd721108c10256d9eda4bcc22f54a460d7d9"
    let realmSwiftChecksum = "d70306e7d781c08108240e0f6a87305dcf6add35cb90f3431b1a922499f404a6"
    #elseif swift(>=5.5)
    let xcodeVersion = "13.0"
    let realmChecksum = "0a13e195933cd0f2e0a7554eee03cbfc1ce54978e64bf5e2dc3f8f697b3013e0"
    let realmSwiftChecksum = "e610ce969478f5ad7225b53240aa1c82fc0bd170a5caf2f0723e5a485178cc30"
    #elseif swift(>=5.4.2)
    let xcodeVersion = "12.5.1"
    let realmChecksum = "ee162ab99ca6fd09bb2995c5884c9858c8d8ff4a6236a333fbfb89d49f0353ab"
    let realmSwiftChecksum = "f8956b927dba8c4c0ee87854286bbfab2def554ae97e643d04ddf9c65197b160"
    #elseif swift(>=5.3.2)
    let xcodeVersion = "12.4"
    let realmChecksum = "bc720cfa584695a5c7e0844690306da25b63823fb7512d75de02f24fdeb3765e"
    let realmSwiftChecksum = "f9a24f49f1cd8e0750a2d65a6ca61fdbd48d09ed484d167190bcaff39aebdd72"
    #elseif swift(>=5.3.1)
    let xcodeVersion = "12.2"
    let realmChecksum = "9bcebee94899c828a1b60d31772509a21a1a9df66c2e88fd47294efca740c744"
    let realmSwiftChecksum = "604ddcc057c1addf074d783778bfc317b6b1a12bafe095b636d65bdc7b4f2570"
    #elseif swift(>=5.3)
    let xcodeVersion = "12.0.1"
    let realmChecksum = "1d54671465415e105c3802011d84a1d25b05d1abdc9ab13be9127e30ffb051cc"
    let realmSwiftChecksum = "4bc22cc255bb40ea0202f7a12cdfc15dcb049704bf3a7ff1c9ccdedee6d04a45"
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

