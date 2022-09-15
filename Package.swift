// swift-tools-version:5.3
import PackageDescription

let realmVersion = "v10.28.4"

func buildTargets() -> [Target] {
    let baseURL = "https://github.com/pcpl2/RealmPrebuilt/releases/download/\(realmVersion)"

    #if swift(>=5.7)
    let xcodeVersion = "14.0"
    let realmChecksum = "564f5d53bd80cf6a4a07fea919d3511f653cdc428d418cf34e53d72f00b4b1ab"
    let realmSwiftChecksum = "e161b5d55d11b7feb5ad3ceba46f9b98749b6bbf7cf5811a6193c5c3b5041798"
    #elseif swift(>=5.6)
    let xcodeVersion = "13.3.1"
    let realmChecksum = "208c8c55e43ee60b433e22ac2f724f1abdfa7abf90d017168294e36d7f5310d9"
    let realmSwiftChecksum = "9855cd3427f5eaec9ff0a88fd379811e0c163c9fff4d2e43f8f2f0ba22ecf524"
    #elseif swift(>=5.5.2)
    let xcodeVersion = "13.2.1"
    let realmChecksum = "f90f4f7a83161aac2c8f2eff149ae1df238d97a8456d4eaf2b23c94ce8539798"
    let realmSwiftChecksum = "20f9365fc8e647c4118b43c1ec9e965b074a744f5751748f9a7cc98e75d66d3d"
    #elseif swift(>=5.5.1)
    let xcodeVersion = "13.1"
    let realmChecksum = "e20980b1187aa41aac988ddb8886035a0136bab437dec2dfe73167f81aebd78e"
    let realmSwiftChecksum = "798276745a1db681977bd6894eac0194647115a7ac56e1444097eb3ad8f6f6f1"
    #elseif swift(>=5.5)
    let xcodeVersion = "13.0"
    let realmChecksum = "47581b9067c8e712b73ec8bec8423eb812e640e5c83ca5e2b7f8f5999416ce2c"
    let realmSwiftChecksum = "ce2000f0624c69f408417740674cfee0731d66d924922a57a1afd58d27e0e99b"
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

