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
                .onAppear {
                    print("🔴 ContentView root EmptyView appeared")
                }
        } destination: { store in
            switch store.case {
            case let .onboarding(store):
                OnboardingView(store: store)
                    .transition(.opacity)
                    .navigationBarBackButtonHidden()
                    .onAppear {
                        print("🟣 Onboarding appeared")
                    }
            case let .home(store):
                HomePageView(store: store)
                    .navigationBarBackButtonHidden()
                    .onAppear {
                        print("🟢 HomePage appeared in ContentView")
                    }
            case let .personalInfo(store):
                OnboardingPersonalizationView(store: store)
                    .navigationBarBackButtonHidden()
                    .onAppear {
                        print("🟤 PersonalInfo appeared")
                    }
            case let .paywall(store):
                PaywallView(store: store)
                    .navigationBarBackButtonHidden()
                    .onAppear {
                        print("💰 Paywall appeared")
                    }
            case let .spread(store):
                SpreadView(store: store)
            }
        }
        .onAppear {
            print("🔴 ContentView appeared")
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
