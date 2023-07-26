//
//  DetailPageView.swift
//  RunningRoute
//
//  Created by Vũ Thị Hương on 25/07/2023.
//

import Foundation

import SwiftUI

struct DetailPageView: View{
    var body: some View{
        
        //responsive
        GeometryReader{ geometry in
            ScrollView{
                LazyVStack{
                    VStack{
                        ZStack{
                            Image("forest-landscape-card")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: geometry.size.width/2,height: geometry.size.height/2)
                        }
                        .frame(alignment: .top)
                        .ignoresSafeArea()
                        HStack{
                            Button{
                                print("alo")
                            } label:{
                                Image(systemName: "chevron.left")
                                    .foregroundColor(Color.white)
                            }
                            .scaleEffect(1.4)
                            Spacer()
                            
                            VStack{
                                Button{
                                    
                                } label:{
                                    Image("white-three-dots")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .foregroundColor(Color.white)
                                    //                .opacity(isLast ? 0 : 1)
                                    //                .animation(.easeOut, value: isLast)
                                }
                            }
                            .frame(height: 30)
                        }
                        .background(Color.black)
                        .padding(.horizontal,15)
                        .padding(.top,10)
                        .frame(maxHeight: .infinity, alignment: .top)
                        
                    }
                }
            }
        }
    }
}

struct DetailPageView_Previews: PreviewProvider {
    static var previews: some View {
        DetailPageView()
    }
}
