// swift-tools-version:5.3
import PackageDescription

let realmVersion = "v10.28.7"

func buildTargets() -> [Target] {
    let baseURL = "https://github.com/pcpl2/RealmPrebuilt/releases/download/\(realmVersion)"

    #if swift(>=5.7)
    let xcodeVersion = "14.0"
    let realmChecksum = "c1040c465909f55a25f7801aebb5b68540a0256f36fa08581d3bcab4e300eb2f"
    let realmSwiftChecksum = "cea64d9e4a6c9b3f951e638ceb66625449857110e483b0c81e3aa11cbca6d1d7"
    #elseif swift(>=5.6)
    let xcodeVersion = "13.3.1"
    let realmChecksum = "36c840c05954225bfabe0a11efbc467bb45db9ceb8490e60418801c64bd9cfee"
    let realmSwiftChecksum = "e07479729237c105c67d4230eba64ae8f3ecef8085186a8933f139fd9c22e938"
    #elseif swift(>=5.5.2)
    let xcodeVersion = "13.2.1"
    let realmChecksum = "d4437d44e10a7d256ddf580348312328395a913e3402d710f51b5ade050b563a"
    let realmSwiftChecksum = "8aa188d5006995cc876484778149cf2d2af9a4411023a9318a1ea3ac6dd17089"
    #elseif swift(>=5.5.1)
    let xcodeVersion = "13.1"
    let realmChecksum = "101cda1d53ef07a640bffbc12a67cbb6b4dc781e475f1e896c1bf7c6ba1d66a7"
    let realmSwiftChecksum = "09bd26852d91bdfcd98b852329f6e27190d22dad9220dc12c38b5b4b4749ce68"
    #elseif swift(>=5.5)
    let xcodeVersion = "13.0"
    let realmChecksum = "e829668df1acd525f91533354a4629d8b4f82c2c6e7e77a356790d85ddead330"
    let realmSwiftChecksum = "d44d23bc3f777105e82bb957ac0af63702c6ca427289b0600188ce2254cabff4"
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

