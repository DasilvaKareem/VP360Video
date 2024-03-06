import SwiftUI
import RealityKit
import AVFoundation

@main
struct EnvironmentApp: App {
    @State private var immersionStyle: ImmersionStyle = .full

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct ContentView: View {
    @Environment(\.openImmersiveSpace) private var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) private var dismissImmersiveSpace

    @State private var immersiveSpaceActive: Bool = false

    var body: some View {
        Button(immersiveSpaceActive ? "Exit VideoPlayer" : "Start VideoPlayer") {
            Task {
                if !immersiveSpaceActive {
                    let result = await openImmersiveSpace(id: "VideoPlayer360")
                    immersiveSpaceActive = true
                } else {
                    await dismissImmersiveSpace()
                    immersiveSpaceActive = false
                }
            }
        }
    }
}

struct Video360EntityTestRV: View {
    var body: some View {
        // Your RealityKit view code goes here
        Text("RealityKit View")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
