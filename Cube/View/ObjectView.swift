//
//  SimpleView.swift
//  Cube
//
//  Created by ZML on 2023/04/13.
//

import SwiftUI

struct ObjectView: View {
    
    @Binding var objectView:Bool
    @State var answer:Bool=false
    @StateObject var rounds = Round()
    @State var currentRound:Int = 0
    @Binding var isTimerRunning:Bool
    @Binding var timeElapsed:Double
    @Binding var simpleCompletions:Int
    @Binding var simpleAverageTime:Double
    @State private var selectedOption = "Object"
    @Binding var selection:Int
    @Binding var normalCompletions:Int
    @Binding var normalAverageTime:Double
    @Binding var hardCompletions:Int
    @Binding var hardAverageTime:Double
    
    let options = ["Object", "AR"]
    
    
    var body: some View {
        VStack {
            
            HStack {
                
                Button {
                    objectView = false

                }label: {
                    Text("Close")
                        .bold()
                }
                
                
                Spacer()
                
                Button{
                    nextType()
                    timeElapsed = 0.0
                    isTimerRunning = true
                }label: {
                    Text("Skip")
                        .bold()
                }
                
                
            }.padding()
            
            Picker("", selection: $selectedOption) {
                ForEach(options, id: \.self) { option in
                    Text(option)
                        .foregroundColor(option == selectedOption ? Color.blue : Color.black)
                        
                }
            }.pickerStyle(SegmentedPickerStyle())
                
                .padding(.horizontal)
                .frame(width: 300)
            
            switch selection {
            case 0:
                if selectedOption == "Object"{
                    switch currentRound {
                    case 0: ARQuickLookView(name: rounds.simple[0].cubeFile)
                    case 1: ARQuickLookView(name: rounds.simple[1].cubeFile)
                    case 2: ARQuickLookView(name: rounds.simple[2].cubeFile)
                    case 3: ARQuickLookView(name: rounds.simple[3].cubeFile)
                    case 4: ARQuickLookView(name: rounds.simple[4].cubeFile)
                    case 5: ARQuickLookView(name: rounds.simple[5].cubeFile)
                    case 6: ARQuickLookView(name: rounds.simple[6].cubeFile)
                    case 7: ARQuickLookView(name: rounds.simple[7].cubeFile)
                    case 8: ARQuickLookView(name: rounds.simple[8].cubeFile)
                    case 9: ARQuickLookView(name: rounds.simple[9].cubeFile)
                    default:
                        Text("File not found")
                    }
                }else{
                   
                    switch currentRound {
                    case 0: ARViewContainer(name: rounds.simple[0].cubeFile).edgesIgnoringSafeArea(.all)
                    case 1: ARViewContainer(name: rounds.simple[1].cubeFile).edgesIgnoringSafeArea(.all)
                    case 2: ARViewContainer(name: rounds.simple[2].cubeFile).edgesIgnoringSafeArea(.all)
                    case 3: ARViewContainer(name: rounds.simple[3].cubeFile).edgesIgnoringSafeArea(.all)
                    case 4: ARViewContainer(name: rounds.simple[4].cubeFile).edgesIgnoringSafeArea(.all)
                    case 5: ARViewContainer(name: rounds.simple[5].cubeFile).edgesIgnoringSafeArea(.all)
                    case 6: ARViewContainer(name: rounds.simple[6].cubeFile).edgesIgnoringSafeArea(.all)
                    case 7: ARViewContainer(name: rounds.simple[7].cubeFile).edgesIgnoringSafeArea(.all)
                    case 8: ARViewContainer(name: rounds.simple[8].cubeFile).edgesIgnoringSafeArea(.all)
                    case 9: ARViewContainer(name: rounds.simple[9].cubeFile)
                    default:
                        Text("File not found")
                    }
                }
            case 1:
                if selectedOption == "Object"{
                    switch currentRound {
                    case 0: ARQuickLookView(name: rounds.normal[0].cubeFile).edgesIgnoringSafeArea(.all)
                    case 1: ARQuickLookView(name: rounds.normal[1].cubeFile)
                    case 2: ARQuickLookView(name: rounds.normal[2].cubeFile)
                    case 3: ARQuickLookView(name: rounds.normal[3].cubeFile)
                    case 4: ARQuickLookView(name: rounds.normal[4].cubeFile)
                    case 5: ARQuickLookView(name: rounds.normal[5].cubeFile)
                    case 6: ARQuickLookView(name: rounds.normal[6].cubeFile)
                    case 7: ARQuickLookView(name: rounds.normal[7].cubeFile)
                    case 8: ARQuickLookView(name: rounds.normal[8].cubeFile)
                    case 9: ARQuickLookView(name: rounds.normal[9].cubeFile)
                    default:
                        Text("File not found")
                    }
                }else{
                    switch currentRound {
                    case 0: ARViewContainer(name: rounds.normal[0].cubeFile).edgesIgnoringSafeArea(.all)
                    case 1: ARViewContainer(name: rounds.normal[1].cubeFile).edgesIgnoringSafeArea(.all)
                    case 2: ARViewContainer(name: rounds.normal[2].cubeFile).edgesIgnoringSafeArea(.all)
                    case 3: ARViewContainer(name: rounds.normal[3].cubeFile).edgesIgnoringSafeArea(.all)
                    case 4: ARViewContainer(name: rounds.normal[4].cubeFile).edgesIgnoringSafeArea(.all)
                    case 5: ARViewContainer(name: rounds.normal[5].cubeFile).edgesIgnoringSafeArea(.all)
                    case 6: ARViewContainer(name: rounds.normal[6].cubeFile).edgesIgnoringSafeArea(.all)
                    case 7: ARViewContainer(name: rounds.normal[7].cubeFile).edgesIgnoringSafeArea(.all)
                    case 8: ARViewContainer(name: rounds.normal[8].cubeFile).edgesIgnoringSafeArea(.all)
                    case 9: ARViewContainer(name: rounds.normal[9].cubeFile).edgesIgnoringSafeArea(.all)
                    default:
                        Text("File not found")
                    }
                }
                
            case 2:
                if selectedOption == "Object"{
                    switch currentRound {
              
                    case 0: ARQuickLookView(name: rounds.hard[0].cubeFile)
                    case 1: ARQuickLookView(name: rounds.hard[1].cubeFile)
                    case 2: ARQuickLookView(name: rounds.hard[2].cubeFile)
                    case 3: ARQuickLookView(name: rounds.hard[3].cubeFile)
                    case 4: ARQuickLookView(name: rounds.hard[4].cubeFile)
                    default:
                        Text("error")
                    }
                }else{
                  
                    switch currentRound {
                        case 0: ARViewContainer(name: rounds.hard[0].cubeFile)
                        case 1: ARViewContainer(name: rounds.hard[1].cubeFile)
                        case 2: ARViewContainer(name: rounds.hard[2].cubeFile)
                        case 3: ARViewContainer(name: rounds.hard[3].cubeFile)
                        case 4: ARViewContainer(name: rounds.hard[4].cubeFile)
                    default:
                        Text("File not found")
                    }
                }

            default:
                Text("File not found")
                    .foregroundColor(.red)
            }
            
            

            
            Button {
                withAnimation {
                    answer = true
                    isTimerRunning = false
                }
               
                
               
            } label: {
                ButtonView(text: "Answer")
            }
            .fullScreenCover(isPresented: $answer){
                AnswerView(answer: $answer, currentRound: $currentRound, objectView: $objectView, timeElapsed: $timeElapsed, isTimerRunning: $isTimerRunning,simpleCompletions: $simpleCompletions,simpleAverageTime: $simpleAverageTime, normalCompletions: $normalCompletions, normalAverageTime: $normalAverageTime, hardCompletions: $hardCompletions, hardAverageTime: $hardAverageTime,selection:$selection)

            }

                    
            }
            
            
            
        }
    func nextType(){
        currentRound += 1
        switch selection{
        case 0:
            if currentRound > rounds.simple.count-1 {
                currentRound = Int(arc4random_uniform(UInt32(rounds.simple.count)))
            }
        case 1:
            if currentRound > rounds.normal.count-1 {
                currentRound = Int(arc4random_uniform(UInt32(rounds.normal.count)))
            }
        case 2:
            if currentRound > rounds.hard.count-1 {
                currentRound = Int(arc4random_uniform(UInt32(rounds.hard.count)))
            }
        default:
            currentRound = 0
        }
        
        
    }
        
    }


struct SimpleView_Previews: PreviewProvider {
    
    static var previews: some View {
        ObjectView(objectView:.constant(false),isTimerRunning: .constant(false), timeElapsed: .constant(0.0),simpleCompletions: .constant(0),simpleAverageTime: .constant(0.0), selection: .constant(0),normalCompletions: .constant(0),normalAverageTime: .constant(0.0),hardCompletions: .constant(0),hardAverageTime: .constant(0.0))
    }
}
