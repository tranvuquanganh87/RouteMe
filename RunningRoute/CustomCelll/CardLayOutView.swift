//
//  CardLayOut.swift
//  RunningRoute
//
//  Created by Vũ Thị Hương on 24/07/2023.
//

import Foundation
import SwiftUI


struct CardLayOutView : View{
    var body: some View{
        VStack(alignment: .leading, spacing: 20.0){
            // img section
            ZStack(alignment: .top){
                Image("forest-landscape-card")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .cornerRadius(15)
                Image(systemName: "bookmark")
                    .padding(.leading, 190.0)
                    .padding(.top,15)
                    .scaleEffect(1.5)
                    .onTapGesture {
                        print("alo")
                    }
                    .foregroundColor(.white)
            }
            .frame(width: 345)
            // text section
            VStack(alignment: .leading){
                HStack{
                    Text("Easy")
                    Spacer()
                    HStack{
                        HStack{
                            Image(systemName: "star.fill")
                            Image(systemName: "star.fill")
                            Image(systemName: "star.fill")
                            Image(systemName: "star.fill")
                            Image(systemName: "star.fill")
                        }
                        .foregroundColor(.green)

                        Text("4.1")
                            .fontWeight(.bold)
                        Text("(250)")
                            .fontWeight(.thin)

                    }
                    .font(.body)

                }
                .font(.body )

                Text("Ho Chi Minh City Walk")
                    .font(.largeTitle)
                Text("Quan 1, Ho Chi Minh City, Viet Nam")
                HStack{
                    HStack{
                        Text("Length: 1.3 min")
                        Text(".")
                        Text("Est: 1h4")
                    }
                    Spacer()
                    Image(systemName : "arrow.down.circle")
                }
            }
        }
        .frame(width:345,height: 380)
        .background(Rectangle()
            .foregroundColor(.white))

    }
}
struct CardLayOutView_Previews: PreviewProvider {
    static var previews: some View {
        CardLayOutView()
    }
}
