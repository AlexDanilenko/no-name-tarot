import SwiftUI

struct InterestButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.body.bold())
            .foregroundStyle(.white)
            .padding(.vertical, 10)
            .frame(maxWidth: .infinity)
            .background(LunalitAsset.Assets.purpleLight1.swiftUIColor)
            .clipShape(Capsule())
            .opacity(configuration.isPressed ? 0.7 : 1)
    }
}

extension ButtonStyle where Self == InterestButtonStyle {
    static var interestButton: Self { InterestButtonStyle() }
}
