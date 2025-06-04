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
    settings: .settings(
        base: [:],
        configurations: [
            .debug(
                name: "Debug",
                xcconfig: .relativeToManifest("Configurations/Debug.xcconfig")
            ),
            .release(
                name: "Release Staging",
                xcconfig: .relativeToManifest("Configurations/Release-Staging.xcconfig")
            ),
            .release(
                name: "Release Production",
                xcconfig: .relativeToManifest("Configurations/Release-Production.xcconfig")
            )
        ]
    ),
    targets: [
        .target(
            name: "Lunalit",
            destinations: .iOS,
            product: .app,
            bundleId: "$(PRODUCT_BUNDLE_IDENTIFIER)",
            deploymentTargets: .iOS("17.0"),
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchScreen": [
                        "UIColorName": "",
                        "UIImageName": "",
                    ],
                    "OPENAI_API_KEY": "$(OPENAI_API_KEY)",
                    "API_BASE_URL": "$(API_BASE_URL)",
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
            name: "Lunalit-Debug",
            shared: true,
            buildAction: .buildAction(targets: ["Lunalit"]),
            testAction: .targets(["LunalitTests"]),
            runAction: .runAction(configuration: .debug),
            archiveAction: .archiveAction(configuration: .debug)
        ),
        .scheme(
            name: "Lunalit-Staging",
            shared: true,
            buildAction: .buildAction(targets: ["Lunalit"]),
            testAction: .targets(["LunalitTests"]),
            runAction: .runAction(configuration: .configuration("Release Staging")),
            archiveAction: .archiveAction(configuration: .configuration("Release Staging"))
        ),
        .scheme(
            name: "Lunalit-Production",
            shared: true,
            buildAction: .buildAction(targets: ["Lunalit"]),
            testAction: .targets(["LunalitTests"]),
            runAction: .runAction(configuration: .configuration("Release Production")),
            archiveAction: .archiveAction(configuration: .configuration("Release Production"))
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

