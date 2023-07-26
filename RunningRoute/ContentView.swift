//
//  ContentView.swift
//  RunningRoute
//
//  Created by Anh Tran Vu Quang on 18/07/2023.
//

import SwiftUI

struct ContentView: View {
    @ScaledMetric var fontSize: CGFloat = 50
    @State private var isAnimating = false
    @State private var selectedTabState: Tab = .explore
    var body: some View {
        CustomFooterView(selectedTab: $selectedTabState)
        
//        GeometryReader { geometry in
//            ZStack {
//                Image("let-begin-img")
//                    .resizable()
//                    .aspectRatio(contentMode: .fill)
//                    .ignoresSafeArea()
//                    .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
//
//                LinearGradient(
//                    gradient: Gradient(
//                        stops: [
//                            .init(color: .black, location: 0.3), // Black at 30% of the gradient
//                            .init(color: .clear, location: 1.0)  // Transparent at 100% of the gradient
//                        ]
//                    ),
//                    startPoint: .bottom,
//                    endPoint: .top
//                )
//                .ignoresSafeArea()
//
//                VStack {
//                    Text("Route Me")
//                        .font(.system(size: fontSize))
//                        .fontWeight(.bold)
//                        .foregroundColor(Color("AccentColor"))
//
//                    Text(textScence1)
//                        .foregroundColor(Color.white)
//
//                    Button("Let's Begin") {
//                        withAnimation(.easeInOut) {
//                            isAnimating.toggle()
//                        }
//                        // Add action for the button here
//                    }
//                    .padding()
//                    .background(Color.black)
//                    .foregroundColor(.white)
//                    .clipShape(Capsule())
//                    .opacity(isAnimating ? 0 : 1)
//                    .scaleEffect(isAnimating ? 0.5 : 1)
//                    .frame(width: 200, height: 60) // Increase button size here
//                }
//                .frame(maxWidth: .infinity, maxHeight: .infinity)
//                .padding()
//                .foregroundColor(.white)
//                .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
//            }
//            .ignoresSafeArea()
//        }
//        .ignoresSafeArea()
//        ZStack {
//            Image("let-begin-img")
//                .resizable()
//                .aspectRatio(contentMode: .fill)
//                .ignoresSafeArea()
//            LinearGradient(
//                gradient: Gradient(
//                    stops: [
//                        .init(color: .black, location: 0.3), // Black at 30% of the gradient
//                        .init(color: .clear, location: 1.0)  // Transparent at 100% of the gradient
//                    ]
//                ),
//                startPoint: .bottom,
//                endPoint: .top
//            )
//            .ignoresSafeArea()
//            VStack(){
//                Text("Route Me")
//                    .font(.system(size : 50))
//                    .fontWeight(.bold)
//                    .foregroundColor(Color("AccentColor"))
//                Text(textScence1)
//                    .foregroundColor(Color.white)
//                Button("let's begin"){
//
//                }
//            }
//            .frame(width: 500.0, height: 500.0)
//
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}




