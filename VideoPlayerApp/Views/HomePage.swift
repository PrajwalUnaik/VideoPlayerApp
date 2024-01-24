//
//  HomePage.swift
//  VideoPlayerApp
//
//  Created by Prajwal U on 24/01/24.
//

import SwiftUI

struct HomePage: View {
    @State private var scale: CGFloat = 1.0
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Pexels")
                    .font(.custom("YourCustomFont", size: 36))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .shadow(color: .black, radius: 2, x: 0, y: 2)
                    .padding(.bottom, 5)
                    .onAppear {
                        withAnimation(.easeInOut(duration: 2.0).repeatForever()) {
                            scale = 1.2
                        }
                    }
                    .scaleEffect(scale)
                
                Text("Empowering Creators")
                    .font(.headline)
                    .foregroundColor(.gray.opacity(0.6))
                
                Image(systemName: "hand.point.down.fill")
                    .frame(width: 30, height: 30)
                    .foregroundColor(.black)
                
                NavigationLink(destination: VideoViewMain()) {
                    Text("Explore Videos")
                        .foregroundColor(.primary)
                        .padding()
                        .background(.thinMaterial)
                        .cornerRadius(15)
                }
                .padding(.top, 20)
            }
            .padding()
        }
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}
