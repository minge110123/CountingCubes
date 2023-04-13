//
//  ScoreView.swift
//  Cube
//
//  Created by ZML on 2023/04/16.
//

import SwiftUI

struct ScoreView: View {
    
    
   
    
    @Binding var simpleCompletions:Int
    @Binding var simpleAverageTime:Double
    
    @Binding var normalCompletions:Int
    @Binding var normalAverageTime:Double
    
    @Binding var hardCompletions:Int
    @Binding var hardAverageTime:Double
    
    
    
    
    
    var body: some View {
         
             ScrollView {
                VStack{
                    ScoreCardView(name: "Simple", color: Color.green, complate: simpleCompletions, avTime: simpleAverageTime)
                    
                    ScoreCardView(name: "Normal", color: Color.yellow, complate: normalCompletions, avTime: normalAverageTime)
                    
                    
                    ScoreCardView(name: "Hard", color: Color.red, complate: hardCompletions, avTime: hardAverageTime)
                    
                    
                    
                    
                }
               
                
                
                
                    
             }.background(
                Image("wallpaper3")
                 .resizable()
                 .scaledToFill()
                 .edgesIgnoringSafeArea(.all)
             )
               
        
    }
    
}

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreView(simpleCompletions: .constant(0), simpleAverageTime: .constant(0.0),normalCompletions: .constant(0),normalAverageTime: .constant(0.0),hardCompletions: .constant(0),hardAverageTime: .constant(0.0))
    }
}
