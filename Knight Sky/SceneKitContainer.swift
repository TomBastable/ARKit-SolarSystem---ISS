//
//  SceneKitContainer.swift
//  Knight Sky
//
//  Created by Tom Bastable on 29/04/2024.
//

import Foundation
import SceneKit
import SwiftUI

struct SceneKitContainerView: UIViewRepresentable {
    
    @Binding var planet: CelestialObject
    
    func makeUIView(context: Context) -> SCNView {
        let sceneView = SCNView()
        
        // Configure the scene view
        sceneView.allowsCameraControl = true
        sceneView.autoenablesDefaultLighting = false // Turn off default lighting to customize
        sceneView.backgroundColor = UIColor.clear
        
        // Load the USDZ file
        if let scene = try? SCNScene(url: Bundle.main.url(forResource: planet.rawValue, withExtension: "usdz")!, options: nil) {
            sceneView.scene = scene
            
            // Add rotation
            if let objectNode = scene.rootNode.childNodes.first {
                let rotateAction = SCNAction.repeatForever(SCNAction.rotateBy(x: 0, y: CGFloat.pi, z: 0, duration: 10))
                objectNode.runAction(rotateAction)
            }
            
            // Add a directional light
            let lightNode = SCNNode()
            lightNode.light = SCNLight()
            lightNode.light?.type = .directional
            lightNode.position = SCNVector3(x: 0, y: 10, z: 0)
            lightNode.eulerAngles = SCNVector3(-Float.pi / 2, 0, 0)
            lightNode.light?.color = UIColor.white
            scene.rootNode.addChildNode(lightNode)
            
            let fillLightNode = SCNNode()
            fillLightNode.light = SCNLight()
            fillLightNode.light?.type = .directional
            fillLightNode.light?.intensity = 50 // Adjust as necessary
            fillLightNode.position = SCNVector3(x: 0, y: -5, z: 0) // Positioned below the model
            scene.rootNode.addChildNode(fillLightNode)
        }
        
        return sceneView
    }
    
    func updateUIView(_ uiView: SCNView, context: Context) {
        // Reload the scene with the new planet model
        if let newScene = try? SCNScene(url: Bundle.main.url(forResource: planet.rawValue, withExtension: "usdz")!, options: nil) {
            uiView.scene = newScene
            
            // Add the rotation and lighting just like in makeUIView()
            if let objectNode = newScene.rootNode.childNodes.first {
                let rotateAction = SCNAction.repeatForever(SCNAction.rotateBy(x: 0, y: CGFloat.pi, z: 0, duration: 10))
                objectNode.runAction(rotateAction)
            }
            
            // Ensure lighting is set up if it's not being duplicated from makeUIView
            // This is just an example of adding a simple light if it isn't already added in the scene setup
            let lightNode = SCNNode()
            lightNode.light = SCNLight()
            lightNode.light?.type = .directional
            lightNode.position = SCNVector3(x: 0, y: 10, z: 0)
            lightNode.eulerAngles = SCNVector3(-Float.pi / 2, 0, 0)
            lightNode.light?.color = UIColor.white
            newScene.rootNode.addChildNode(lightNode)
            
            let fillLightNode = SCNNode()
            fillLightNode.light = SCNLight()
            fillLightNode.light?.type = .directional
            fillLightNode.light?.intensity = 50 // Adjust as necessary
            fillLightNode.position = SCNVector3(x: 0, y: -5, z: 0) // Positioned below the model
            newScene.rootNode.addChildNode(fillLightNode)
        }
    }
}
