import SwiftUI
import ComposableArchitecture

public struct ContentView: View {
    
    @Bindable var store: StoreOf<AppRoot>
    
    public var body: some View {
        let scope = $store.scope(state: \.path, action: \.path)
        
        NavigationStack(
            path: scope
        ) {
            EmptyView()
        } destination: { store in
            switch store.case {
            case let .onboarding(store):
                OnboardingView(store: store)
                    .transition(.opacity)
                    .navigationBarBackButtonHidden()
            case let .home(store):
                HomePageView(store: store)
                    .navigationBarBackButtonHidden()
            case let .personalInfo(store):
                OnboardingPersonalizationView(store: store)
                    .navigationBarBackButtonHidden()
            case let .paywall(store):
                PaywallView(store: store)
                    .navigationBarBackButtonHidden()
            case let .spread(store):
                SpreadView(store: store)
                    .navigationBarBackButtonHidden()
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(store: .init(initialState: .init(), reducer: {
            AppRoot()
        }))
    }
}
