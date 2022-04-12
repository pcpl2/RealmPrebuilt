// swift-tools-version:5.3
import PackageDescription

let realmVersion = "v10.25.1"

func buildTargets() -> [Target] {
    let baseURL = "https://github.com/pcpl2/RealmPrebuilt/releases/download/\(realmVersion)"

    if swift(>=5.5.2)
    let xcodeVersion = "13.2"
    let realmChecksum = "edc6a649add0a2b92d66a5a5c12f7f3bbe31c993c2fcb0e3394311528d5a8f67"
    let realmSwiftChecksum = "f02103a140fb296753f919ddb5fe35cdaf9545005ba0982bf0ba472350791ba2"
    #elseif swift(>=5.5.1)
    let xcodeVersion = "13.1"
    let realmChecksum = "83879107dcd1be4676643b1f5f20f3ff932144d4512aff4add05b468f6d613ef"
    let realmSwiftChecksum = "353807529673a8a72670506c0562504420ed317d326f5cb59c7df935e2d6360a"
    #elseif swift(>=5.5)
    let xcodeVersion = "13.0"
    let realmChecksum = "e7eb2fadfb263673b2b4ee6f4092c1c23cc8c47b471dc65d92935e3905db1a98"
    let realmSwiftChecksum = "3f1abaf026c1895d070776ad63a56cc58810b8186a8f391ed11472bbfbd6f0cd"
    #elseif swift(>=5.4.2)
    let xcodeVersion = "12.5.1"
    let realmChecksum = "0ab7e9f0345fd2e2154ee00d3377460354437936f2ef5c6a770b6fddf0feb2ac"
    let realmSwiftChecksum = "afaf2ba53f20e213007a0f01699822c8bbd416a55604fcfd30266519447fe87b"
    #elseif swift(>=5.3.2)
    let xcodeVersion = "12.4"
    let realmChecksum = "cac7f67984bc7cf3f02d5544a9bc88c96c4f67b57c557d3d0a34741276d6a346"
    let realmSwiftChecksum = "ed29a12b7b9385b002875776e796ea1cb24f0f99f23752e6b24862753be90c45"
    #elseif swift(>=5.3.1)
    let xcodeVersion = "12.2"
    let realmChecksum = "cc28b459c47bca7e8b625fafd6e46f188d81372d06e39f3f576bdbc77c0cf35a"
    let realmSwiftChecksum = "21259f7a1fc58fab1869bb05424d66448254b837893746f712194180383d8ad2"
    #elseif swift(>=5.3)
    let xcodeVersion = "12.0.1"
    let realmChecksum = "92877cd47a61ca2de50b93fe6b4a7eefbf66e6b08ae3eef75cd7ade75e8e126f"
    let realmSwiftChecksum = "c9b4da47aeef867bd39ef7f61671bd04e133e25936e98600dda2f54f22e6c9cd"
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

