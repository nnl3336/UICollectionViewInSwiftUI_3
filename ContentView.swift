//
//  ContentView.swift
//  UICollectionViewInSwiftUI_3
//
//  Created by Yuki Sasaki on 2025/08/24.
//

import SwiftUI
import CoreData

struct ContentView: View {
    let data = ["A", "B", "C", "D", "E"]

    var body: some View {
        CollectionViewRepresentable(items: data)
            .frame(height: 300)
    }
}
