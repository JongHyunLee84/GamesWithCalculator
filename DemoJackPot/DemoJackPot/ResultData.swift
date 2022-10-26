//
//  ResultData.swift
//  wheelExam
//
//  Created by danny.ho_2PC on 2022/10/24.
//

import Foundation

class ResultData: ObservableObject {
    //밖의 view의 입장에서는 published를 get 용도로 쓰는 게 좋다. set 용도로 쓸려면 observabledobject로 사용하는게 좋다.
    //메소드 하나를 만들어 줘야지
    @Published var resultArray: [String] = []
    @Published var gameCount: Int = 0
    @Published var resultMoneyArray : [Int] = []
    @Published var randomNum : Int = 0
    @Published var count : Int = 0
    @Published var isAllTokenUsed : Bool = true
    //set 메소드 - resultArray에 결과를 append하는 함수
    func setResultArray(result: String) {
        resultArray.append(result)
    }
    
    func gameCounter() {
        gameCount += 1
    }
}
