//
//  HomePage.swift
//  VideoPlayerApp
//
//  Created by Prajwal U on 24/01/24.
//

import SwiftUI

struct HomePage: View {
    @State private var scale: CGFloat = 1.0
    @State private var scale1: CGFloat = 1.0

    var body: some View {
        NavigationView {
            VStack {
                Image("Pexel_Logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 90)
                    .padding(.bottom, 50)
                Text("Pexels")
                    .font(.custom("YourCustomFont", size: 36))
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                    .fontDesign(.monospaced)
                    .padding(.bottom, 5)
                    .onAppear {
                        withAnimation(.easeInOut(duration: 2.0).repeatCount(2)) {
                            scale = 1.5
                        }
                    }
                    .scaleEffect(scale)
                    .padding(.bottom)

                Text("Empowering Creators")
                    .font(.title3)
                    .foregroundColor(.gray.opacity(0.6))
                    .fontDesign(.monospaced)

                Text("By providing free stock photos Pexels helps millions of creators all over the world to easily create beautiful products and designs.")
                    .multilineTextAlignment(.center)
                    .fontDesign(.monospaced)
                    .padding()
                    .padding()

                NavigationLink(destination: VideoViewMain()) {
                    Text("Explore Videos")
                        .bold()
                        .foregroundColor(.primary)
                        .padding()
                        .background(.thinMaterial)
                        .cornerRadius(15)
                }.scaleEffect(scale1)
                    .onAppear {
                        withAnimation(.bouncy(duration: 2.0).repeatForever()) {
                            scale1 = 1.1
                        }
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
