// swift-tools-version: 5.9
//
// Dev Scenario E2E network interceptor for iOS, distributed as prebuilt binaries.
// Generated at release time; do not edit by hand.
//
// Products:
//   - DevtoolE2eInterceptor      manual: register the URLProtocol yourself.
//   - DevtoolE2eInterceptorAuto  auto: linking it is enough; an Obj-C `+load` registers the URLProtocol and
//                                adds it to every URLSession built with a custom configuration.
//
// Both products share one DevtoolE2eInterceptor framework, so the URLProtocol class exists exactly once.
import PackageDescription

let package = Package(
    name: "DevtoolE2eInterceptor",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "DevtoolE2eInterceptor",
            targets: ["DevtoolE2eInterceptor"]
        ),
        .library(
            name: "DevtoolE2eInterceptorAuto",
            targets: ["DevtoolE2eInterceptor", "DevtoolE2eInterceptorAutoBootstrap"]
        ),
    ],
    targets: [
        .binaryTarget(
            name: "DevtoolE2eInterceptor",
            url: "https://github.com/devscenario/httpinterceptor-ios/releases/download/0.2.10/DevtoolE2eInterceptor.xcframework.zip",
            checksum: "307c3edc2eecfe6b9a313311b9b9f928dea57948ca6bd3d3c8167df3668d9686"
        ),
        .binaryTarget(
            name: "DevtoolE2eInterceptorAutoBootstrap",
            url: "https://github.com/devscenario/httpinterceptor-ios/releases/download/0.2.10/DevtoolE2eInterceptorAutoBootstrap.xcframework.zip",
            checksum: "2e20410e58fe939cbddb1ae6123cea7706a103f8aac8b9f12c4a0bd3ce442fc2"
        ),
    ]
)
