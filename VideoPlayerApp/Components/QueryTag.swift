//
//  QueryTag.swift
//  VideoPlayerApp
//
//  Created by Prajwal U on 21/01/24.
//

import SwiftUI

struct QueryTag: View {
    
    var query:Query
    @State var isSelected:Bool = false
    
    var body: some View {
        
        Text(query.rawValue)
            .font(.caption)
            .bold()
            .foregroundColor(isSelected ? .black : .gray)
            .padding(10)
            .background(.ultraThinMaterial)
            .cornerRadius(10)
            .onTapGesture {
                isSelected.toggle()
            }
    }
}

#Preview {
    QueryTag(query: Query.food, isSelected: true)
}
