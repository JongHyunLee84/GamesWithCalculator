
import SwiftUI

@main
struct DemoJackPotApp: App {
    @EnvironmentObject var resultData : ResultData
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(ResultData())
        }
    }
}
