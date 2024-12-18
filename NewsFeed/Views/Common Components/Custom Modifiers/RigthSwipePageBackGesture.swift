//
//  RigthSwipePageBackGesture.swift
//  NewsFeed
//
//  Created by Omkar Zanjale on 18/12/24.
//

import SwiftUI

struct RigthSwipePageBackGesture: ViewModifier {
    
    @GestureState var dragOffset: CGSize
    var didSwipeBack: ()->Void
    
    func body(content: Content) -> some View {
        content
            .gesture(DragGesture().updating($dragOffset, body: { (value, state, transaction) in
                if(value.startLocation.x < 20 &&
                   value.translation.width > 100) {
                    didSwipeBack()
                }
            }))
    }
}
