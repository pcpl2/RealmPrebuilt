// swift-tools-version:5.3
import PackageDescription

let realmVersion = "v10.28.1"

func buildTargets() -> [Target] {
    let baseURL = "https://github.com/pcpl2/RealmPrebuilt/releases/download/\(realmVersion)"

    #if swift(>=5.7)
    let xcodeVersion = "14.0"
    let realmChecksum = "590383b236a987c2877ec519c42d756cce43baef15dbb9737b3cbc61704dccef"
    let realmSwiftChecksum = "0b11f8c595556aa20c382cec0fad17bec57eae77e178309b7242ef172fd244a5"
    #elseif swift(>=5.6)
    let xcodeVersion = "13.3.1"
    let realmChecksum = "d774aa188335fa1ff3b623722ec4c73868b7c6f185133a43438a1bb41d54ee16"
    let realmSwiftChecksum = "4063f675212640c8587ff66e1cd6ce65f8a72267e84a6553dcca1e9fcd17006d"
    #elseif swift(>=5.5.2)
    let xcodeVersion = "13.2.1"
    let realmChecksum = "3e8460041bc6d46fd960386ef4caffd2dcad957c662064212dfc651ce8ec38bd"
    let realmSwiftChecksum = "72b94cd05f6109d2d1e9a780954c981e175ef9701e40fa8ef38a49717b18c091"
    #elseif swift(>=5.5.1)
    let xcodeVersion = "13.1"
    let realmChecksum = "9b17c4ab01c193736800619c756798b7c6051ec5ff3c8cd9b732fdd9a254f59d"
    let realmSwiftChecksum = "d5e45c4fe263aa9fcb6379c971e785df38c849a5b9d1208655c65e3e01364865"
    #elseif swift(>=5.5)
    let xcodeVersion = "13.0"
    let realmChecksum = "d3cbce955d7b8c495ed76b4dfc7b562d8015a8ebf70245a041b926e73fd5f5e6"
    let realmSwiftChecksum = "c9e39643ce17cd4b5a2c4622f680fdc3df638b0ecffcb22b4b27ad1abe164387"
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

