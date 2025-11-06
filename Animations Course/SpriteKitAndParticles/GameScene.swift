//
//  GameScene.swift
//  Animations Course
//
//  Created by Shemek on 06/11/2025.
//

import Foundation
import SpriteKit

class GameScene: SKScene {
    let dx: CGFloat
    let dy: CGFloat
    let velocity: CGFloat
    let lifeTime: TimeInterval
    let birthRate: CGFloat
    let xAcceleration: CGFloat
    let yAcceleration: CGFloat
    
    init(
        size: CGSize,
        dx: CGFloat,
        dy: CGFloat,
        velocity: CGFloat,
        lifeTime: TimeInterval,
        birthRate: CGFloat,
        xAcceleration: CGFloat,
        yAcceleration: CGFloat
    ) {
        self.dx = dx
        self.dy = dy
        self.velocity = velocity
        self.lifeTime = lifeTime
        self.birthRate = birthRate
        self.xAcceleration = xAcceleration
        self.yAcceleration = yAcceleration
        super.init(size: size)
        self.backgroundColor = .clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMove(to view: SKView) {
        addEmitter()
    }
    
    func addEmitter() {
        let particleEmitter = SKEmitterNode()
        
        // Configure emitter properties
        particleEmitter.particleColor = .white
        particleEmitter.particleColorBlendFactor = 1.0
        
        particleEmitter.particleSize = CGSize(width: 3.0, height: 2.0)
        particleEmitter.particleBirthRate = birthRate
        particleEmitter.particleLifetime = lifeTime
        
        particleEmitter.particlePositionRange = CGVector(dx: dx, dy: dy)
        particleEmitter.emissionAngle = 2 * .pi // 360 degrees
        particleEmitter.emissionAngleRange = 2 * .pi
        
        particleEmitter.speed = velocity
        particleEmitter.particleSpeedRange = 20.0
        
        particleEmitter.alpha = 1.0
        particleEmitter.particleAlphaRange = 0.5
        particleEmitter.particleAlphaSpeed = -0.2
        
        particleEmitter.particleRotation = 0.0
        particleEmitter.particleRotationRange = 2 * .pi
        particleEmitter.particleRotationSpeed = .random(in: -1.0...1.0)
        
        particleEmitter.xAcceleration = xAcceleration
        particleEmitter.yAcceleration = yAcceleration
        
        particleEmitter.position = CGPoint(x: self.size.width / 2, y: self.size.height / 2)
        
        // Add the emitter to scene
        addChild(particleEmitter)
    }
    
    
}
