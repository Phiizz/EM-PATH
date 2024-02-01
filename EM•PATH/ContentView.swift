//
//  ContentView.swift
//  EM•PATH
//
//  Created by Nathan Stokes on 12/01/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var isBlueScreen = false
    @State private var displayNotification = false
    @State private var navigateToOffer = false
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ZStack {
                    VStack (spacing: 0){
                        Text("Congratulations!\nYour new profile is now live")
                            .font(.system(size: 28, weight: .bold))
                            .padding(.top, 70)
                            .foregroundStyle(Color.white)
                            .multilineTextAlignment(.center)
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 160)
                            .background(Color.black)
                        
                        Color.black
                            .frame(height: 30.0)
                        
                        Image("profilePicture")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 270, height: 300)
                            .clipShape(Ellipse())
                            .overlay(Ellipse().stroke(Color.white, lineWidth: 10))
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
                            .background(Color.black)
                        
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Josie, 23")
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                .bold()
                                .padding(.top, 20)
                            
                            HStack {
                                Image(systemName: "person.fill")
                                    .imageScale(.large)
                                    .font(.system(size: 20))
                                Text("Woman")
                            }
                            
                            HStack {
                                Image(systemName: "house.fill")
                                    .imageScale(.large)
                                    .font(.system(size: 16))
                                Text("Lives in London")
                            }
                            
                            HStack {
                                Image(systemName: "briefcase.fill")
                                    .imageScale(.large)
                                    .font(.system(size: 16))
                                Text("Barista @ Starbuckz Coffee")
                            }
                            
                            
                            Text("\nHi I'm Josie! \n\nLorem ipsum dolor sit amet. Eos similique reiciendis ab maxime dicta non quis eius et voluptate voluptas aut voluptates voluptatum aut enim consequatur. Qui nulla molestiae ut")
                                .font(.subheadline)
                                .mask {
                                    LinearGradient(gradient: Gradient(colors: [.black.opacity(1.0), .black.opacity(0.2)]), startPoint: .top, endPoint: .bottom)
                                }
                        }
                        .padding([.leading, .trailing], 40)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 400)
                        .foregroundStyle(Color.white)
                        .background(Color.black)
                    }
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    
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
                .cornerRadius(10)
                .padding()
            
            VStack(alignment: .leading) {
                Text("EM•PATH")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                
                if notificationType == .moneyReceived {
                    Text("£2500 has been added to your account")
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                } else {
                    Text("You have a new offer from Lawrence!")
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                }
            }
            
            Spacer()
        }
        .padding([.top, .bottom, .leading, .trailing])
        .background(Color(.darkGray).opacity(1))
        .cornerRadius(10)
        .padding()
        .frame(maxWidth: 400)
        .frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
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
                    
                    Color.black
                        .frame(height: 200.0)
                
                    Image("offerProfilePicture")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 270, height: 300)
                        .clipShape(Ellipse())
                        .overlay(Ellipse().stroke(Color.white, lineWidth: 10))
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
                        .background(Color.black)
                        .padding(.bottom, 20)
                
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Lawrence, 27")
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .bold()
                            .padding(.top, 40)
                        
                        HStack {
                            Image(systemName: "person.fill")
                                .imageScale(.large)
                                .font(.system(size: 20))
                            Text("Man")
                        }
                        
                        HStack {
                            Image(systemName: "house.fill")
                                .imageScale(.large)
                                .font(.system(size: 16))
                            Text("Lives in London")
                        }
                        
                        HStack {
                            Image(systemName: "briefcase.fill")
                                .imageScale(.large)
                                .font(.system(size: 16))
                            Text("Philanthropist")
                        }
                        
                        Color.black
                            .frame(height: 20.0)
                        
                        if notificationType == .newOffer && isSubmitted {
                            Text("New Offer\n£\(cashAmount) - \(timeAmount) minutes")
                                .font(.system(size: 28, weight: .bold))
                                .padding(.top, 70)
                                .foregroundStyle(Color.white)
                                .multilineTextAlignment(.center)
                                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 160)
                                .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                .background(Color.black)
                        } else {
                            Text("New Offer\n£2500 - 15 minutes")
                                .font(.system(size: 28, weight: .bold))
                                .padding(.top, 70)
                                .foregroundStyle(Color.white)
                                .multilineTextAlignment(.center)
                                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 160)
                                .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                .background(Color.black)
                        }
                        
                        Text("I understand I am signing away control of my body for the duration of my contract.")
                            .font(.subheadline)
                            .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                            .multilineTextAlignment(.leading)
                        
                        Color.black
                            .frame(height: 15.0)
                        
                        Button("Accept") {
                            showLoadingView = true
                        }
                            .font(.headline)
                            .foregroundStyle(Color.white)
                            .padding()
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                            .background(Color.blue)
                            .cornerRadius(10)
                            .padding()
                            .background(Color.black)
                        
                        Color.black
                            .frame(height: 800.0)
                        
                        Text("Push Notification Setup")
                            .font(.subheadline)
                        Form {
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
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: 300)
                        .background(Color.black)
                    }
                    .padding([.leading, .trailing], 40)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
                    .foregroundStyle(Color.white)
                    .background(Color.black)
                }
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                .background(Color.black)
                
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
                if showCountDown {
                    Text("OPT OUT WINDOW\nNOW COUNTING DOWN")
                        .foregroundStyle(Color.white)
                        .transition(.opacity)
                        .font(.system(size: 26, weight: .bold))
                        .offset(y: -250)
                        .multilineTextAlignment(.center)
                        .opacity(countdownTime <= ((15 * 60) - 30) ? 0 : 1)
                }
                Circle()
                    .stroke(lineWidth: 4)
                    .foregroundColor(.cyan)
                    .frame(width: 300, height: 300)
                
                if showLoadingComponents {
                    Rectangle()
                        .frame(width: loadingProgress, height: 5)
                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                        .offset(x: loadingProgress / 2 - 100, y: 10)
                    
                    Text("Initializing...")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundStyle(Color.white)
                        .offset(y: -10)
                }
                
                if showCountDown {
                    Text(timeString(time: countdownTime))
                        .foregroundStyle(Color.white)
                        .transition(.opacity)
                        .font(.system(size: 58, weight: .bold))
                        .onTapGesture(count: 2) {
                            countdownTime = 30
                        }
                    
                    Text("EM•PATH IMPLANT")
                        .foregroundStyle(Color.white)
                        .transition(.opacity)
                        .font(.system(size: 18, weight: .bold))
                        .offset(y: 200)
                    
                    if countdownTime != 0 {
                        Text("ACTIVE")
                            .foregroundStyle(Color.cyan)
                            .transition(.opacity)
                            .font(.system(size: 36, weight: .bold))
                            .offset(y: 220)
                            .frame(width: 200)
                            .scaledToFit()
                    } else {
                        Text("DISABLED")
                            .foregroundStyle(Color.red)
                            .transition(.opacity)
                            .font(.system(size: 36, weight: .bold))
                            .offset(y: 220)
                            .frame(width: 200)
                            .scaledToFit()
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
        .background(Color.black)
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
