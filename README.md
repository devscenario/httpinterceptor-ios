# Dev Scenario network interceptor for iOS

Sends your app's `URLSession` traffic to [Dev Scenario](https://github.com/devscenario) for network logs
and mocking during development and E2E runs.

This repository only distributes the SDK: `Package.swift` points at prebuilt XCFrameworks attached to
each [release](https://github.com/devscenario/httpinterceptor-ios/releases). The source is not published here.

## Install

Xcode: **File → Add Package Dependencies…**, enter

```
https://github.com/devscenario/httpinterceptor-ios.git
```

and add **one** of the two libraries to your app target. Or in `Package.swift`:

```swift
.package(url: "https://github.com/devscenario/httpinterceptor-ios.git", from: "0.2.10")
```

Requirements: iOS 13+, Xcode 16.4 or newer.

| Library | What it does |
|---|---|
| `DevtoolE2eInterceptorAuto` | Linking it is enough. On launch it registers the interceptor for `URLSession.shared` and adds it to every `URLSession` built with a custom configuration. No code needed. |
| `DevtoolE2eInterceptor` | Manual: register it yourself, e.g. `URLProtocol.registerClass(NetworkLogInterceptor.self)`, or put `NetworkLogInterceptor.self` first in a configuration's `protocolClasses`. |

```swift
import DevtoolE2eInterceptor

NetworkLogInterceptor.serverHost = "localhost"  // where Dev Scenario listens (default)
NetworkLogInterceptor.serverPort = 8080
```

Meant for debug / E2E builds. `WKWebView` traffic is not captured: `URLProtocol` can't see it.

## Version

`0.2.10`. Debug symbols (dSYMs) ship inside the XCFrameworks.
