//
//  ContentView.swift
//  Cube
//
//  Created by ZML on 2023/04/13.
//

import SwiftUI

struct ContentView: View {

    
    @AppStorage("darkMode") var darkMode = false
    
    
    
    var body: some View {
        
        
        VStack {
            Home(darkMode: $darkMode)
                .preferredColorScheme(darkMode ? .dark : .light)
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
                
        }
    }
    
}
