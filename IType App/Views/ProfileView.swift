import Foundation
import SwiftUI

struct ProfileView: View {
  var body: some View {
    NavigationView {
      VStack {
        Image("resume")
          .resizable()
          .frame(width: 120, height: 130)
          .padding(EdgeInsets(top: 0, leading: 10, bottom: 40, trailing: 0))
        Text(LocalizedStringKey("profileView.createResumePhrase"))
          .fontWeight(.bold)
          .font(.system(size: 34))
          .padding(EdgeInsets(top: 0, leading: 0, bottom: 25, trailing: 0))
          .multilineTextAlignment(.center)
        Text(LocalizedStringKey("profileView.fillInfo"))
          .multilineTextAlignment(.center)
          .padding(EdgeInsets(top: 0, leading: 0, bottom: 70, trailing: 0))
        Button(action: {
          print("Create tapped!")
        }) {
          HStack {
            Text(LocalizedStringKey("profileView.createButton"))
              .fontWeight(.bold)
              .font(.title)
          }
          .frame(width: 150, height: 30)
          .padding()
          .foregroundColor(Color("MainFrameColor"))
          .background(.white)
          .cornerRadius(40)
          .shadow(color: Color("MainFrameColor"), radius: 5)
        }
      }
      .navigationTitle(LocalizedStringKey("profileView.navigationTitle"))
    }
    .padding()
  }
}

struct ProfileView_Previews: PreviewProvider {
  static var previews: some View {
    TabsView(route: .profile)
    //        .environment(\.locale, .init(identifier: "ru"))
  }
}
