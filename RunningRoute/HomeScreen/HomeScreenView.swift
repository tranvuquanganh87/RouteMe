//
//  HomeScreenView.swift
//  RunningRoute
//
//  Created by Vũ Thị Hương on 24/07/2023.
//

import Foundation

import SwiftUI

// HomeView
struct Home: View{
    @State private var selectedTabState: Tab = .explore
    @State private var searchTerm = ""
    var body: some View{
                NavigationStack{
                    Text("")
                        .font(.title)
                        .fontWeight(.bold)
                        .navigationBarTitle("Route Me",displayMode: .inline)
                    ScrollView{
                        LazyVStack{
                            VStack(alignment: .leading,spacing: 20){
                                // top trail nearby
                                Text("Top Trail NearBy")
                                    .font(.largeTitle)
                                ScrollView(.horizontal){
                                    LazyHStack{
                                        CardLayOutView()
                                        CardLayOutView()
                                            .padding(.horizontal,1)
                                        CardLayOutView()
                                    }
                                }
//                                .background(Color.green)
                                .frame(height: 390)
                                
                                // Invite your friend
                                ZStack{
                                    Image("leaves-background")
                                        .resizable().aspectRatio(contentMode: .fill)
                                    // white gradient overlay
                                    
                                    LinearGradient(
                                        gradient: Gradient(
                                            stops: [
                                                .init(color: .white.opacity(0.7), location: 0.2), // Black at 30% of the gradient
                                                .init(color: .white.opacity(0.7), location: 1.0)  // Transparent at 100% of the gradient
                                            ]
                                        ),
                                        startPoint: .bottom,
                                        endPoint: .top
                                    )
                                    
                                    // HStack for icon
                                    HStack(spacing: 5){
                                        
                                        //icon-leaves
                                        VStack(alignment: .center){
                                            Image("tropical-leaves")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                        }
//                                        .background(Color.yellow)
                                        .frame(width: 100, height : 60)
                                        
                                        // text
                                        VStack{
                                            Text("Invite your fiend")
                                                .font(.title2)
                                                .fontWeight(.bold)
                                            Text("1 friend = 2 trees")
                                                .font(.title2)
                                                .fontWeight(.bold)
                                        }
//                                        .background(Color.yellow)
                                        
                                        // icon arrow- right
                                        VStack{
                                            Image(systemName: "arrow.right")
                                                .scaleEffect(1.4)
                                        }
//                                        .background(Color.yellow)
                                    }
//                                    .background(Color.red)
                                    .frame(width: 350, height:100)
                                    
                                }
                                .frame(width: 350,height: 80)
                                .clipShape(RoundedRectangle(cornerRadius:15))
                                
                                // next scroll view
                                Text("Weekend worthy")
                                    .font(.largeTitle)
                                ScrollView(.horizontal){
                                    LazyHStack{
                                        CardLayOutView()
                                        CardLayOutView()
                                            .padding(.horizontal,1)
                                        CardLayOutView()
                                    }
                                }
//                                .background(Color.green)
                                .frame(height: 390)
                                
                                // next 2 scroll View
                                Text("Top Moderate NearBy")
                                    .font(.largeTitle)
                                ScrollView(.horizontal){
                                    LazyHStack{
                                        CardLayOutView()
                                        CardLayOutView()
                                            .padding(.horizontal,1)
                                        CardLayOutView()
                                    }
                                }
//                                .background(Color.green)
                                .frame(height: 390)
                                
                            }
                            .padding(.leading,15)
//                            .background(Color.red)
                            .frame(alignment: .top)
                            .frame(maxWidth: .infinity, alignment: .topLeading)
                        }
                    }
                    Spacer()
                    CustomFooterView(selectedTab: $selectedTabState)
                }
                .background()
                .searchable(text: $searchTerm,prompt: "Find locations")
                .frame(alignment: .top)
    }
}


struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
