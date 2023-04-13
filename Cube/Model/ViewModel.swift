//
//  ViewModel.swift
//  Cube
//
//  Created by ZML on 2023/04/13.
//

import Foundation

struct Cube:Identifiable {
    
    var id:Int
    var amswer:String
    let cubeFile:String
   
    
    
}

class Round:ObservableObject {
    
    @Published var simple:[Cube] = [Cube(id: 0, amswer: "7", cubeFile: "simple0"),
                                    Cube(id: 1, amswer: "6", cubeFile: "simple1"),
                                    Cube(id: 2, amswer: "8", cubeFile: "simple2"),
                                    Cube(id: 3, amswer: "8", cubeFile: "simple3"),
                                    Cube(id: 4, amswer: "9", cubeFile: "simple4"),
                                    Cube(id: 5, amswer: "9", cubeFile: "simple5"),
                                    Cube(id: 6, amswer: "6", cubeFile: "simple6"),
                                    Cube(id: 7, amswer: "9", cubeFile: "simple7"),
                                    Cube(id: 8, amswer: "8", cubeFile: "simple8"),
                                    Cube(id: 9, amswer: "8", cubeFile: "simple9")
                                    ]
    @Published var normal:[Cube] = [Cube(id: 0, amswer: "21", cubeFile: "normal0"),
                                    Cube(id: 1, amswer: "18", cubeFile: "normal1"),
                                    Cube(id: 2, amswer: "19", cubeFile: "normal2"),
                                    Cube(id: 3, amswer: "10", cubeFile: "normal3"),
                                    Cube(id: 4, amswer: "10", cubeFile: "normal4"),
                                    Cube(id: 5, amswer: "20", cubeFile: "normal5"),
                                    Cube(id: 6, amswer: "24", cubeFile: "normal6"),
                                    Cube(id: 7, amswer: "18", cubeFile: "normal7"),
                                    Cube(id: 8, amswer: "18", cubeFile: "normal8"),
                                    Cube(id: 9, amswer: "19", cubeFile: "normal9")
                                    ]
    
  
    @Published var hard:[Cube] = [Cube(id: 0, amswer: "32", cubeFile: "hard0"),
                                  Cube(id: 1, amswer: "29", cubeFile: "hard1"),
                                  Cube(id: 2, amswer: "30", cubeFile: "hard2"),
                                  Cube(id: 3, amswer: "26", cubeFile: "hard3"),
                                  Cube(id: 4, amswer: "31", cubeFile: "hard4"),
                                    ]
    
    
}
