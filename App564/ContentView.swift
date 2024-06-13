//
//  ContentView.swift
//  App564
//
//  Created by DJUROM on 03/06/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State var current_tab: Tab = Tab.Games

    @AppStorage("status") var status: Bool = false
    
    init() {
        
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        
        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            if status {
            
            VStack(spacing: 0, content: {
            
                    TabView(selection: $current_tab, content: {
                        
                        GamesView()
                            .tag(Tab.Games)
                        
                        PrizesView()
                            .tag(Tab.Prizes)
                        
                        SettingsView()
                            .tag(Tab.Settings)
                        
                    })
                    
                    TabBar(selectedTab: $current_tab)
                })
                    .ignoresSafeArea(.all, edges: .bottom)
                    .onAppear {
                        
                    }
                
            } else {
                
                OBR1()
            }
        }
    }
}

#Preview {
    ContentView()
}
