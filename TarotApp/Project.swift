@preconcurrency import ProjectDescription

let project = Project(
    name: "TarotApp",
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
            name: "TarotApp",
            destinations: .iOS,
            product: .app,
            bundleId: "io.tuist.TarotApp",
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
            name: "TarotAppTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "io.tuist.TarotAppTests",
            infoPlist: .default,
            sources: ["TarotApp/Tests/**"],
            resources: [],
            dependencies: [.target(name: "TarotApp")]
        ),
    ],
    resourceSynthesizers: [
        .assets()
    ]
)

