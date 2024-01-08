//
//  TappableView.swift
//  GetureRecognizerSwiftUITest
//
//  Created by Brandon Suarez on 1/8/24.
//

import SwiftUI

struct TappableView: UIViewRepresentable {
    
    var tapCallback: (UITapGestureRecognizer) -> Void
    var numberOfTouches: Int = 1
    var numberOfTaps: Int = 1
    
    func makeCoordinator() -> Coordinator {
        Coordinator(tapCallback: self.tapCallback)
    }
    
    
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        let multipleFingersTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(Coordinator.handleTap(gesture:)))
        multipleFingersTapRecognizer.numberOfTapsRequired = numberOfTaps
        multipleFingersTapRecognizer.numberOfTouchesRequired = numberOfTouches
        
        view.addGestureRecognizer(multipleFingersTapRecognizer)
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        
    }
    
    typealias UIViewType = UIView
    
    class Coordinator {
        var tapCallback: (UITapGestureRecognizer) -> Void
        
        init(tapCallback: @escaping (UITapGestureRecognizer) -> Void) {
            self.tapCallback = tapCallback
        }
        
        @objc func handleTap(gesture: UITapGestureRecognizer) {
            self.tapCallback
        }
    }
    
}


