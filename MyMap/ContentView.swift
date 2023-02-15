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
                MapView(searchKey: displaySearchKey)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
