//
//  IntroView.swift
//  RunningRoute
//
//  Created by Anh Tran Vu Quang on 18/07/2023.
//

import Foundation
import SwiftUI

struct IntroView: View {
    //Animation properties
    @State var showWalkThroughScreens : Bool = false
    @State var showAlert : Bool = false
    @State var currentIndex : Int  = 0
    @State var showHomeView : Bool = false
    @ScaledMetric var fontSize: CGFloat = 50
    @ScaledMetric var buttonsize: CGFloat = 50
    var body: some View {
//        NavigationView{
        ZStack{ 
            if (showHomeView) {
                    Home()
                        .transition(.move(edge: .trailing))
            }else {
                ZStack{
                    Color.white.ignoresSafeArea()
                    IntroScreen()
                    WalkThroughScreens()
                    NavBar()
                }
                .animation(.interactiveSpring(response: 1.1, dampingFraction: 0.85,
                                               blendDuration: 0.85), value: showWalkThroughScreens)
                .transition(.move(edge: .leading))
            }
        }
           

//        }
                
    }
    @ViewBuilder
    func WalkThroughScreens() -> some View{
        let isLast = (currentIndex == intros.count)
        GeometryReader{
            let size = $0.size
            
            ZStack{
                // go through the img
                ForEach(intros.indices, id: \.self){ index in
                    ScreenView(size: size, index: index)
                }
                WelcomeView(size: size, index: intros.count)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            // next button
            .overlay(alignment: .bottom) {
                //                Image(systemName: "chevron.right")
                //                    .frame(width: 55, height: 55)
                //                    .foregroundColor(Color.white)
                //                    .background{
                //                        RoundedRectangle(cornerRadius: 30, style: .circular)
                //                            .fill(Color.black)
                //                    }
                // the next button with the the Run button
                ZStack{
                    // button next
                    /*
                    Button(){
//                        if currentIndex == intros.count {
//                            showHomeView = true
//                            print("alo")
//                        }else{
//                            currentIndex+=1
//                            print(currentIndex)
//                        }
                        currentIndex+=1
                        print(currentIndex)
                    }label:{
                        Image(systemName: "chevron.right")
                    }
                     */
                    Image(systemName: "chevron.right")
                    .scaleEffect(!isLast ? 1 : 0.001)
                    .opacity(!isLast ? 1 : 0)
                    // the let's run button with animation
                    HStack{
                        Text("Let's Run")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Image("icons-run")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.white)
                            .padding([.top, .leading, .bottom], 10)
                        //                        Image(systemName: "arrow.right")
                        //                            .foregroundColor(.white)
                        
                    }
                    .padding(.horizontal, 15)
                    .scaleEffect(isLast ? 1 : 0.001)
                    .frame(height : isLast ? nil : 0)
                    .opacity(isLast ? 1 : 0)
                }
                
                .frame(width: isLast ? size.width / 1.5 : 55, height: isLast ? 50 : 55)
                .foregroundColor(Color.white)
                .background{
                    RoundedRectangle(cornerRadius: isLast ? 10 : 30, style: isLast ? .continuous : .circular)
                        .fill(Color.black)
                }
                .onTapGesture {
                    if currentIndex == intros.count{
                        showHomeView = true
                        print(showHomeView)
                    }else{
                        currentIndex+=1
                    }
                   
                }
                .offset(y: isLast ? -40 : -85)
                //animation for the let's run button
                .animation(.interactiveSpring(response: 0.9, dampingFraction: 0.8,
                                              blendDuration: 0.8), value: isLast)
            }
            // we can add the sign in button in here
            .offset(y: showWalkThroughScreens ?  0 : size.height)
            //            .offset(y: size.height)
        }
    }
    
    
    @ViewBuilder
    func ScreenView (size : CGSize, index: Int) -> some View{
        let intro = intros[index]
        VStack(spacing : 10){
            Text(intro.title)
                .font(.largeTitle)
            // Offset for each's screen
                .foregroundColor(Color(red: 0.9882352941176471, green: 0.3137254901960784, blue: 0.027450980392156862))
                .offset(x: -size.height * CGFloat(currentIndex - index))
            // animation
                .animation(.interactiveSpring(response: 0.9, dampingFraction: 0.8,
                                              blendDuration: 0.5).delay(currentIndex == index ? 0.2 : 0).delay(currentIndex == index ? 0.2 : 0), value: currentIndex)
            Text(intro.descrip)
                .font(.subheadline)
                .multilineTextAlignment(.center)
                .padding(.horizontal,30)
                .offset(x: -size.height * CGFloat(currentIndex - index))
            //animatino
                .animation(.interactiveSpring(response: 0.9, dampingFraction: 0.8,
                                              blendDuration: 0.5).delay(0.1).delay(currentIndex == index ? 0.2 : 0), value: currentIndex)
            Image(intro.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 250, alignment: .top)
                .padding(.horizontal, 20)
                .offset(x: -size.height * CGFloat(currentIndex - index))
            //animation
                .animation(.interactiveSpring(response: 0.9, dampingFraction: 0.8,
                                              blendDuration: 0.5).delay(currentIndex == index ? 0 : 0.2).delay(currentIndex == index ? 0.2 : 0), value: currentIndex)
        }
    }
    
    @ViewBuilder
    func WelcomeView (size : CGSize, index: Int) -> some View{
        
        VStack(spacing : 10){
            
            // find a new img for welcome screen
            Text("Welcome")
                .font(.largeTitle)
            // Offset for each's screen
                .foregroundColor(Color(red: 0.9882352941176471, green: 0.3137254901960784, blue: 0.027450980392156862))
                .offset(x: -size.height * CGFloat(currentIndex - index))
            // animation
            
                .animation(.interactiveSpring(response: 0.9, dampingFraction: 0.8,
                                              blendDuration: 0.5).delay(0.1).delay(currentIndex == index ? 0.2 : 0), value: currentIndex)
            Text(welcomeMessage)
                .font(.subheadline)
                .multilineTextAlignment(.center)
                .padding(.horizontal,30)
                .offset(x: -size.height * CGFloat(currentIndex - index))
                .animation(.interactiveSpring(response: 0.9, dampingFraction: 0.8,
                                              blendDuration: 0.5).delay(currentIndex == index ? 0.2 : 0).delay(currentIndex == index ? 0.2 : 0), value: currentIndex)
            //animatino
            
        }
        .offset(y: -30)
    }
    
    @ViewBuilder
    func NavBar() -> some View{
        let isLast = currentIndex == intros.count
        HStack{
            Button{
                if currentIndex > 0 {
                    currentIndex-=1
                }else{
                    showWalkThroughScreens.toggle()
                    print("alo")
                }
            } label:{
                Image(systemName: "chevron.left")
                    .foregroundColor(Color.blue)
            }
            Spacer()
            Button("Skip"){
                currentIndex = intros.count
            }
            .foregroundColor(Color.blue)
            .opacity(isLast ? 0 : 1)
            .animation(.easeOut, value: isLast)
        }
        .padding(.horizontal,15)
        .padding(.top,10)
        .frame(maxHeight: .infinity, alignment: .top)
        .offset(y: showWalkThroughScreens ? 0 : -120)
        //        .offset(y: 0)
    }
    
    @ViewBuilder
    func IntroScreen() -> some View{
        GeometryReader{ geometry in

            ZStack(){
                Spacer()
                // let-begin-img
                Image("let-begin-img")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
                    .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
                
                // black-linear-Gradient overlay
                LinearGradient(
                    gradient: Gradient(
                        stops: [
                            .init(color: .black, location: 0.2), // Black at 30% of the gradient
                            .init(color: .clear, location: 1.0)  // Transparent at 100% of the gradient
                        ]
                    ),
                    startPoint: .bottom,
                    endPoint: .top
                )
                .ignoresSafeArea()
                
                // VStack for app's name / slogan and Button
                VStack{
                    //info button
                    Button() {
                        showAlert.toggle()
                        print("hello")
                    } label:{
                        Image(systemName: "info.circle.fill").resizable().frame(width: 30,height: 30)
                    }
                    .foregroundColor(Color.white)
//                    .offset(x:150, y:90)
                    .padding(.trailing)
                    .alert(isPresented: $showAlert) {
                        Alert(
                            title: Text("Author"),
                            message: Text("Name: Tran Vu Quang Anh \n" +
                                          "sId: S3916566 \n" +
                                          "My Porgram: Route Me")
                        )
                    }
                    .frame(maxWidth: geometry.size.width, minHeight: 55,alignment: .trailing)
                    .padding(.top, 50)
                    
                    Spacer()
                    
                    // VStack for App's Name and Slogan
                    VStack(spacing : 10){
                        
                        Text("Route Me")
                            .font(Font.custom(logoFontNew, size: 50))
                            .foregroundColor(Color(red: 0.9882352941176471, green: 0.3137254901960784, blue: 0.027450980392156862, opacity: 255.0))
                            .padding(.top, 35.0)
                        Text(textScence1)
                            .font(Font.custom(logoFontNew, size: 20))
                            .multilineTextAlignment(.center)
                            .padding(.horizontal,30)
                    }
                    .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
//                    .position(x:3, y: 4)
                    
//                    Spacer()
                    // button let's begin
                    Button() {
                        print(geometry.size.height)
                        showWalkThroughScreens.toggle()
                    } label:{
                        Text("Let's begin")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                    .frame(maxWidth: geometry.size.width, minHeight: 55)
                    .background(Color.accentColor)
                    .tint(.white)
                    .clipShape(RoundedRectangle(cornerRadius:18))
                    .padding()
    
                    //button info
                    /*
                    Button() {
                        showAlert.toggle()
                        print("hello")
                    } label:{
                        Image(systemName: "info.circle.fill").resizable().frame(width: 30,height: 30)
                    }
                    .foregroundColor(Color.white)
                    .offset(x:150, y:90)
                    .alert(isPresented: $showAlert) {
                        Alert(
                            title: Text("Author"),
                            message: Text("Name: Tran Vu Quang Anh \n" +
                                          "sId: S3916566 \n" +
                                          "My Porgram: Route Me")
                        )
                    }
                    */
                }
                .frame(maxWidth: geometry.size.width, maxHeight: geometry.size.height)
                .padding(.bottom, 60.0)
                .foregroundColor(.white)
//                .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
                
                // Button Let's begin
                
            }
            .frame(maxWidth: .infinity, maxHeight : .infinity)
            .offset(y: showWalkThroughScreens ? -geometry.size.height : 0)
        }
        .ignoresSafeArea()
    }
}

struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        IntroView()
    }
}

// HomeView
//struct Home: View{
//    var body: some View{
//        NavigationStack{
//            Text("")
//                .navigationTitle("Home")
//        }
//    }
//}
