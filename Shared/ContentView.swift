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
        ZStack {
            Cards()
            MainCard()
        }
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
struct Cards: View {
    var title: String
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color(red: 221 / 255, green: 190 / 255, blue: 169  / 255))
                .frame(width: 350, height: 400)
                .cornerRadius(13)
                .padding(15)
                .shadow(color: .gray, radius: 7, x: 5, y: 8)
            Text(title)
                .foregroundColor(.black)
                .font(.largeTitle)
                
        }
    }
}
struct MainCard: View {
    var title: String
        var body: some View {
            ZStack {
                Color.black.ignoresSafeArea()
                Rectangle()
                    .fill(Color(red: 203 / 255, green: 153 / 255, blue: 126 / 255))
                    .frame(width: 350, height: 400)
                    .cornerRadius(13)
                    .padding(15)
                    .shadow(color: .gray, radius: 7, x: 5, y: 8)
                Text(title)
                    .foregroundColor(.black)
                    .font(.largeTitle)
                
            }
        }
    }
    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

