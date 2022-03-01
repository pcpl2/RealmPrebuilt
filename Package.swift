// swift-tools-version:5.3
import PackageDescription

let realmVersion = "v10.23.0"

func buildTargets() -> [Target] {
    let baseURL = "https://github.com/pcpl2/RealmPrebuilt/releases/download/\(realmVersion)"

    #if swift(>=5.5.2)
    let xcodeVersion = "13.2"
    let realmChecksum = "954eb9f08316bd562dc81a903b472ca2bc9138beb1d2f7d7e84a3f864deb9291"
    let realmSwiftChecksum = "59e4c9d2e8028acb7b97850417192be553401d0e88e83b51feeb554a6328a63e"
    #elseif swift(>=5.5.1)
    let xcodeVersion = "13.1"
    let realmChecksum = "5c3cdaff9eeb59ba8931ccc9c15c57f5704aa998a643c9e7fcac5b0c86913c04"
    let realmSwiftChecksum = "650a43ac528c5ffbff93791d629d1869f3a5cf505f304a40c5f2a0dd6b4c488b"
    #elseif swift(>=5.5)
    let xcodeVersion = "13.0"
    let realmChecksum = "db24e125da4fad8310a1aba08b48813493c84fc3602769963b0eb1085c56563a"
    let realmSwiftChecksum = "4bbe65c4b8c46a0306e21759d8b71dd7623ea213d6d2da021fee75aef7d0c32d"
    #elseif swift(>=5.4.2)
    let xcodeVersion = "12.5.1"
    let realmChecksum = "9bf129691a84399ede42b2e5977114c998d965a18e3c6d2f107473da566572d0"
    let realmSwiftChecksum = "37b1086816243c2153a8c28fa0f029054aa89490f5059396ecb3226495d6feea"
    #elseif swift(>=5.3.2)
    let xcodeVersion = "12.4"
    let realmChecksum = "2558340abc9567da997561fce43bcb98b5246c2d76c054482be39ffc2d2d2aab"
    let realmSwiftChecksum = "3a96416a2a5cba64ce75c7b94f6af00907469eddbe5b9b6f66e2972d27621066"
    #elseif swift(>=5.3.1)
    let xcodeVersion = "12.2"
    let realmChecksum = "53c519f195e1541cf4374e83a30bacecf9316a920e0aa8525b9614654f775c28"
    let realmSwiftChecksum = "04f7d0fc01df1c31b85e2b87be2d24ec2bebc2f4958ac63481589cfeb9ff6927"
    #elseif swift(>=5.3)
    let xcodeVersion = "12.0.1"
    let realmChecksum = "55e05b4dfbd478631a1e9900b1250014b2a2ad8ad7fa0a66da78c9a57aa005f5"
    let realmSwiftChecksum = "9e99dee78cfbaf069391106c213c98a279f75628a249860994c7f8eb2c167d45"
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

