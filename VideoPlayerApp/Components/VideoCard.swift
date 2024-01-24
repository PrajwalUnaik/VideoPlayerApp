//
//  VideoCard.swift
//  VideoPlayerApp
//
//  Created by Prajwal U on 21/01/24.
//

import SwiftUI

struct VideoCard: View {
    var body: some View {
        ZStack {
            ZStack(alignment: .bottomLeading){
                AsyncImage(url: URL(string: "")){ image in
                    image.resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 160 , height: 250)
                        .cornerRadius(30)
                } placeholder: {
                    Rectangle()
                        .foregroundColor(.gray.opacity(0.3))
                        .frame(width: 160 , height: 250)
                        .cornerRadius(30)
                }
                VStack(alignment: .leading){
                    Text("32 sec")
                        .font(.caption).bold()
                    Text("By XYZ")
                        .font(.caption).bold()
                        .multilineTextAlignment(.leading)
                }
                .foregroundColor(.white)
                .shadow(radius: 10)
                .padding()
            }
            Image(systemName: "play.fill")
                .foregroundColor(.white)
                .font(.title)
                .padding()
                .background(.ultraThinMaterial)
                .cornerRadius(50)
        }
    }
}

#Preview {
    VideoCard()
}
