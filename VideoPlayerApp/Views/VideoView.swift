//
//  VideoView.swift
//  VideoPlayerApp
//
//  Created by Prajwal U on 24/01/24.
//

import AVKit
import SwiftUI

struct VideoView: View {
    var video: Video
    @State private var player = AVPlayer()
    var body: some View {
        VideoPlayer(player: player)
            .edgesIgnoringSafeArea(.all)
            .onAppear {
                if let link = video.videoFiles.first?.link {
                    player = AVPlayer(url: URL(string: link)!)
                    player.play()
                }
            }
    }
}

#Preview {
    VideoView(video: previewVideo)
}
