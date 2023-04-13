//
//  ARView.swift
//  Cube
//
//  Created by ZML on 2023/04/16.
//

import SwiftUI
import RealityKit

struct ARViewContainer: UIViewRepresentable {
    var name:String
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero, cameraMode: .ar, automaticallyConfigureSession: true)
        let anchorEntity = AnchorEntity(plane: .horizontal)
        guard let ARentity = try? ModelEntity.load(named: name) else {
            fatalError(" model is not!")
        }
        ARentity.transform.scale = SIMD3<Float>(repeating: 0.5)
        anchorEntity.addChild(ARentity)
        arView.scene.anchors.append(anchorEntity)
        

        
        let pinchGesture = UIPinchGestureRecognizer(target: context.coordinator,
                                                     action: #selector(Coordinator.handlePinch(_:)))
        arView.addGestureRecognizer(pinchGesture)
        
        return arView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {
    }
    
    class Coordinator: NSObject {
        var arViewContainer: ARViewContainer
        
        init(_ arViewContainer: ARViewContainer) {
            self.arViewContainer = arViewContainer
        }
        
        @objc func handlePinch(_ gesture: UIPinchGestureRecognizer) {
            if let arView = gesture.view as? ARView {
                let location = gesture.location(in: arView)
                let results = arView.raycast(from: location, allowing: .estimatedPlane, alignment: .horizontal)
                
                if results.first != nil {
                    let anchorEntity = arView.scene.anchors.first!
                    let entity = anchorEntity.children.first!
                    let scale = SIMD3<Float>(repeating: Float(gesture.scale))
                    entity.scale *= scale
                    gesture.scale = 1
                }
            }
        }
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
}



