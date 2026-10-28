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
            url: "https://github.com/devscenario/httpinterceptor-ios/releases/download/0.3.0/DevScenarioHttpInterceptor.xcframework.zip",
            checksum: "529ca0d4ad9ed98aa87a1cfc5867c7d0378e8c54c7b581248029372757b36080"
        ),
        .binaryTarget(
            name: "DevScenarioHttpInterceptorAutoBootstrap",
            url: "https://github.com/devscenario/httpinterceptor-ios/releases/download/0.3.0/DevScenarioHttpInterceptorAutoBootstrap.xcframework.zip",
            checksum: "e6574b94be6a3970159055e6fab34c4d71d69f2b84e2c346d4f901041d19cd53"
        ),
    ]
)
