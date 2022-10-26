//
//  ResultRecentFiveData.swift
//  wheelExam
//
//  Created by danny.ho_2PC on 2022/10/24.
//

import SwiftUI

struct ResultRecentFiveData: View {
    
    @EnvironmentObject var data : ResultData
    
    var body: some View {
        
        List {
            Section {
                Text("🦁최근 \(data.resultArray.count)번의 게임 결과🦁")
                .font(.title)
                .frame(minWidth: 0, maxWidth: .infinity)
            }
            
            ForEach(data.resultArray.reversed(), id:\.self) {
                Text("\($0)")
                    .multilineTextAlignment(.center)
                    .padding()
                    .font(.title2)
                    .fontWeight(.bold)
                    .frame(minWidth: 0, maxWidth: .infinity)
            }
            .onDelete(perform: deleteItems)
        }
        
    }
    
    func deleteItems(at offset: IndexSet) {
        data.resultArray.remove(atOffsets: offset)
    }
}

struct ResultRecentFiveData_Previews: PreviewProvider {
    static var previews: some View {
        ResultRecentFiveData().environmentObject(ResultData())
    }
}
