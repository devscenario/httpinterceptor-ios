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
.package(url: "https://github.com/devscenario/httpinterceptor-ios.git", from: "0.3.0")
```

Requirements: iOS 13+, Xcode 16.4 or newer.

| Library | What it does |
|---|---|
| `DevScenarioHttpInterceptorAuto` | Linking it is enough. On launch it registers the interceptor for `URLSession.shared` and adds it to every `URLSession` built with a custom configuration. No code needed. |
| `DevScenarioHttpInterceptor` | Manual: register it yourself, e.g. `URLProtocol.registerClass(NetworkLogInterceptor.self)`, or put `NetworkLogInterceptor.self` first in a configuration's `protocolClasses`. |

```swift
import DevScenarioHttpInterceptor

NetworkLogInterceptor.serverHost = "localhost"  // where Dev Scenario listens (default)
NetworkLogInterceptor.serverPort = 8080
```

It runs only in debuggable builds: a simulator build, or a device build signed for development
(`get-task-allow`). In App Store, TestFlight and ad-hoc builds it does nothing unless the app opts in, with
the Info.plist Boolean `DevScenarioInterceptorEnabledInRelease` (works for both libraries) or
`NetworkLogInterceptor.enabledInReleaseBuilds = true` (the manual library; the auto library then needs
`DevScenarioHttpInterceptorAutoBootstrap.install()`).

Headers are sent to Dev Scenario in full. To mask `Authorization`, `Cookie`, `Set-Cookie` and
`Proxy-Authorization` as `[redacted]`, set `NetworkLogInterceptor.redactsHeaders = true` (change the list with
`redactedHeaderNames`); your requests keep the real values.

Server-sent events: to see each event of a `text/event-stream` response live in Dev Scenario, add the
Info.plist Boolean `DevScenarioInterceptorServerSentEvents` (works for both libraries) or set
`NetworkLogInterceptor.serverSentEvents = true`. Off by default.

WebSockets: to see each message of a `URLSessionWebSocketTask` live in Dev Scenario, add the Info.plist
Boolean `DevScenarioInterceptorWebSockets` (auto library), or create the task through the interceptor
(manual library):

```swift
let task = NetworkLogInterceptor.webSocketTask(session: session, url: url)  // or (session:request:)
task.resume()
```

Off by default. Messages you receive are listed when your app reads them; pings are not listed.

Stream mocks: with those switches on, the scripted event-stream and WebSocket mocks you set up in Dev Scenario
are played on the device, with no network. Making a WebSocket task that one of them may match waits for
Dev Scenario's answer (at most about a second); every other socket is made at once. A mocked socket connects
to a server inside your app on `127.0.0.1` that plays the mock, so the task's request shows that URL; it never
answers binary messages.

`WKWebView` traffic is not captured: `URLProtocol` can't see it.

## Version

`0.3.0`. Debug symbols (dSYMs) ship inside the XCFrameworks.
