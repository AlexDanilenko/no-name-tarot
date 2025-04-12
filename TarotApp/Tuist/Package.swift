// swift-tools-version: 5.9.0

@preconcurrency import PackageDescription

#if TUIST
    import struct ProjectDescription.PackageSettings

    let packageSettings = PackageSettings(
        // Customize the product types for specific package product
        // Default is .staticFramework
        // productTypes: ["Alamofire": .framework,]
        productTypes: [:]
    )
#endif

let appPackage = Package(
    name: "TarotApp",
    dependencies: [
        
    ],
    targets: [
        
    ]
)
