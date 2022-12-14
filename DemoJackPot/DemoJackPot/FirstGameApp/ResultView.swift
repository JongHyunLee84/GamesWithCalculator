

import SwiftUI

struct ResultView: View {
    
    @Binding var randomNum: Int
    @State private var appear = false
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        VStack {
            Text("\(randomNum)번 참여 가능합니다~!")
                .font(.largeTitle)
                .padding()
            
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Text("돌아가기")
                    .font(.title)
                    .padding()
            }
        }
    }
}
