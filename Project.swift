import ProjectDescription

let project = Project(
    name: "ChattingUI",
    targets: [
        .target(
            name: "ChattingUI",
            destinations: .iOS,
            product: .app,
            bundleId: "io.tuist.ChattingUI",
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchStoryboardName": "LaunchScreen.storyboard",
                    "UIApplicationSceneManifest": [
                        "UIApplicationSupportsMultipleScenes": false,
                        "UISceneConfigurations": [
                            "UIWindowSceneSessionRoleApplication": [
                                [
                                    "UISceneConfigurationName": "Default Configuration",
                                    "UISceneDelegateClassName": "$(PRODUCT_MODULE_NAME).SceneDelegate"
                                ]
                            ]
                        ]
                    ]
                ]
            ),
            sources: ["ChattingUI/Sources/**"],
            resources: ["ChattingUI/Resources/**"],
            dependencies: []
        ),
        .target(
            name: "ChattingUITests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "io.tuist.ChattingUITests",
            infoPlist: .default,
            sources: ["ChattingUI/Tests/**"],
            resources: [],
            dependencies: [.target(name: "ChattingUI")]
        ),
    ]
)
