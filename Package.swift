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
            url: "https://github.com/devscenario/httpinterceptor-ios/releases/download/1.0.4/DevScenarioHttpInterceptor.xcframework.zip",
            checksum: "e82ffbd0c9d556cfa8b24f45a1355d34a7d8820cc28586a1a0b5394d53845b28"
        ),
        .binaryTarget(
            name: "DevScenarioHttpInterceptorAutoBootstrap",
            url: "https://github.com/devscenario/httpinterceptor-ios/releases/download/1.0.4/DevScenarioHttpInterceptorAutoBootstrap.xcframework.zip",
            checksum: "70537eb59ed4d47d026f9cd7a584af19f4c03169509dc72c458317765b9563e6"
        ),
    ]
)
