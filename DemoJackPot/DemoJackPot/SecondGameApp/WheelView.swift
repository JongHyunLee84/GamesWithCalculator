//
//  WheelView.swift
//  wheelExam
//
//  Created by danny.ho_2PC on 2022/10/21.
//

import SwiftUI

struct WheelView : View {
    let pieChartX = UIScreen.main.bounds.width / 2.2
    let pieChartY = UIScreen.main.bounds.height / 5
    
    var body: some View {
        ZStack {
            Path { path in
                path.move(to: CGPoint(x: pieChartX, y: pieChartY))
                path.addArc(center: .init(x: pieChartX, y: pieChartY), radius: 150, startAngle: Angle(degrees: 0.0), endAngle: Angle(degrees:90), clockwise: false)
            }
            .fill(Color("Teal"))
            .overlay(alignment: .center){
                Text("100원")
                    .offset(x: 50, y : 60)
                    .fontWeight(.bold)
            }
            Path { path in
                path.move(to: CGPoint(x: pieChartX, y: pieChartY))
                path.addArc(center: .init(x: pieChartX, y: pieChartY), radius: 150, startAngle: Angle(degrees: 90), endAngle: Angle(degrees: 180), clockwise: false)
                
            }
            .fill(Color("Orange"))
            .overlay(alignment: .center){
                Text("100,000원")
                    .offset(x: -80, y : 60)
                    .fontWeight(.bold)
            }
            
            Path { path in
                path.move(to: CGPoint(x: pieChartX, y: pieChartY))
                path.addArc(center: .init(x: pieChartX, y: pieChartY), radius: 150, startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 270), clockwise: false)
            }
            .fill(Color("Yellow"))
            .overlay(alignment: .center){
                Text("10,000원")
                    .offset(x: -80, y : -60)
                    .fontWeight(.bold)
            }
            
            Path { path in
                path.move(to: CGPoint(x: pieChartX, y: pieChartY))
                path.addArc(center: .init(x: pieChartX, y: pieChartY), radius: 150, startAngle: Angle(degrees: 270), endAngle: Angle(degrees: 360), clockwise: false)
            }
            .fill(Color("Pink"))
            .overlay(alignment: .center){
                Text("50,000원")
                    .offset(x: 50, y : -60)
                    .fontWeight(.bold)
            }
            
            
        }.frame(height : pieChartY * 2).foregroundColor(.black)
    }
}

