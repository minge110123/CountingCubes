//
//  ScoreCardView.swift
//  Cube
//
//  Created by ZML on 2023/04/16.
//

import SwiftUI

struct ScoreCardView: View {
    var name:String
    var color:Color
    var complate:Int
    var avTime:Double
    
    var body: some View {
        VStack(alignment:.leading){
            ZStack {
                
                Rectangle()
                    .fill(color)
                    .cornerRadius(10)
                    

                    
                
                VStack {
                    HStack {
                        Text("\(name)")
                                .font(.largeTitle)
                            .padding()
                        Spacer()
                    }
                    HStack {
                        Text("Complates:      \(complate)")
                            .padding()
                        Spacer()
                    }
                    HStack {
                        Text("Average time:    \(avTime,specifier: "%.1f") s")
                            .padding()
                        Spacer()
                    }
                    Spacer()
                        
                }
                
                        
                    
                    
                      
                   
                
            }.padding()
            
        }
    }
}

struct ScoreCardView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreCardView(name: "Simple", color: Color.green, complate: 0, avTime: 0.0)
            .previewLayout(.fixed(width: 400, height: 200))
    }
}
