//
//  AnimationGota.swift
//  Tummy
//
//  Created by Arantza Castro Dessavre on 26/11/24.
//

import SwiftUI

struct DropletAnimationView: View {
    // Array of droplet frames
    let dropletFrames = ["gota 1", "gota 2", "gota 3", "gota 4"]
    
    @State private var currentFrame = 0

    var body: some View {
        Image(dropletFrames[currentFrame]) // Display current frame
            .resizable()
            .scaledToFit()
            .frame(width: 100, height: 100)
            .onAppear {
                startAnimation()
            }
    }

    func startAnimation() {
        // Start a timer to update frames
        Timer.scheduledTimer(withTimeInterval: 0.25, repeats: true) { timer in
            currentFrame = (currentFrame + 1) % dropletFrames.count
        }
    }
}

#Preview {
    DropletAnimationView()
}
