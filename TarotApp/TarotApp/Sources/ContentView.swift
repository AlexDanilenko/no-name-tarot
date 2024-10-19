import SwiftUI

public struct ContentView: View {
    public init() {}

    public var body: some View {
        Text(.localizable(.onboarding_get_started))
            .padding()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
