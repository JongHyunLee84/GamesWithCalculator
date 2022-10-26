//
//  HomeView.swift
//  DemoJackPot
//
//  Created by 이종현 on 2022/10/26.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var resultData: ResultData
    
    var body: some View {
        VStack{
            Text("🐯우리는 무적의 11조🐯")
                .padding(30)
                .font(.largeTitle)
                .fontWeight(.heavy)
            
            Text("최근 돌림판 결과는 \n\(resultData.resultArray.last ?? "없습니다")")
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
