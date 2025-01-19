//
//  DailyCardView.swift
//  TarotApp
//
//  Created by Oleksandr Danylenko on 08.12.2024.
//

import SwiftUI
import ComposableArchitecture

struct DailyCardView: View {
    var store: StoreOf<DailyCard>
    
    var body: some View {
        
        WithViewStore(store, observe: { $0 }) { viewStore in
            VStack(alignment: .leading, spacing: 0) {
                switch viewStore.state {
                case .loading:
                    ProgressView()
                        .controlSize(.large)
                        .frame(maxWidth: .infinity, minHeight: 100)
                        .background(.ultraThinMaterial)
                case .loaded(let day):
                    Text(day.card.name)
                        .foregroundStyle(.white)
                        .font(.title2)
                        .bold()
                        .padding(8)
                        .frame(maxWidth: .infinity)
                    
                    Text(day.card.desciption)
                        .foregroundStyle(.secondary)
                        .font(.caption)
                        .padding(16)
                        .frame(maxWidth: .infinity)
                        .background(.ultraThinMaterial)
                }
            }
            .background(background())
            .clipShape(RoundedRectangle(cornerRadius: 25))
            .onAppear {
                withAnimation(.easeInOut(duration: 5)
                    .repeatForever(autoreverses: true)) {
                        animate.toggle()
                    }
            }
        }
    }
    
    
    @State var animate: Bool = false
    
    @ViewBuilder
    func background() -> some View {
        Circle()
            .fill(Color("purple_dark_1"))
            .blur(radius: 10)
            .offset(x:animate ? 10 : 130,y:animate ? 20 : 160)
            .rotation3DEffect(.degrees(animate ? 30 : 0), axis: (x: animate ? 0 : 0.5, y: animate ? 0.2 : 0.7, z: animate ? 0.4 : 0))
        RoundedRectangle(cornerRadius: 10)
            .fill(Color("purple_light_1"))
            .blur(radius: 20)
            .offset(x: animate ? -120 : 10,y :animate ? -100 : 20)
            .rotation3DEffect(.degrees(animate ? 80 : 20), axis: (x: animate ? 0.4 : 0, y: animate ? 0 : 0.1, z: animate ? 0 : 0.5))
        Rectangle()
            .fill(Color("purple_dark_1"))
            .blur(radius: 30)
            .offset(x: animate ? -60 : 20,y: animate ? 5 : 140)
            .rotation3DEffect(.degrees(animate ? 20 : 50), axis: (x: animate ? 0 : 0, y: animate ? 0.4 : 0.2, z: animate ? 0.9 : 0.3))
        Capsule()
            .fill(Color("grape_light_1"))
            .blur(radius: 40)
            .offset(x: animate ? 60 : 0,y: animate ? -10 : 140)
            .rotation3DEffect(.degrees(animate ? -30 : 0), axis: (x: animate ? 0.6 : 0.1, y: animate ? 0.2 : 0.3, z: animate ? 0.1 : 0.4))
        Circle()
            .fill(Color("grape_dark_2"))
            .blur(radius: 50)
            .offset(x: animate ? 90 : -10,y:animate ? -90 : 40)
            .rotation3DEffect(.degrees(animate ? 10 : 0), axis: (x: animate ? 0.4 : 0.6, y: animate ? 0.1 : 0, z: animate ? 0.6 : 0.4))
        RoundedRectangle(cornerRadius: 10)
            .fill(Color("purple_light_1"))
            .blur(radius: 60)
            .offset(x: animate ? -90 : 40,y:animate ? 90 : -20)
            .rotation3DEffect(.degrees(animate ? -20 : 10), axis: (x: animate ? 0 : 0.2, y: animate ? 0 : 0 , z: animate ? 0.4 : 0))
        Capsule()
            .fill(Color("grape_light_1"))
            .blur(radius: 70)
            .offset(x: animate ? 10 : 170 ,y:animate ? 0 : -150)
            .opacity(0.4)
            .rotation3DEffect(.degrees(animate ? 30 : 0), axis: (x: animate ? 0 : 0.1, y: animate ? 0.5 : 0.1, z: animate ? 0.2 : 0.6))
    }
}

#Preview {
    VStack {
        Spacer()
        DailyCardView(
            store: .init(
                initialState: .loaded(
                    DailyCard.State.Day.init(
                        date: Date(),
                        card: DailyCard.State.Day.Card(
                            name: "Солнце",
                            desciption: "Солнце символизирует радость, успех и позитивные изменения в вашей жизни. Этот день принесет вам ясность и вдохновение. Возможно, вы столкнетесь с новыми возможностями, которые позволят вам продвигаться вперед. Используйте эту энергию, чтобы делиться своим счастьем с окружающими и находить радость в мелочах. Проявляйте оптимизм и уверенность в себе!"
                        ),
                        advice: nil
                    )
                ),
                reducer: {
                    DailyCard()
                }
            )
        )
        .padding(16)
        .border(.red)
        Spacer()
    }
    
}
