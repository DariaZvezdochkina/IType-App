import SwiftUI

struct ContentView: View {
  @State var isActive: Bool = false
  
  var body: some View {
    SplashView()
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
