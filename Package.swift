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
            url: "https://github.com/devscenario/httpinterceptor-ios/releases/download/1.0.3/DevScenarioHttpInterceptor.xcframework.zip",
            checksum: "b739225d2cdf9f6da3ea9e41fabe392b28720f7c028db89c32c348549389cabc"
        ),
        .binaryTarget(
            name: "DevScenarioHttpInterceptorAutoBootstrap",
            url: "https://github.com/devscenario/httpinterceptor-ios/releases/download/1.0.3/DevScenarioHttpInterceptorAutoBootstrap.xcframework.zip",
            checksum: "7dba892f2764bb486b74958ef380bb22aa91e3a6b537e849323478948541b112"
        ),
    ]
)
