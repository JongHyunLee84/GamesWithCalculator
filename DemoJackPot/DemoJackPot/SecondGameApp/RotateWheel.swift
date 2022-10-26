//
//  RotateWheelView.swift
//  wheelExam
//
//  Created by danny.ho_2PC on 2022/10/21.
//

import SwiftUI

struct RotateWheel: View {
    @Binding var degree: Double
    @Binding var amountOfIncrease: Double
    @Binding var isRotating: Bool

    //360도 한바퀴 돌릴 때 'every :' 에 들어가는 초만큼 빠르게 돌아감
    let timer = Timer.publish(every: 0.1 / 360, on: .main, in: .common).autoconnect()

    var body: some View {
        WheelView()
        .rotationEffect(Angle(degrees: self.degree))
        //amountOfIncrease로 부터 1씩 더해주면서 원판을 1도씩 돌려줌
        .onReceive(self.timer) { _ in
            self.degree += self.amountOfIncrease
            //truncatingRemainder는 모르겠습니다... 혹시 누군가 찾으신다면 지식 공유 부탁드립니다.
            self.degree = self.degree.truncatingRemainder(dividingBy: 360)
//            print(degree)
        }
    }
}

