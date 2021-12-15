#!/bin/bash

echo "// swift-tools-version:5.3
import PackageDescription

let realmVersion = \"$R_VER\"

func buildTargets() -> [Target] {
    let baseURL = \"https://github.com/pcpl2/RealmPrebuilt/releases/download/\(realmVersion)\"

    #if swift(>=5.5.2)
    let xcodeVersion = \"13.2\"
    let realmChecksum = \"$R_132_SHA\"
    let realmSwiftChecksum = \"$RS_132_SHA\"
    #elseif swift(>=5.5.1)
    let xcodeVersion = \"13.1\"
    let realmChecksum = \"$R_131_SHA\"
    let realmSwiftChecksum = \"$RS_131_SHA\"
    #elseif swift(>=5.5)
    let xcodeVersion = \"13.0\"
    let realmChecksum = \"$R_130_SHA\"
    let realmSwiftChecksum = \"$RS_130_SHA\"
    #elseif swift(>=5.4.2)
    let xcodeVersion = \"12.5.1\"
    let realmChecksum = \"$R_1251_SHA\"
    let realmSwiftChecksum = \"$RS_1251_SHA\"
    #elseif swift(>=5.3.2)
    let xcodeVersion = \"12.4\"
    let realmChecksum = \"$R_124_SHA\"
    let realmSwiftChecksum = \"$RS_124_SHA\"
    #elseif swift(>=5.3.1)
    let xcodeVersion = \"12.2\"
    let realmChecksum = \"$R_122_SHA\"
    let realmSwiftChecksum = \"$RS_122_SHA\"
    #elseif swift(>=5.3)
    let xcodeVersion = \"12.0.1\"
    let realmChecksum = \"$R_1201_SHA\"
    let realmSwiftChecksum = \"$RS_1201_SHA\"
    #endif
    
    return [
        .binaryTarget(
            name: \"Realm\",
            url: \"\(baseURL)/Realm_\(xcodeVersion).xcframework.zip\",
            checksum: realmChecksum
        ),
        .binaryTarget(
            name: \"RealmSwift\",
            url: \"\(baseURL)/RealmSwift_\(xcodeVersion).xcframework.zip\",
            checksum: realmSwiftChecksum
        )
    ]
}

let package = Package(
    name: \"RealmPrebuilt\",
    platforms: [.iOS(\"13.0\")],
    products: [
        .library(
            name: \"Realm\",
            targets: [\"Realm\"]),
        .library(
            name: \"RealmSwift\",
            targets: [\"Realm\", \"RealmSwift\"])
    ],
    targets: buildTargets()
)
" > ./Package.swift
