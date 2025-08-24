//
//  CollectionViewRepresentable.swift
//  UICollectionViewInSwiftUI_3
//
//  Created by Yuki Sasaki on 2025/08/24.
//

import SwiftUI
import UIKit

struct CollectionViewRepresentable: UIViewRepresentable {
    var items: [String]
    @Binding var selectedItems: [String]  // ← SwiftUI 側に反映

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIView(context: Context) -> UICollectionView {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 100, height: 100)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = context.coordinator
        collectionView.delegate = context.coordinator
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView.backgroundColor = .clear
        return collectionView
    }

    func updateUIView(_ uiView: UICollectionView, context: Context) {
        uiView.reloadData()
    }

    class Coordinator: NSObject, UICollectionViewDataSource, UICollectionViewDelegate {
        var parent: CollectionViewRepresentable

        init(_ parent: CollectionViewRepresentable) {
            self.parent = parent
        }

        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            parent.items.count
        }

        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
            cell.backgroundColor = parent.selectedItems.contains(parent.items[indexPath.item]) ? .green : .blue

            let tag = 100
            let label: UILabel
            if let existingLabel = cell.viewWithTag(tag) as? UILabel {
                label = existingLabel
            } else {
                label = UILabel(frame: cell.contentView.bounds)
                label.tag = tag
                label.textAlignment = .center
                label.textColor = .white
                cell.contentView.addSubview(label)
            }
            label.text = parent.items[indexPath.item]
            return cell
        }

        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            let item = parent.items[indexPath.item]
            if let index = parent.selectedItems.firstIndex(of: item) {
                parent.selectedItems.remove(at: index)
            } else {
                parent.selectedItems.append(item)
            }
            collectionView.reloadItems(at: [indexPath])
        }
    }
}
