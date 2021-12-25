//
//  ContentView.swift
//  Snow
//
//  Created by Dustin yang on 12/25/21.
//

import SwiftUI

struct ContentView: View {
    
    
    var body: some View {
        SnowView()
                   .background(Color.black)
       
    }
    
    
    
}


struct SnowView: UIViewRepresentable {
    
    func makeUIView(context: Context) -> some UIView {
        
        let screenSize = UIScreen.main.bounds
        let view = UIView(frame: CGRect(x: 0, y: 0, width: screenSize.width, height: screenSize.height))
        view.layer.masksToBounds = true
        
        let emitterLayer = CAEmitterLayer()
        emitterLayer.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        emitterLayer.emitterShape = .circle
        emitterLayer.emitterPosition = CGPoint(x: screenSize.width/2, y: -100)
        
        emitterLayer.emitterMode = .surface
        emitterLayer.renderMode = .oldestLast
        
        let cell = CAEmitterCell()
        cell.birthRate = 100
        cell.lifetime = 10
        cell.velocity = 100
        cell.scale = 0.1
        cell.emissionRange = CGFloat.pi
        
        cell.contents = UIImage(named: "snowflake")?.cgImage
        
        let cell2 = CAEmitterCell()
        cell2.birthRate = 100
        cell2.lifetime = 10
        cell2.velocity = 100
        cell2.scale = 0.1
        cell2.emissionRange = CGFloat.pi
        
        cell2.contents = UIImage(named: "test")?.cgImage
        
        emitterLayer.emitterCells = [cell]
        view.layer.addSublayer(emitterLayer)
        
        return view
        
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
