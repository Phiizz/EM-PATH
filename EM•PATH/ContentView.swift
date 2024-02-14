//
//  ContentView.swift
//  EM•PATH
//
//  Created by Nathan Stokes on 12/01/2024.
//

import SwiftUI
import UIKit

extension UIColor {
    func darken(by percentage: CGFloat) -> UIColor {
        var red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0, alpha: CGFloat = 0
        self.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        return UIColor(red: max(red - percentage/100, 0.0),
                       green: max(green - percentage/100, 0.0),
                       blue: max(blue - percentage/100, 0.0),
                       alpha: alpha)
    }
}

extension UIColor {
    static let backgroundColour = UIColor(red: 25/255.0, green: 55/255.0, blue: 69/255.0, alpha: 1.0)
    static let launchColour = UIColor(red: 7/255.0, green: 7/255.0, blue: 36/255.0, alpha: 1.0)
    static let notificationColour = UIColor(red: 145/255.0, green: 145/255.0, blue: 145/255.0, alpha: 1).darken(by: 35)
}

extension Color {
    static let backgroundColour = Color(UIColor.backgroundColour)
    static let launchColour = Color(UIColor.launchColour)
    static let notificationColour = Color(UIColor.notificationColour)
}

struct LaunchingView: View {
    var body: some View {
        ZStack {
            Color.launchColour
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            Image("LaunchAppIcon")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .background(Color.launchColour)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        }
    }
}

struct ContentView: View {
    @State private var showLaunchScreen = true
    @State private var isBlueScreen = false
    @State private var displayNotification = false
    @State private var navigateToOffer = false
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ZStack {
                    LinearGradient(gradient: Gradient(colors: [Color(red: 0, green: 0.541, blue: 0.706), Color(red: 0, green: 0.541, blue: 0.706)]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/)
                        .frame(width: 390, height: 227)
                        .position(x: 195, y: 277.4)
                    
                    ScrollView {
                        VStack (spacing: 5){
                            
                            VStack(spacing: 8) {
                                Text("CONGRATULATIONS")
                                    .font(.custom("Arial-BoldMT", size: 18))
                                    .foregroundColor(.white)
                                    .frame(width: 196.66, height: 21)
                                    .padding(.top, 70.13)
                                
                                Text("YOUR NEW PROFILE IS NOW LIVE!")
                                    .font(.custom("ArialMT", size: 16))
                                    .foregroundColor(Color(red: 0.561, green: 0.604, blue: 0.682))
                                    .frame(width: 280, height: 21)
                            }
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
                            .background(Color.backgroundColour)
                            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                            
                            ZStack {
                                Image("profileBorder")
                                    .resizable()
                                    .scaledToFill()
                                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                    .frame(width: 393, height: 200)
                                    .padding(.bottom, 250)
                                
                                Image("profilePicture")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 165, height: 164)
                                    .clipShape(Circle())
                                    .overlay(Circle().stroke(Color(red: 0, green: 0.541, blue: 0.706), lineWidth: 2))
                                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
                                    .offset(x: -2)
                                    .background(Color.clear)
                            }
                            .padding(.top, 40)
                            .padding(.bottom, -120)
                            
                            Text("Josie, 24")
                                .font(.custom("Arial-Bold", size: 18))
                                .foregroundStyle(Color.white)
                            
                            Text("Barista")
                                .font(.custom("Arial-Regular", size: 13))
                                .foregroundStyle(Color(red: 0.561, green: 0.604, blue: 0.682))
                                .lineSpacing(-2.62)
                            
                            HStack(spacing: 2) {
                                Image(systemName: "mappin.and.ellipse")
                                    .foregroundColor(.green)
                                Text("London")
                                    .font(.custom("Arial-Regular", size: 12))
                                    .foregroundStyle(Color(red: 0.561, green: 0.604, blue: 0.682))
                            }
                            
                            Text("Uni student currently working, studying, and working some more. Looking for a way to cover care bills for my mum. Currently a barista at Luna Brew Coffee, so hit me up if you ever want a proper coffee ☕🌔. Vegan (cows are so cute! 🐮🌱). Don't often have time for hobbies but when I do I love to read and explore local cafes. I like to keep fit by hiking (when I can get out of London) and love a good boogie too ✌")
                                .font(.custom("Arial-Regular", size: 13))
                                .foregroundStyle(Color.white)
                                .frame(width: 342, height: 134)
                                .multilineTextAlignment(.center)
                            
                            Spacer()
                                .frame(height: 20)
                            
                            Rectangle()
                                .fill(Color.white.opacity(0.2))
                                .frame(width: 342, height: 0.5)
                            
                            Spacer()
                                .frame(height: 180)
                            
                            Text("No offers just yet")
                                .font(.custom("Arial-Regular", size: 22))
                                .foregroundStyle(Color.white.opacity(0.6))
                                .frame(width: 170, height: 15)
                                .lineSpacing(-6.33)
                            
                            Spacer()
                                .frame(height: 180)
                        }
                    }
                    
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    .background(Color.backgroundColour)
                    
                    .fullScreenCover(isPresented: $showLaunchScreen, content: LaunchingView.init)
                    .onAppear{
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { 
                            self.showLaunchScreen = false
                        }
                    }
                    
                    if isBlueScreen {
                        Rectangle()
                            .foregroundStyle(Color.cyan)
                            .opacity(1)
                            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                            .transition(.opacity)
                            .zIndex(/*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                            .onAppear {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                    withAnimation {
                                        isBlueScreen = false
                                    }
                                }
                            }
                    }
                    
                    Button(action: {
                        withAnimation {
                            isBlueScreen = true
                        }
                    }) {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(height: geometry.size.height * 0.3)
                    }
                    .position(x: geometry.size.width / 2, y: geometry.size.height * 0.90)
                    
                    Button(action: {
                        if displayNotification {
                            navigateToOffer = true
                        } else {
                            withAnimation {
                                displayNotification = true
                                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                                }
                            }
                        }
                    }) {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(height: geometry.size.height * 0.9)
                    }
                    
                    .position(x: geometry.size.width / 2, y: geometry.size.height * 0.3)
                    
                    if displayNotification {
                        NotificationView(notificationType: .newOffer)
                            .offset(y: -338)
                            .transition(.move(edge: .top))
                            .zIndex(2)
                            .edgesIgnoringSafeArea(.top)
                            .allowsHitTesting(/*@START_MENU_TOKEN@*/false/*@END_MENU_TOKEN@*/)
                    }
                }
            }
            .sheet(isPresented: $navigateToOffer) {
                OfferPage()
            }
        }
    }
}

struct NotificationView: View {
    var notificationType: NotificationType
    
    var body: some View {
        HStack {
            Image("AppIconImage")
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .cornerRadius(11)
                .padding()
            
            VStack(alignment: .leading) {
                Text("EM•PATH")
                    .font(.custom("DMSans-Regular", size: 15))
                    .foregroundColor(.white)
                    .frame(maxWidth: 250, alignment: .leading)
                    .kerning(-0.4)
                    .lineSpacing(1)
                
                if notificationType == .moneyReceived {
                    Text("£2500 has been added to your account")
                        .font(.custom("DMSans-Regular", size: 14))
                        .foregroundColor(.white)
                        .frame(width: 250, alignment: .leading)
                        .kerning(-0.4)
                        .lineSpacing(2)
                        .background(Color.clear)
                } else {
                    Text("You have a new offer from Lawrence!")
                        .font(.custom("DMSans-Regular", size: 14))
                        .foregroundColor(.white)
                        .frame(width: 250, alignment: .leading)
                        .kerning(-0.4)
                        .lineSpacing(2)
                        .background(Color.clear)
                }
            }
            
            Spacer()
        }
        .background(Color.notificationColour)
        .cornerRadius(16)
        .frame(width: 380, height: 66)
    }
}

struct OfferPage: View {
    @State private var showLoadingView = false
    
    @State private var date: String = ""
    @State private var time: String = ""
    @State private var notificationType: NotificationType = .moneyReceived
    @State private var cashAmount: String = ""
    @State private var timeAmount: String = ""
    
    @State private var isSubmitted = false
    @State private var pushNotificationDataSubmit = false
    @State private var scrollID = UUID()
    @FocusState private var focusedField: FocusableField?
    
    var body: some View {
        ScrollViewReader{ scrollProxy in
            ScrollView {
                VStack (spacing: 0){
                    Color.clear.frame(height: 0).id(scrollID)
                    
                    ZStack {
                        Image("offerProfileBorder")
                            .resizable()
                            .scaledToFill()
                            .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                            .frame(width: 393, height: 200)
                            .padding(.bottom, 250)
                        
                        Image("offerProfilePicture")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 165, height: 164)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.green, lineWidth: 2))
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
                            .offset(x: -2)
                            .background(Color.clear)
                    }
                    .padding(.top, 40)
                    .padding(.bottom, -120)
                
                    Text("LAWRENCE, 26")
                        .font(.custom("Arial-Bold", size: 22))
                        .foregroundStyle(Color.white)
                        .frame(width: 161, height: 21)
                        .background(Color.clear)
                    
                    Spacer()
                        .frame(height: 10)
                    
                    Text("Chief Ethics Officer")
                        .font(.custom("Arial-Regular", size: 13))
                        .foregroundStyle(Color(red: 0.561, green: 0.604, blue: 0.682))
                        .frame(width: 161, height: 9)
                        .background(Color.clear)
                    
                    Spacer()
                        .frame(height: 10)
                    
                    HStack(spacing: 2) {
                        Image(systemName: "mappin.and.ellipse")
                            .foregroundColor(.green)
                        Text("London")
                            .font(.custom("Arial-Regular", size: 12))
                            .foregroundStyle(Color(red: 0.561, green: 0.604, blue: 0.682))
                    }
                    
                    Spacer()
                        .frame(height: 19)
                    
                    if notificationType == .newOffer && isSubmitted {
                        Text("£\(cashAmount)    \(timeAmount) mins")
                            .font(.custom("Arial-Bold", size: 22))
                            .foregroundStyle(Color.white)
                            .multilineTextAlignment(.center)
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 160)
                            .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                            .background(Color.backgroundColour)
                    } else {
                        Text("£2,500.00    15 mins")
                            .font(.custom("Arial-Bold", size: 22))
                            .foregroundStyle(Color.white)
                            .multilineTextAlignment(.center)
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 160)
                            .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                            .background(Color.backgroundColour)
                    }
                    
                    Spacer()
                        .frame(height: 19)
                    
                    Text("I understand I am signing away control of my body for the duration of my contract.")
                        .font(.custom("Arial Italic", size: 14))
                        .foregroundStyle(Color.white)
                        .frame(width: 272, height: 50)
                        .multilineTextAlignment(.center)
                        .lineLimit(nil)
                    
                    HStack(spacing: 10) {
                        Button("Decline Offer") {
                        }
                            .font(.custom("Arial-Regular", size: 12))
                            .foregroundStyle(Color.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.backgroundColour)
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.white, lineWidth: 1)
                            )
                        
                        Button("Accept Offer") {
                            showLoadingView = true
                        }
                            .font(.custom("Arial-Regular", size: 12))
                            .foregroundStyle(Color.white)
                            .padding()
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                    .padding()
                    .background(Color.backgroundColour)
                    
                    Color.backgroundColour
                        .frame(height: 800.0)
                    
                    Text("Push Notification Setup")
                        .font(.subheadline)
                        .foregroundStyle(Color.white)
                    Form 
                    {
                        TextField("Enter Date", text: $date)
                            .foregroundStyle(Color.black)
                            .focused($focusedField, equals: .date)
                        TextField("Enter Time", text: $time)
                            .foregroundStyle(Color.black)
                            .focused($focusedField, equals: .time)
                        
                        Picker("Notification Type", selection: $notificationType) {
                            Text("Money Received").tag(NotificationType.moneyReceived)
                            Text("New Offer").tag(NotificationType.newOffer)
                        }.pickerStyle(SegmentedPickerStyle())
                        
                        TextField("Cash Amount", text: $cashAmount)
                            .foregroundStyle(Color.black)
                            .focused($focusedField, equals: .cashAmount)
                        
                        if notificationType == .newOffer {
                            TextField("Time Amount", text: $timeAmount)
                                .foregroundStyle(Color.black)
                                .focused($focusedField, equals: .timeAmount)
                        }
                        
                        Button("Submit") {
                            isSubmitted = true
                            focusedField = nil
                            withAnimation {
                                scrollProxy.scrollTo(scrollID, anchor: .top)
                            }
                            pushNotificationDataSubmit = true
                        }
                        .foregroundStyle(Color.black)
                        .font(.headline)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                        .padding()
                        
                    }
                    .padding([.leading, .trailing], 40)
                    .frame(width: 380, height: 400)
                    .foregroundStyle(Color.white)
                    .background(Color.backgroundColour)
                }
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                .background(Color.backgroundColour)
                
                .sheet(isPresented: $showLoadingView) {
                    LoadingView()
                }
                
                .fullScreenCover(isPresented: $pushNotificationDataSubmit, onDismiss: nil) {
                    AwaitHomeScreenView(date: date, time: time, notificationType: notificationType, cashAmount: cashAmount, timeAmount: timeAmount, isPresented: $pushNotificationDataSubmit)
                }
            }
        }
    }
}

enum NotificationType: String, CaseIterable, Identifiable {
    case moneyReceived = "Money Received"
    case newOffer = "New Offer"
    
    var id: String { self.rawValue }
}

enum FocusableField {
    case date, time, cashAmount, timeAmount
}

struct AwaitHomeScreenView: View {
    var date: String
    var time: String
    var notificationType: NotificationType
    var cashAmount: String
    var timeAmount: String
    
    @Binding var isPresented: Bool
    @State private var waitForNotificationDelayOver = false
    
    var body: some View {
        Button(action: {
            isPresented = false
        }) {
            ZStack {
                if waitForNotificationDelayOver {
                    Image("homeScreenImage")
                        .resizable()
                        .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
                        .clipped()
                        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    
                    VStack {
                        Text(date)
                            .font(.system(size: 20, weight: .regular))
                            .foregroundStyle(Color.white)
                        
                        Text(time)
                            .font(.system(size: 90, weight: .bold))
                            .foregroundStyle(Color.white)
                    }
                    .padding(.top, -360)
                    
                    NotificationView(notificationType: notificationType)
                        .offset(y: -160)
                        .transition(.move(edge: .top))
                        .zIndex(2)
                        .edgesIgnoringSafeArea(.top)
                        .allowsHitTesting(/*@START_MENU_TOKEN@*/false/*@END_MENU_TOKEN@*/)
                    
                    HStack {
                        Spacer()
                        
                        Image(systemName: "flashlight.off.fill")
                            .imageScale(.large)
                            .foregroundStyle(Color.white)
                            .padding(10)
                            .background(Color.gray.opacity(0.5))
                            .clipShape(Circle())
                            .padding()
                        
                        Spacer()
                        
                        Image(systemName: "camera.fill")
                            .imageScale(.large)
                            .foregroundStyle(Color.white)
                            .padding(10)
                            .background(Color.gray.opacity(0.5))
                            .clipShape(Circle())
                            .padding()
                        
                        Spacer()
                    }
                    .offset(y: 310)
                } else {
                    Color.black.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                }
            }
            .onAppear() {
                DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
                    waitForNotificationDelayOver = true
                }
            }
        }
    }
}

struct LoadingView: View {
    @State private var loadingProgress: CGFloat = 0
    @State private var showLoadingComponents = true
    @State private var showCountDown = false
    @State private var countdownTime = 15 * 60
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            ZStack {
                Image("jobBackground")
                    .resizable()
                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                
                if showCountDown {
                    Text("OPT-OUT WINDOW ENDS IN 15:00")
                        .foregroundStyle(Color.white)
                        .transition(.opacity)
                        .font(.custom("Arial-Bold", size: 21))
                        .offset(y: -150)
                        .multilineTextAlignment(.center)
                        .opacity(countdownTime <= ((15 * 60) - 30) ? 0 : 1)
                    
                    Circle()
                        .trim(from: 0, to: 1)
                        .stroke(
                            LinearGradient(gradient: Gradient(colors: [Color.green, Color.blue]), startPoint: .top, endPoint: .bottom),
                            style: StrokeStyle(lineWidth: 20, lineCap: .round)
                        )
                        .rotationEffect(Angle(degrees: -90))
                        .frame(width: 221, height: 221)
                        .animation(.linear(duration: 1), value: countdownTime)
                }
                
                if showLoadingComponents {
                    
                    Circle()
                        .stroke(Color(red: 0.063, green: 0.58, blue: 0.278), lineWidth: 5)
                        .frame(width: 221, height: 221)
                    
                    Rectangle()
                        .frame(width: 200, height: 12)
                        .foregroundColor(Color.blue)
                        .clipShape(Capsule())
                        .offset(y: 13)
                    
                    Rectangle()
                        .frame(width: loadingProgress, height: 12)
                        .foregroundColor(Color(red: 0.063, green: 0.58, blue: 0.278))
                        .clipShape(Capsule())
                        .offset(x: loadingProgress / 2 - 100, y: 13)
                    
                    Text("INITIALISING")
                        .font(.custom("Arial-Bold", size: 21))
                        .foregroundStyle(Color.white)
                        .padding(.bottom, 10)
                }
                
                if showCountDown {
                    Text(timeString(time: countdownTime))
                        .foregroundStyle(Color.white)
                        .transition(.opacity)
                        .font(.system(size: 58, weight: .bold))
                        .onTapGesture(count: 2) {
                            countdownTime = 30
                        }
                    
                    Text("EM•PATH")
                        .foregroundStyle(Color.white)
                        .transition(.opacity)
                        .font(.custom("Arial-Bold", size: 21))
                        .offset(y: 140)
                    
                    if countdownTime != 0 {
                        Text("Implant Active")
                            .foregroundStyle(Color.white)
                            .transition(.opacity)
                            .font(.custom("Arial-Regular", size: 15))
                            .frame(width: 130)
                            .padding()
                            .background(Color(red: 0.063, green: 0.58, blue: 0.278))
                            .clipShape(RoundedRectangle(cornerRadius: 25))
                            .offset(y: 180)
                    } else {
                        Text("Implant Inactive")
                            .foregroundStyle(Color.white)
                            .transition(.opacity)
                            .font(.custom("Arial-Regular", size: 15))
                            .frame(width: 130)
                            .padding()
                            .background(Color.blue)
                            .clipShape(RoundedRectangle(cornerRadius: 25))
                            .offset(y: 180)
                    }
                    
                }
            }
            .onAppear {
                withAnimation(.linear(duration: 4)) {
                    loadingProgress = 200
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 4.5) {
                    withAnimation(.easeOut(duration: 0.5)) {
                        showLoadingComponents = false
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        withAnimation(.easeIn(duration: 1)) {
                            showCountDown = true
                        }
                    }
                }
            }
            .onReceive(timer) { _ in
                if showCountDown && countdownTime > 0 {
                        countdownTime -= 1
                }
            }
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
        .background(Color.backgroundColour)
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
    
    func timeString(time: Int) -> String {
        let minutes = time / 60
        let seconds = time % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}

#Preview {
    ContentView()
}
