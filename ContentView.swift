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
    @State private var selectedItems: [String] = []

    var body: some View {
        VStack {
            CollectionViewRepresentable(items: data, selectedItems: $selectedItems)
                .frame(height: 300)

            Button("保存") {
                saveSelectedItems()
            }
            .padding()
        }
    }

    func saveSelectedItems() {
        print("保存するアイテム:", selectedItems)
        // ここで Core Data や UserDefaults に保存可能
    }
}
