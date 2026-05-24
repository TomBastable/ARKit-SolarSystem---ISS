
# ARKit Planet Tracker

Welcome to the ARKit Planet Tracker! This iOS app uses ARKit to provide a real-time augmented reality view of the planets in our solar system and the International Space Station's position.

## Features

- **Real-time Visualization**: See the current position of the planets and the ISS.
- **Augmented Reality**: Experience enhanced AR views combining real-world environments with digital overlays.

## Prerequisites

Before you begin, ensure you have the following installed:
- Xcode 15 or later (the project targets **iOS 17.4** and uses **Swift 5.0**)
- CocoaPods

The project depends on [SwiftAA](https://github.com/onekiloparsec/SwiftAA) for
astronomical calculations; it is pulled in automatically by CocoaPods.

## Getting Started

Follow these steps to get your app up and running:

1. **Clone the repository**:
   ```bash
   git clone https://github.com/TomBastable/ARKit-SolarSystem---ISS.git
   cd ARKit-SolarSystem---ISS
   ```
2. **Install dependencies**:
   ```bash
   pod install
   ```
3. **Open the workspace** (not the `.xcodeproj`):
   ```bash
   open "Knight Sky.xcworkspace"
   ```
4. Build and run on a physical iOS device — ARKit is not supported in the
   Simulator.

## Demo Video

Check out this brief demo of the project in action:
[Watch the Demo Video](https://www.youtube.com/shorts/fZNzSpYLfeo)

## License

Released under the MIT License — see [LICENSE](LICENSE) for the full text.
