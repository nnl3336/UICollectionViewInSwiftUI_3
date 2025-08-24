//
//  UICollectionViewInSwiftUI_3App.swift
//  UICollectionViewInSwiftUI_3
//
//  Created by Yuki Sasaki on 2025/08/24.
//

import SwiftUI

@main
struct UICollectionViewInSwiftUI_3App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
