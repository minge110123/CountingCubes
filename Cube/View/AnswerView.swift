//
//  AnswerView.swift
//  Cube
//
//  Created by ZML on 2023/04/16.
//

import SwiftUI

struct AnswerView: View {
    @Binding var answer:Bool
    @Binding var currentRound:Int
    @StateObject var rounds = Round()
    @State var howmuch:String = ""
    @State var queren = false
    @Binding var objectView:Bool
    @Binding var timeElapsed:Double
    @Binding var isTimerRunning:Bool
    @Binding var simpleCompletions:Int
    @Binding var simpleAverageTime:Double
    @FocusState private var isTitleTextFieldFocused: Bool
    @Binding var normalCompletions:Int
    @Binding var normalAverageTime:Double
    @Binding var hardCompletions:Int
    @Binding var hardAverageTime:Double
    @Binding var selection:Int
    
    var body: some View {
        
        VStack{
            HStack {
                
                Button{
                    isTimerRunning = true
                    answer.toggle()
                } label: {
                    Label("Back", systemImage: "chevron.backward")
                        
                }
                    
                    
                
                
                .bold()
                
                .padding()
                Spacer()
                
                
            }
            VStack {
                HStack {
                    Text("Please enter your answer ")
                        .bold()
                        .font(.title)
                        
                    Spacer()
                    
                }
                .padding(.bottom)
                
                HStack {
                    Text("Time spent \(timeElapsed, specifier: "%.1f") s")
                        .font(.title2)
                    Spacer()
                }
                               
                
                HStack {
                    Text("")
                    TextField("answer", text: $howmuch)
                        .font(.largeTitle)
                        .keyboardType(.numberPad)
                        .focused($isTitleTextFieldFocused)
                        

                        
                        
                    }
                
                
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            self.isTitleTextFieldFocused = true
                        }
                        
                    }
            
            
            .padding()

            
            HStack {
                Button {
                    queren.toggle()
                    
                } label: {
                    Image(systemName: "checkmark.rectangle.fill")
                        .resizable()
                        .frame(width: 100.0, height: 60.0)
                        .font(.largeTitle)
                        .padding()
                        
                        
            }
                .alert(isPresented: $queren) {
                            Alert(
                                
                                title: Text(isclear(nowRound:currentRound) ? "Congratulation" : "Wrong answer"),
                                message: Text(isclear(nowRound:currentRound) ? "You answered correctly！" : "Don't lose heart and try again！"),
                                primaryButton: .default(Text(isclear(nowRound:currentRound) ?"Return Home":"Try again"), action: {
                                    if !isclear(nowRound: currentRound){
                                        isTimerRunning = true
                                        answer.toggle()
                                        
                                    }else{
                                        objectView.toggle()
                                        saveTimes()
                                        
                                        saveCompletions()
                                        timeElapsed = 0.0
                                    }
                                    
                                    
                                    }),
                                secondaryButton: .default(Text(isclear(nowRound:currentRound) ? "Next":"Skip"), action: {
                                    if !isclear(nowRound: currentRound){
                                        answer.toggle()
                                        
                                        nextType()
                                        timeElapsed = 0.0
                                        isTimerRunning = true
                                        
                                    }else{
                                        answer.toggle()
                                        
                                        nextType()
                                        
                                        saveCompletions()
                                        saveTimes()
                                        timeElapsed = 0.0
                                        isTimerRunning = true
                                        
                                    }
                                   
                                })
                               
                            )
                        }
                
                Spacer()
            }

            
                
            Spacer()
            
        }

    }
    
    func isclear(nowRound:Int)->Bool{
        switch selection {
        case 0:
            if howmuch == rounds.simple[nowRound].amswer {
                    return true
            }else{
                return false
            }
        case 1:
            if howmuch == rounds.normal[nowRound].amswer {
                    return true
            }else{
                return false
            }
        case 2:
            if howmuch == rounds.hard[nowRound].amswer {
                    return true
            }else{
                return false
            }
        default: return false
            
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
            if currentRound > rounds.simple.count-1 {
                currentRound = Int(arc4random_uniform(UInt32(rounds.normal.count)))
            }
        case 2:
            if currentRound > rounds.simple.count-1 {
                currentRound = Int(arc4random_uniform(UInt32(rounds.simple.count)))
            }
        default:
            currentRound = 0
        }
        
        
    }
    func saveCompletions(){
        switch selection {
        case 0:
            simpleCompletions += 1
        case 1:
            normalCompletions += 1
        case 2:
            hardCompletions += 1
        default: break
            
        }
    }
    
    func saveTimes() {
        switch selection {
        case 0:
            simpleAverageTime = {
                var a = 0.0
                if simpleAverageTime == 0.0 {
                    return timeElapsed
                }else{
                    a = (simpleAverageTime + timeElapsed)/2
                    return a
                }
                
            }()
        case 1:
            normalAverageTime = {
                var b = 0.0
                if normalAverageTime == 0.0 {
                    return timeElapsed
                }else{
                    b = (normalAverageTime + timeElapsed)/2
                    return b
                }
                
            }()
        case 2:
            hardAverageTime = {
                var c = 0.0
                if hardAverageTime == 0.0 {
                    return timeElapsed
                }else{
                    c = (hardAverageTime + timeElapsed)/2
                    return c
                }
                
            }()
        default: break
            
        }
    }
        
    
    
        
    
}

struct AnswerView_Previews: PreviewProvider {
    static var previews: some View {
        AnswerView(answer: .constant(false), currentRound: .constant(0), objectView: .constant(false), timeElapsed: .constant(0.0), isTimerRunning: .constant(false),simpleCompletions: .constant(0),simpleAverageTime: .constant(0.0),normalCompletions: .constant(0),normalAverageTime: .constant(0.0),hardCompletions: .constant(0),hardAverageTime: .constant(0.0),selection: .constant(0))
    }
}
