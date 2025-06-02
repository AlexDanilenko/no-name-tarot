import ProjectDescription

let project = Project(
    name: "TarotApp",
    targets: [
        .target(
            name: "TarotApp",
            destinations: .iOS,
            product: .app,
            bundleId: "com.yourcompany.tarotapp",
            sources: ["TarotApp/Sources/**"],
            resources: ["TarotApp/Resources/**"],
            dependencies: [
                // Add your dependencies here
            ]
        ),
        .target(
            name: "TarotAppTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "com.yourcompany.tarotapp.tests",
            sources: ["TarotApp/Tests/**"],
            dependencies: [
                .target(name: "TarotApp")
            ]
        )
    ]
) 