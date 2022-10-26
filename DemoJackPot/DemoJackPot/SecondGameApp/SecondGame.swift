
import SwiftUI
import Combine
struct SecondGame: View {
    
    //돌림판 부채꼴 위치(중심 포인트) 지정 상수
    let pieChartX = UIScreen.main.bounds.width / 2
    let pieChartY = UIScreen.main.bounds.height / 5
    
    @State private var appear : Bool = false
    
    //상태 프로퍼티 선언(Binding 사용을 피함)
    @State private var degree: Double = 0
    @State private var amountOfIncrease: Double = 0
    @State private var isRotating: Bool = false
    
    //선택된 Hero 값
    @State private var answerHero: String = ""
    @State private var isAllTokenUsed: Bool = false
    //Data 클래스로 최종 결과값 전달
    @EnvironmentObject var data : ResultData
    let timer = Timer.publish(every: 1.8 / 360, on: .main, in: .common).autoconnect()
    
    //각도에 따른 선택 Hero 찾기
    func answerDegree(degree: Double) -> Int {
        var tempMoney:Int = 0
        switch degree {
        case 0.0..<90.0 :
            tempMoney = 10000
        case 90.0..<180.0 :
            tempMoney = 100000
        case 180.0..<270.0 :
            tempMoney = 100
        case 270.0...360.0 :
            tempMoney = 50000
        default:
            break
        }
        if data.count < data.randomNum {
            data.resultMoneyArray.append(tempMoney)
            data.count += 1
            if data.count == data.randomNum {
                data.isAllTokenUsed = true
            }
        } 
        
        return tempMoney
    }
    
    var body: some View {
        VStack{
            
            Text("당신의 당첨금은 ?")
                .padding()
                .font(.title)
            
            ZStack {
                Image("doctor2")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                VStack{
                    
                    
                    //degree(=Demoview에 있는 Binding 변수), $degree(=ContentView에 있는 상태 프로퍼티)
                    Spacer()
                        .frame(height: 141)
                    Image(systemName: "arrow.down")
                        .padding(.trailing, 35)
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .font(.system(size: 50))
                    
                    RotateWheel(degree: $degree, amountOfIncrease: $amountOfIncrease, isRotating: $isRotating)
                    Spacer()
                    
                }
            }
            Spacer()
            Button {
                isRotating.toggle()
                amountOfIncrease = self.isRotating ? 1 : 0
                if !isRotating {
                    data.gameCounter()
                    answerHero = "\(data.gameCount). 돌림판 - \(answerDegree(degree: degree))원 당첨"
                    
                    data.setResultArray(result: answerHero)
                    
                    
                }
                if data.count == data.randomNum {
                    
                }
            } label: {
                Text(isRotating ? "멈추기" : (data.isAllTokenUsed ? "코인을 충전하세요" : "시작하기"))
                    .foregroundColor(.white)
                    .font(.title)
            }.padding(.all, 8)
                .background(Color(red : 0, green: 0, blue: 0.5))
                .clipShape(Capsule())
                .disabled(data.isAllTokenUsed)
            
        }
        
        
    }
}



struct SecondGame_Previews: PreviewProvider {
    static var previews: some View {
        SecondGame().environmentObject(ResultData())
    }
}
