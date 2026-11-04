// swift-tools-version: 5.9
//
// Dev Scenario E2E network interceptor for iOS, distributed as prebuilt binaries.
// Generated at release time; do not edit by hand.
//
// Products:
//   - DevScenarioHttpInterceptor      manual: register the URLProtocol yourself.
//   - DevScenarioHttpInterceptorAuto  auto: linking it is enough; an Obj-C `+load` registers the URLProtocol and
//                                adds it to every URLSession built with a custom configuration.
//
// Both products share one DevScenarioHttpInterceptor framework, so the URLProtocol class exists exactly once.
import PackageDescription

let package = Package(
    name: "DevScenarioHttpInterceptor",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "DevScenarioHttpInterceptor",
            targets: ["DevScenarioHttpInterceptor"]
        ),
        .library(
            name: "DevScenarioHttpInterceptorAuto",
            targets: ["DevScenarioHttpInterceptor", "DevScenarioHttpInterceptorAutoBootstrap"]
        ),
    ],
    targets: [
        .binaryTarget(
            name: "DevScenarioHttpInterceptor",
            url: "https://github.com/devscenario/httpinterceptor-ios/releases/download/1.0.1/DevScenarioHttpInterceptor.xcframework.zip",
            checksum: "479b1a5676007afcb86e70229c1df5d13433f77993e614004bec4ed838347f69"
        ),
        .binaryTarget(
            name: "DevScenarioHttpInterceptorAutoBootstrap",
            url: "https://github.com/devscenario/httpinterceptor-ios/releases/download/1.0.1/DevScenarioHttpInterceptorAutoBootstrap.xcframework.zip",
            checksum: "935aa782d131da43873d28c4db21d1b4f43c2c843e13786286780e7c23d9fb17"
        ),
    ]
)
