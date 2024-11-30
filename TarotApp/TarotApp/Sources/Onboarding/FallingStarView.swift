//
//  FallingStarView.swift
//  TarotApp
//
//  Created by Oleksandr Danylenko on 21.11.2024.
//

import SwiftUI

struct FallingStarView: View {
    struct Star: Equatable {
        let location: CGPoint
        let size: CGFloat
    }

    class SolarSystem {
        var stars = [Star]()
        
        func fill(in size: CGSize) {
            for _ in 0...600 {
                stars.append(
                    Star(
                        location: CGPoint(
                            x: .random(in: -size.height/2...size.height * 1.5),
                            y: .random(in: 0...size.height)
                        ),
                        size: .random(in: 1...3)
                    )
                )
            }
        }
        
    }
    
    @State var system = SolarSystem()
    
    @State var isRotating: Bool = false
    
    var body: some View {
        Canvas { ctx, size in
            for idx in system.stars.indices {
                ctx.drawLayer { starCtx in
                    starCtx.fill(
                        starView(system.stars[idx]),
                        with: .color(
                            .init(hex: 0xC5B4E3)
                        )
                    )
                }
            }
        }
        .frame(width: UIScreen.main.bounds.size.height)
        .rotationEffect(isRotating ? .degrees(360) : .degrees(0))
        .animation(.linear(duration: 60), value: isRotating)
        .background(
            Color.init(hex: 0x221c33)
        )
        .ignoresSafeArea()
        .onAppear(perform: {
            system.fill(in: UIScreen.main.bounds.size)
            isRotating.toggle()
        })
    }
    
    func starView(_ star: Star) -> Path {
        Circle()
            .path(
                in: CGRect(
                    x: star.location.x - 16,
                    y: star.location.y - 16,
                    width: star.size,
                    height: star.size
                )
            )
    }
}

#Preview {
    FallingStarView()
}
