// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ride-sync",
    platforms: [
        .iOS(.v16)
    ],
    
    
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(name: "UIExtensions", targets: ["UIExtensions"]),
        .library(name: "Settings",targets: ["Settings"]),
        .library(name: "Statistics",targets: ["Statistics"]),
        .library(name: "App", targets: ["App"]),
        .library(name: "Dashboard", targets: ["Dashboard"]),
        .library(name: "Controls", targets: ["Controls"]),
        .library(name: "Clients", targets: ["Clients"])
    ],
    
    dependencies: [
        .package(url: "https://github.com/pointfreeco/swift-composable-architecture.git", from: "1.0.0"),
        .package(url: "https://github.com/swift-server-community/mqtt-nio.git", from: "2.8.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(name: "UIExtensions", dependencies: []),
        
        .target(
            name: "Clients",
            dependencies: [
                "UIExtensions",
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
                .product(name: "MQTTNIO", package: "mqtt-nio")
            ]),
        .target(
            name: "Controls",
            dependencies: [
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture")
            ]),
        .testTarget(
            name: "ControlsTests",
            dependencies: ["Controls"]),
        
        //Dashboard Target
        .target(
            name: "Dashboard",
            dependencies: [
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture")
            ]),
        
            .testTarget(
                name: "DashboardTests",
                dependencies: ["Dashboard"]),
        
        //App Target
        .target(
            name: "App",
            dependencies: [
                "Statistics",
                "Settings",
                "Dashboard",
                "Controls",
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture")
            ]),
        
        .testTarget(
            name: "AppTests",
            dependencies: ["App"]),
        
        //Settings Target
        .target(
            name: "Settings",
            dependencies: [
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture")
            ]),
        .testTarget(
            name: "SettingsTests",
            dependencies: ["Settings"]),
        
        //Statistics targets
        .target(
            name: "Statistics",
            dependencies: [
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture")
            ]),
        .testTarget(
            name: "StatisticsTests",
            dependencies: ["Statistics"]),
        
    ]
)
