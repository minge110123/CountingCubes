//
//  GameView.swift
//  Cube
//
//  Created by ZML on 2023/04/13.
//

import SwiftUI

struct SelectionView: View {
    
    @State var objectView = false
    @State  var isTimerRunning = false
    @State  var timeElapsed = 0.0
    @State  var timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    @State  var selection = 0
    @Binding var simpleCompletions:Int
    @Binding var simpleAverageTime:Double
    @Binding var normalCompletions:Int
    @Binding var normalAverageTime:Double
    @Binding var hardCompletions:Int
    @Binding var hardAverageTime:Double
    
    
    let options = ["Simple", "Normal", "Hard"]
    
    var body: some View {
        
        
        ZStack {
            Image("wallpaper\(selection)")
            
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .animation(.easeInOut,value:"wallpaper\(selection)")
            
            VStack() {
                Group {
                    
                    Picker(selection: $selection, label: Text("")) {
                        ForEach(0..<3) { index in
                            Text(options[index])
                                .font(.largeTitle)
                            
                            
                        }
                    } .background(.ultraThinMaterial,in:RoundedRectangle(cornerRadius: 16.0))
                        .pickerStyle(.wheel)

                }
                .frame(width: 400,height: 300)
                .cornerRadius(50)
                
                
                Button {
                    objectView = true
                    isTimerRunning = true
                    timeElapsed = 0.0
 
                } label: {
                    ButtonView(text: "Start")
                        
                    
                }
                .fullScreenCover(isPresented: $objectView) {
                    ObjectView(objectView: $objectView, isTimerRunning: $isTimerRunning, timeElapsed: $timeElapsed,simpleCompletions: $simpleCompletions,simpleAverageTime:$simpleAverageTime, selection: $selection , normalCompletions: $normalCompletions, normalAverageTime: $normalAverageTime, hardCompletions: $hardCompletions, hardAverageTime: $hardAverageTime)
                }
            }
            .onReceive(timer) { _ in
                if self.isTimerRunning {
                    self.timeElapsed += 0.1
                }
            }
            
            
            
          
            
            
            
            
            
            
            
        }
            
            
            

        
        
        
    }
      
        
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        SelectionView(simpleCompletions: .constant(0), simpleAverageTime: .constant(0.0),normalCompletions: .constant(0),normalAverageTime: .constant(0.0),hardCompletions: .constant(0),hardAverageTime: .constant(0.0))
    }
}
