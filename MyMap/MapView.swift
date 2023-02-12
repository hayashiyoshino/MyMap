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
        
        // CLGeocoderインスタンスを生成
        let geocoder = CLGeocoder()
        
        // 入力された文字から位置情報を取得
        geocoder.geocodeAddressString(
            searchKey,
            completionHandler: { (placemarks, error) in
                // リクエストの結果が存在し、1件目の情報から位置情報を取り出す
                if let placemarks,
                   let firstPlacemark = placemarks.first,
                   let location = firstPlacemark.location {
                    let targetCoordinate = location.coordinate
                    
                    // 緯度経度をデバッグエリアに表示
                    print("緯度経度：\(targetCoordinate)")
                }
                
            }
        )
    }
    
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(searchKey: "羽田空港")
    }
}
