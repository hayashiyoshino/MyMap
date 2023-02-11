//
//  MapView.swift
//  MyMap
//
//  Created by Yoshino Hayashi on 2023/02/11.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    // 検索キーワード
    let searchKey: String
    
    // 表示する View を作成する時に実行
    func makeUIView(context: Context) -> MKMapView {
        // MKMapView のインスタンス生成
        MKMapView()
    }
    
    // 表示した View が更新されるたびに実行
    func updateUIView(_ uiView: MKMapView, context: Context) {
        print("検索キーワード：\(searchKey)")
    }
    
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(searchKey: "羽田空港")
    }
}
