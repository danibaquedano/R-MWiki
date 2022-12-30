import SwiftUI

struct LaunchView<MasterScreen: View>: View {
    
    private let makeMasterScreen: () -> MasterScreen
    @State var firstOpen: Bool = true
    @State var showLaunch: Bool = false
    
    init(makeMasterScreen: @escaping () -> MasterScreen) {
        self.makeMasterScreen = makeMasterScreen
    }
    
    var body: some View {
        ZStack {
            if firstOpen {
                if showLaunch {
                    Color(.white)
                        .ignoresSafeArea()
                    Image("rick")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.accentColor).padding()
                        .transition(.scale(scale: 7).combined(with: .opacity))
                }
            } else {
                makeMasterScreen()
            }
        }.onAppear {
            withAnimation(.easeInOut(duration: 0.5)) {
                showLaunch = true
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        firstOpen = false
                    }
                }
            }
        }
    }
}

