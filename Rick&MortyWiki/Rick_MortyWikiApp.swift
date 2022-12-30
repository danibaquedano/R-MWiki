import SwiftUI

@main
struct Rick_MortyWikiApp: App {
    private let injectionContainer: AppDependencyContainer
    
    init() {
        injectionContainer = AppDependencyContainer()
    }
    
    var body: some Scene {
        WindowGroup {
            injectionContainer.makeLaunchView()
        }
    }
}
