//
//  CustomFooterView.swift
//  RunningRoute
//
//  Created by Vũ Thị Hương on 25/07/2023.
//

import Foundation
import SwiftUI

enum Tab: String, CaseIterable{
    case explore
    case community
    case navigate
    case saved
    case profile
    
}

struct CustomFooterView : View {
    @Binding var selectedTab : Tab
    private var fillImg: String {
        selectedTab.rawValue + ".fill"
    }
    
    var body : some View{
        VStack{
            HStack{
                ForEach(Tab.allCases, id:\.rawValue){ tab in
                    Spacer()
                    if (tab == .explore){
                        Image(systemName: selectedTab == tab ?  "binoculars.fill" : "binoculars")
                            .scaleEffect(tab == selectedTab ? 1.25 : 1)
                            .foregroundColor(tab == selectedTab ? .green : .gray)
                            .font(.system(size: 22))
                            .onTapGesture{
                                withAnimation(.easeIn(duration: 0.1)){
                                    selectedTab = tab
                                }
                            }
                    }
                    else if (tab == .community){
                        Image(systemName: selectedTab == tab ?  "person.2.fill" : "person.2")
                            .scaleEffect(tab == selectedTab ? 1.25 : 1)
                            .foregroundColor(tab == selectedTab ? .green : .gray)
                            .font(.system(size: 22))
                            .onTapGesture{
                                withAnimation(.easeIn(duration: 0.1)){
                                    selectedTab = tab
                                }
                            }
                    }
                    else if (tab == .navigate){
                        Image(systemName: selectedTab == tab ?  "location.fill" : "location")
                            .scaleEffect(tab == selectedTab ? 1.25 : 1)
                            .foregroundColor(tab == selectedTab ? .green : .gray)
                            .font(.system(size: 22))
                            .onTapGesture{
                                withAnimation(.easeIn(duration: 0.1)){
                                    selectedTab = tab
                                }
                            }
                    }
                    else if (tab == .saved){
                        Image(systemName: selectedTab == tab ?  "bookmark.fill" : "bookmark")
                            .scaleEffect(tab == selectedTab ? 1.25 : 1)
                            .foregroundColor(tab == selectedTab ? .green : .gray)
                            .font(.system(size: 22))
                            .onTapGesture{
                                withAnimation(.easeIn(duration: 0.1)){
                                    selectedTab = tab
                                }
                            }
                    }
                    else if (tab == .profile){
                        Image(systemName: selectedTab == tab ?  "person.crop.circle.fill" : "person.crop.circle")
                            .scaleEffect(tab == selectedTab ? 1.25 : 1)
                            .foregroundColor(tab == selectedTab ? .green : .gray)
                            .font(.system(size: 22))
                            .onTapGesture{
                                withAnimation(.easeIn(duration: 0.1)){
                                    selectedTab = tab
                                }
                            }
                    }
                    Spacer()
                }
            }
            .frame(width:nil,height: 60)
            .background(.thinMaterial)
            .cornerRadius(10)
            .padding(10)
            
        }
    }
}

//struct CustomFooterView_Previews : PreviewProvider{
////    @State private var selectedTabState: Tab = .explore
//    static var previews: some View{
//        CustomFooterView(selectedTab: $selectedTabState)
//    }
//}
