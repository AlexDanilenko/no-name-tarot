import SwiftUI
import ComposableArchitecture

@main
struct TarotAppApp: App {
    
    let store = StoreOf<AppRoot>.init(initialState: .init()) {
        AppRoot()
    }
    var body: some Scene {
        WindowGroup {
            ContentView(store: store)
                .onAppear {
                    store.send(.loaded)
                }
        }
    }
}
