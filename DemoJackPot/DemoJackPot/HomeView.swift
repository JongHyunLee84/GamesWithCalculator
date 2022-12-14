//
//  HomeView.swift
//  DemoJackPot
//
//  Created by ์ด์ขํ on 2022/10/26.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var resultData: ResultData
    
    var body: some View {
        VStack{
            Text("๐ฏ์ฐ๋ฆฌ๋ ๋ฌด์ ์ 11์กฐ๐ฏ")
                .padding(30)
                .font(.largeTitle)
                .fontWeight(.heavy)
            
            Text("์ต๊ทผ ๋๋ฆผํ ๊ฒฐ๊ณผ๋ \n\(resultData.resultArray.last ?? "์์ต๋๋ค")")
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().environmentObject(ResultData())
    }
}
