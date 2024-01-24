//
//  ContentView.swift
//  VideoPlayerApp
//
//  Created by Prajwal U on 21/01/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HStack{
                ForEach(Query.allCases , id : \.self){ searchQuery in
                    QueryTag(query: searchQuery, isSelected: false)
                }
            }
        }
        .background(Color.accentColor)
        .padding()
    }
}

#Preview {
    ContentView()
}
