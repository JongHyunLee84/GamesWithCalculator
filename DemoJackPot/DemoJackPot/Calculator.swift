//
//  Calculator.swift
//  DemoJackPot
//
//  Created by 이종현 on 2022/10/26.
//

import SwiftUI

struct Calculator: View {
    @EnvironmentObject var data : ResultData
    @State private var totalMoney: Int = 0
    var body: some View {
        VStack {
            List {
                Section(header:Text("🦁당첨 금액🦁").font(.title2)){
                    ForEach(data.resultMoneyArray, id:\.self) {
                        Text("\($0)")
                            .fontWeight(.bold)
                    }
                    
                }
                
            }
       
            
            Button {
                totalMoney = amount()
            } label: {
                Text("당첨금 합계 : \(totalMoney)원")
            }
            Divider()
            
            Button {
                data.isAllTokenUsed = true
                data.count = 0
                data.randomNum = 0
                data.resultMoneyArray = []
                totalMoney = 0
            } label: {
                Text("다시 하기")
            }

        }
        
    }
    func amount() -> Int {
        return data.resultMoneyArray.reduce(0, +)
        
    }
}

    


struct Calculator_Previews: PreviewProvider {
    static var previews: some View {
        Calculator().environmentObject(ResultData())
    }
}
