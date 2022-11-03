// swift-tools-version:5.3
import PackageDescription

let realmVersion = "v10.32.2"

func buildTargets() -> [Target] {
    let baseURL = "https://github.com/pcpl2/RealmPrebuilt/releases/download/\(realmVersion)"

    #if swift(>=5.7)
    let xcodeVersion = "14.0"
    let realmChecksum = "759a23bb7dd078fc45ebffd719353d309cb80789dd508afac74d596b565bc85d"
    let realmSwiftChecksum = "c6d5e699fe5e5a3b4b01ad9c58a5145d00d4815a2dc6804eb0eef2d3e91e32cc"
    #elseif swift(>=5.6)
    let xcodeVersion = "13.3.1"
    let realmChecksum = "0a88ae427a6fc0a558988e8503c91b69b79098c7c885dbfb7540f3d1b97c0793"
    let realmSwiftChecksum = "17362210c507eb311aed45db167909f41da72a39d32c8469abe1cfa4ecb01030"
    #elseif swift(>=5.5.2)
    let xcodeVersion = "13.2.1"
    let realmChecksum = "6a6c4c718393944e34bde77a380d85643a991ab276d81abb6472c68a7e94f7b1"
    let realmSwiftChecksum = "b240e32bd671bde8cfeed79919d5588b81dd79726d136dd8feaabcbf2932f2ef"
    #elseif swift(>=5.5.1)
    let xcodeVersion = "13.1"
    let realmChecksum = "84ce73565967c7ec750a1fe4b5678a34cd91f6c844c0470dd55577e2766a1fe1"
    let realmSwiftChecksum = "deb2d1b2f1eb82febe32b35d44b1fe2a431413e8856c4d6d8cdfb613af8f81b2"
    #elseif swift(>=5.5)
    let xcodeVersion = "13.0"
    let realmChecksum = "d869e54e5a031489b7aedb52e94da39b4fc7de8551ccf187950135ef32bf1fe4"
    let realmSwiftChecksum = "59c4a6fa62b3a12c4a4ddb3e292976f0cbf165520ed65345aeed46d58e4490bf"
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

