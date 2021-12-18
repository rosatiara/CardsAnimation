//
//  ContentView.swift
//  Shared
//
//  Created by T on 18/12/21.
//

import SwiftUI

struct ContentView: View {
    @GestureState var dragState = DragState.inactive
    var body: some View {
        
        let dragGesture = DragGesture()
            .updating($dragState){
                (value, state, transaction) in state = .dragging(translation: value.translation)
            }
        Card()
        
    }
    
    enum DragState {
        case inactive, dragging(translation: CGSize)
        
        var translation: CGSize {
            switch self {
            case .inactive:
                return .zero
            case .dragging(let translation):
                return translation
            
        }
            
            var isActive: Bool {
                switch self {
                case .inactive:
                    return false
                case .dragging:
                    return true
                }
            }
        }
    }
}

struct Card: View {
        var body: some View {
            ZStack {
                Rectangle()
                    .fill(Color.white)
                    .frame(width: 200, height: 300)
                Text("hellooooo")
            }
        }
    }
    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

