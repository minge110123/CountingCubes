//
//  Home.swift
//  Cube
//
//  Created by ZML on 2023/04/13.
//

import SwiftUI



struct Home: View {
    @State var selection = 0
    @AppStorage("simpleCompletions") var simpleCompletions = 0
    @AppStorage("simpleAverageTime") var simpleAverageTime = 0.0
    @AppStorage("normalCompletions") var normalCompletions = 0
    @AppStorage("normalAverageTime") var normalAverageTime = 0.0
    @AppStorage("hardCompletions") var hardCompletions = 0
    @AppStorage("hardAverageTime") var hardAverageTime = 0.0
    
    
    @Binding var darkMode:Bool

    var body: some View {
        
        TabView(selection: $selection) {
            Group{
                NavigationStack  {
                    SelectionView(simpleCompletions: $simpleCompletions, simpleAverageTime: $simpleAverageTime, normalCompletions: $normalCompletions, normalAverageTime: $normalAverageTime, hardCompletions: $hardCompletions, hardAverageTime: $hardAverageTime)
                       

                    
                        .navigationTitle("Counting Cubes")
                    
                    
                }
                .tabItem {
                    Label("home", systemImage: "house")
                    
                }
                
                .tag(0)
                
                
                
                NavigationStack {
                    ScoreView(simpleCompletions: $simpleCompletions, simpleAverageTime: $simpleAverageTime, normalCompletions: $normalCompletions, normalAverageTime: $normalAverageTime, hardCompletions: $hardCompletions, hardAverageTime: $hardAverageTime)
                        .navigationTitle("Score")
                }
                .tabItem {
                    Label("score", systemImage: "trophy")
                        .font(.largeTitle)
                }
                .tag(1)
                
                
                
                SettingView(simpleCompletions: $simpleCompletions, simpleAverageTime: $simpleAverageTime, darkMode: $darkMode ,normalCompletions: $normalCompletions, normalAverageTime: $normalAverageTime, hardCompletions: $hardCompletions, hardAverageTime: $hardAverageTime)
                    .tabItem {
                        Label("Setting", systemImage: "gear")
                            .font(.largeTitle)
                    }
                    .tag(2)
                
            }
                
                
                
                
            
        } .onAppear {
            let tabBarAppearance = UITabBarAppearance()
            tabBarAppearance.configureWithDefaultBackground()
            UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
        }
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home( darkMode: .constant(false))
    }
}
