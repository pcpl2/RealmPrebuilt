#!/bin/bash

echo "import PackageDescription

let realmVersion = \"$R_VER\"

func buildTargets() -> [Target] {
    let baseURL = \"https://github.com/pcpl2/RealmPrebuilt/releases/download/\(realmVersion)\"
    
    let xcodeVersion = \"13\"
    let realmChecksum = \"$R_SHA\"
    let realmSwiftChecksum = \"$RS_SHA\"
    
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
    platforms: [.iOS(\"13.4\")],
    products: [
        .library(
            name: \"Realm\",
            targets: [\"Realm\"]),
        .library(
            name: \"RealmSwift\",
            targets: [\"RealmSwift\"])
    ],
    targets: buildTargets()
)
" > ./Package.swift
