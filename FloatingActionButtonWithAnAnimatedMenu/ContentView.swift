//
//  ContentView.swift
//  FloatingActionButtonWithAnAnimatedMenu
//
//  Created by ramil on 07.11.2019.
//  Copyright © 2019 com.ri. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showMenuItem1 = false
    @State private var showMenuItem2 = false
    @State private var showMenuItem3 = false
    
    var body: some View {
        
        ZStack(alignment: .bottomTrailing) {
            Rectangle()
                .foregroundColor(.clear)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            VStack {
                Spacer()
                if showMenuItem1 {
                    MenuItem(icon: "camera.fill")
                }
                if showMenuItem2 {
                    MenuItem(icon: "photo.on.rectangle")
                }
                if showMenuItem3 {
                    MenuItem(icon: "square.and.arrow.up.fill")
                }
                
                Button(action: {
                    self.showMenu()
                    print("Show floating menu")
                }) {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .frame(width: 80, height: 80)
                        .foregroundColor(Color(red: 153/255, green: 102/255, blue: 255/255))
                        .shadow(color: .gray, radius: 0.3, x: 1, y: 1)
                }.padding()
            }
        }
    }
    
    func showMenu() {
        withAnimation {
            self.showMenuItem3.toggle()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            withAnimation {
                self.showMenuItem2.toggle()
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            withAnimation {
                self.showMenuItem1.toggle()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct MenuItem: View {
    
    var icon: String
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(Color(red: 153/255, green: 102/255, blue: 255/255))
                .frame(width: 55, height: 55)
            Image(systemName: icon)
                .imageScale(.large)
                .foregroundColor(.white)
        }.shadow(color: .gray, radius: 0.3, x: 1, y: 1)
            .transition(.move(edge: .trailing))
    }
}


