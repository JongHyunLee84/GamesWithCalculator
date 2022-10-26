
import SwiftUI


struct ContentView: View {
    
    @EnvironmentObject var resultData: ResultData
    @State private var tabSelection = 1
    
    var body: some View {
        TabView(selection: $tabSelection){
            NavigationView{
                HomeView()
            }.tabItem{
                Image(systemName: "house.fill")
                Text("Home")
            }.tag(1)
            
            NavigationView{
                FirstGame()
            }.tabItem{
                Image(systemName: "gamecontroller")
                Text("JackPot 시작하기")
            }.tag(2)
            
            NavigationView{
                    SecondGame()
            }.tabItem{
                Image(systemName: "gamecontroller")
                Text("돌려돌려 돌림판")
            }.tag(3)
            
            NavigationView{
                Calculator()
            }.tabItem{
                Image(systemName: "gamecontroller")
                Text("결과 계산하기")
            }.tag(4)
            
            NavigationView{
                ResultRecentFiveData()
            }.tabItem{
                Image(systemName: "arrowtriangle.right.circle")
                Text("최근 결과 확인하기")
            }.tag(5)
            
           
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(ResultData())
    }
}


