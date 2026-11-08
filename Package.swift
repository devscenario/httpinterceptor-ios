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
            url: "https://github.com/devscenario/httpinterceptor-ios/releases/download/1.0.2/DevScenarioHttpInterceptor.xcframework.zip",
            checksum: "6f42070954e19739c0d144d786ef41746f04013d21835a90108e16b6428fad34"
        ),
        .binaryTarget(
            name: "DevScenarioHttpInterceptorAutoBootstrap",
            url: "https://github.com/devscenario/httpinterceptor-ios/releases/download/1.0.2/DevScenarioHttpInterceptorAutoBootstrap.xcframework.zip",
            checksum: "eb2efed2111ba5ce9134bde5b06c71a37f6b0cac2cecfdd72acab1b690c40d0b"
        ),
    ]
)
