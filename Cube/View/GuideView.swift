//
//  GuideView.swift
//  Cube
//
//  Created by ZML on 2023/04/19.
//

import SwiftUI

struct GuideView: View {
    
    @Binding  var guideView:Bool
    
    var body: some View {
        VStack {
            HStack {
                Button{
                    guideView = false
                    
                } label: {
                    Label("Back", systemImage: "chevron.backward")
                        
            }
                Spacer()
            }
            .padding()
            TabView {
                        Image("manual1")
                            .resizable()
                            .scaledToFit()
                            .tabItem {
                                Text("manual 1")
                            }
                        
                        Image("manual2")
                            .resizable()
                            .scaledToFit()
                            .tabItem {
                                Text("manual 2")
                            }
            }
            .tabViewStyle(.automatic)
        }
    }
}

struct GuideView_Previews: PreviewProvider {
    static var previews: some View {
        GuideView(guideView: .constant(false))
    }
}
