//
//  ButtonView.swift
//  Cube
//
//  Created by ZML on 2023/04/13.
//

import SwiftUI

struct ButtonView: View {
    
    let text:String

    
    var body: some View {
        
        HStack{
            Text(text)
 
               
            
        }
        .font(.largeTitle)
        .padding(.horizontal,10)
        .padding(.vertical,5)
        
        .foregroundColor(.white)
        .background(Color.accentColor)
        .cornerRadius(10)
        .shadow(radius: 3)
        
        .padding()
        
        
        
    }
}

struct RoundButton_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(text: "目的地")
    }
}
