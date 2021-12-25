// swift-tools-version:5.3
import PackageDescription

let realmVersion = "v10.20.2"

func buildTargets() -> [Target] {
    let baseURL = "https://github.com/pcpl2/RealmPrebuilt/releases/download/\(realmVersion)"

    #if swift(>=5.5.2)
    let xcodeVersion = "13.2"
    let realmChecksum = "83f8bd58cc8f10fe545ec7a6910a66645a902f595c74104c2951fdd17550aa13"
    let realmSwiftChecksum = "b72d8fcd88860b667b87befec3d24cd3bf2a9503c312d6edad99f9269199ee20"
    #elseif swift(>=5.5.1)
    let xcodeVersion = "13.1"
    let realmChecksum = "0c94289c976f03f4828a9088c956624fc1f195bb01dc794d98e582d045357553"
    let realmSwiftChecksum = "dcad6b3c627f72acf6a6ff5cac42a3005b6cbba7f4fda15441d45e94de667653"
    #elseif swift(>=5.5)
    let xcodeVersion = "13.0"
    let realmChecksum = "db5bac797f46b0f386f575ba3971e895088bcec2a69e40c0ce3639715ea1a855"
    let realmSwiftChecksum = "e5bee919a18de8b1fd92bf22e2d907c2a135512e267335aa86fb10f137a3eae7"
    #elseif swift(>=5.4.2)
    let xcodeVersion = "12.5.1"
    let realmChecksum = "5f47404fadecef55c9032d6f6fcab02c43be50fd57f3d25524d9085641542691"
    let realmSwiftChecksum = "241bb22ac6df5b2a62aab685f3147602de993ccbb249627fd47ed1c0e389c6c1"
    #elseif swift(>=5.3.2)
    let xcodeVersion = "12.4"
    let realmChecksum = "a5d05a032bdb18d7c52ee27348ed29f7886339f4228687084b87a590fe2451ee"
    let realmSwiftChecksum = "0c2e773470662959d19d945d65b405d56d50ec2cd00b8ccef943d13b915f90bb"
    #elseif swift(>=5.3.1)
    let xcodeVersion = "12.2"
    let realmChecksum = "afb54ee3a5b64a407a028d6143920591b2786a7e974fe010fc260ba7743239cc"
    let realmSwiftChecksum = "6bb9886fe2599aa447fc0049b8673fa98ae495fccd3214b9b7d26d960a214160"
    #elseif swift(>=5.3)
    let xcodeVersion = "12.0.1"
    let realmChecksum = "b15bc6887fa3b9482cce9df663a6dd186ab4e024447abe09e81541b4bb631f14"
    let realmSwiftChecksum = "0ff261fb2755087b2066ec9c2bb7b92ce591a8d7d6003dc57c7828dcb18de70b"
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

