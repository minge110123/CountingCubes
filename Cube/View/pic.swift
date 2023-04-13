//
//  pic.swift
//  Cube
//
//  Created by ZML on 2023/04/16.
//

import SwiftUI

struct pic: View {
    @State private var selectedOption = "A"
    let options = ["A", "B"]
    
    var body: some View {
        VStack {
            Text("当前选项：\(selectedOption)")
            Picker("选项", selection: $selectedOption) {
                ForEach(options, id: \.self) { option in
                    Text(option)
                }
            }.pickerStyle(SegmentedPickerStyle())
        }
    }
}

struct pic_Previews: PreviewProvider {
    static var previews: some View {
        pic()
    }
}
