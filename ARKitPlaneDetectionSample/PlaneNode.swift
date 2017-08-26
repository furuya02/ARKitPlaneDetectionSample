//
//  PlaneNode.swift
//  ARKitPlaneDetectionSample
//
//  Created by . SIN on 2017/08/26.
//  Copyright © 2017年 SAPPOROWORKS. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class PlaneNode: SCNNode {
    
    fileprivate override init() {
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(anchor: ARPlaneAnchor) {
        super.init()
        
        geometry = SCNPlane(width: CGFloat(anchor.extent.x), height: CGFloat(anchor.extent.z))
        let planeMaterial = SCNMaterial()
        planeMaterial.diffuse.contents = UIColor.white.withAlphaComponent(0.5)
        geometry?.materials = [planeMaterial]
        SCNVector3Make(anchor.center.x, 0, anchor.center.z)
        transform = SCNMatrix4MakeRotation(-Float.pi / 2, 1, 0, 0)
    }

    func update(anchor: ARPlaneAnchor) {
        (geometry as! SCNPlane).width = CGFloat(anchor.extent.x)
        (geometry as! SCNPlane).height = CGFloat(anchor.extent.z)
        position = SCNVector3Make(anchor.center.x, 0, anchor.center.z)
    }
}
