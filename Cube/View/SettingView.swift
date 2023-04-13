//
//  settingView.swift
//  Cube
//
//  Created by ZML on 2023/04/16.
//

import SwiftUI

struct SettingView: View {
    
    @State var isremove = false
    @Binding var simpleCompletions:Int
    @Binding var simpleAverageTime:Double
    @Binding var darkMode:Bool
    @Binding var normalCompletions:Int
    @Binding var normalAverageTime:Double
    @Binding var hardCompletions:Int
    @Binding var hardAverageTime:Double
    @State var guideView = false
    
    var body: some View {
        NavigationStack{
            
            List {
                
                Section(header:Text("")){
                    
                    Button{
                        guideView.toggle()
                    }label: {
                        Text("Guide")
                    }
                    
                    
                }
                .sheet(isPresented: $guideView){
                    GuideView(guideView: $guideView)
                }
                
                Section(header:Text("")){
                    
                    Toggle("DarkMode", isOn: $darkMode)
                    
                    
                }
                
                
                
                Section(header:Text("This option will permanently delete all your score data.")) {
                    Button(action: {
                        isremove = true
                    }, label: {
                        Text("Remove all data")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(Color.red)
                            .multilineTextAlignment(.center)
                            
                            
                    })
                    .alert(isPresented: $isremove) {
                                Alert(
                                    title: Text("Attention"),
                                    message: Text("permanently delete all your score data"),
                                    primaryButton: .destructive(Text("confirm"),action: {
                                      simpleCompletions = 0
                                        simpleAverageTime = 0.0
                                        normalCompletions = 0
                                        normalAverageTime = 0.0
                                        hardCompletions = 0
                                        hardAverageTime = 0.0
                                    }),
                                    secondaryButton: .default(Text("cancel"))
                                )
                }
                }
                
                
            }

            
            
            .navigationTitle("Setting")
            
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView(simpleCompletions: .constant(0), simpleAverageTime: .constant(0.0), darkMode: .constant(false),normalCompletions: .constant(0),normalAverageTime: .constant(0.0),hardCompletions: .constant(0),hardAverageTime: .constant(0.0))
    }
}
