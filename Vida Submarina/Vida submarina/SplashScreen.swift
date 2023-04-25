//
//  SplashScreen.swift
//  Vida submarina
//
//  Created by CEDAM 13 on 25/04/23.
//

import SwiftUI

struct SplashView: View {
    
    @State var isActive: Bool = false
    
    var body: some View {
        ZStack {
            if self.isActive {
                ContentView()
            } else {
                Rectangle().fill(Gradient(colors: [.white, .white, Color(hex: 0xffD168FF, alpha: 0.9), Color(hex: 0xff05BFE8)]))
                    .ignoresSafeArea()
                VStack {
                    HStack(spacing: 0) {
                        Text("ocean").font(.custom("ronda-bold", size: 50)).foregroundColor(.blue)
                        Text("master").font(.custom("ronda-bold", size: 50))
                    }
                    Image("Hackaton1Logo")
                        .resizable()
                        .scaledToFit()
                    .frame(width: 300, height: 300)
                }
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
        
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
