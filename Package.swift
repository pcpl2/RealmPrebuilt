// swift-tools-version:5.3
import PackageDescription

let realmVersion = "v10.28.2"

func buildTargets() -> [Target] {
    let baseURL = "https://github.com/pcpl2/RealmPrebuilt/releases/download/\(realmVersion)"

    #if swift(>=5.7)
    let xcodeVersion = "14.0"
    let realmChecksum = "bbd4840bb0c294fe60e25ba5521cfe5290c3678defd810eabf6c15b36edeaa9b"
    let realmSwiftChecksum = "fc2d4f21e8f43d698c839f1209dd4cd8024cc9e2de2222af4162b6fd2ac70889"
    #elseif swift(>=5.6)
    let xcodeVersion = "13.3.1"
    let realmChecksum = "eb4a877d63cabf9209cddaa3215dce34c94da89b0db897307d03bf7291a3b231"
    let realmSwiftChecksum = "e0bab8a43e78cbe294762013b0656ef9bc652836f4d4c29f04a73a18c3336130"
    #elseif swift(>=5.5.2)
    let xcodeVersion = "13.2.1"
    let realmChecksum = "01b32d031a47f1af8e5d2aa1c2d4ccf747f10d02402d60065c424b13b5a20e0e"
    let realmSwiftChecksum = "c602c076811a2feffe7e34a9ab793200973f716abb575d9ac8e6a40895c69fa8"
    #elseif swift(>=5.5.1)
    let xcodeVersion = "13.1"
    let realmChecksum = "3b94835445be4a95f2d1f90ffd089482e5d862a9842904448a391115a3012466"
    let realmSwiftChecksum = "57e1c0885ccbe6e0d94e60e2267841822bb6278bb0b099fcfd05dac6e4b59783"
    #elseif swift(>=5.5)
    let xcodeVersion = "13.0"
    let realmChecksum = "af2939abbb40efb986be2d33edbb62e8e73378a53743ae327045c78e27aee252"
    let realmSwiftChecksum = "89676f0589aae427dbef1ac06bba561b751eab72522a8118a37191b42dcf7785"
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

