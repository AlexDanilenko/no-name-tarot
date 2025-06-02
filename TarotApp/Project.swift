@preconcurrency import ProjectDescription

let project = Project(
    name: "Lunalit",
    packages: [
        .package(
            url: "https://github.com/pointfreeco/swift-composable-architecture",
            .upToNextMajor(from: "1.17.0")
        ),
        .package(
            url: "https://github.com/liamnichols/xcstrings-tool-plugin.git",
            from: "0.1.0"
        ),
        .package(url: "https://github.com/kevinhermawan/swift-llm-chat-openai.git", .upToNextMajor(from: "1.0.0"))
    ],
    targets: [
        .target(
            name: "Lunalit",
            destinations: .iOS,
            product: .app,
            bundleId: "com.odanylenko.Lunalit",
            deploymentTargets: .iOS("17.0"),
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchScreen": [
                        "UIColorName": "",
                        "UIImageName": "",
                    ],
                ]
            ),
            sources: ["TarotApp/Sources/**"],
            resources: ["TarotApp/Resources/**"],
            dependencies: [
                .package(product: "ComposableArchitecture", type: .runtime),
                .package(product: "XCStringsToolPlugin", type: .plugin),
                .package(product: "LLMChatOpenAI", type: .runtime),
            ]
        ),
        .target(
            name: "LunalitTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "com.odanylenko.LunalitTests",
            infoPlist: .default,
            sources: ["TarotApp/Tests/**"],
            resources: [],
            dependencies: [.target(name: "Lunalit")]
        ),
    ],
    schemes: [
        .scheme(
            name: "Lunalit",
            shared: true,
            buildAction: .buildAction(targets: ["Lunalit"]),
            testAction: .targets(["LunalitTests"]),
            runAction: .runAction(configuration: .debug),
            archiveAction: .archiveAction(configuration: .release)
        ),
        .scheme(
            name: "LunalitTests",
            shared: true,
            buildAction: .buildAction(targets: ["Lunalit", "LunalitTests"]),
            testAction: .targets(["LunalitTests"])
        )
    ],
    resourceSynthesizers: [
        .assets()
    ]
)

