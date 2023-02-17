//
//  ContentView.swift
//  MyMap
//
//  Created by Yoshino Hayashi on 2023/02/11.
//

import SwiftUI

struct ContentView: View {
    // 入力中の文字列を保持する状態変数
    @State var inputText: String = ""
    // 検索キーワードを保持する状態変数
    @State var displaySearchKey: String = ""
    // マップ種類 デフォルトは標準
    @State var displayMapType: MapType = .standard
    
    var body: some View {
        VStack {
            // テキストフィールド
            TextField("キーワード", text: $inputText, prompt: Text("キーワードを入力してください"))
            // 入力が完了した時
                .onSubmit {
                    // 入力したテキストを検索キーワードに設定
                    displaySearchKey = inputText
                }
            // 余白を追加
                .padding()
            // 奥から手前方向にレイアウト(右下基準で配置)
            ZStack(alignment: .bottomTrailing) {
                // マップを表示
                MapView(searchKey: displaySearchKey, mapType: displayMapType)
                
                // マップ切り替えボタン
                Button {
                    // 標準→衛生写真→衛生写真＋交通機関ラベル
                    if displayMapType == .standard {
                        displayMapType = .satellite
                    } else if displayMapType == .satellite {
                        displayMapType = .hybrid
                    } else {
                        displayMapType = .standard
                    }
                } label: {
                    // マップアイコンの表示
                    Image(systemName: "map")
                        .resizable()
                        .frame(width: 35.0, height: 35.0)
                }
                // 右の余白を20空ける
                .padding(.trailing, 20.0)
                // 下の余白を30空ける
                .padding(.bottom, 30.0)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
