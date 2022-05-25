import SwiftUI

struct SettingsView: View {
  init() {
    UITableView.adjustTopInset()
  }
  
  var body: some View {
    NavigationView {
      List {
        Section {
          Button(action: {}) {
            SettingsCell(title: LocalizedStringKey("settingsView.notifications"), imgNmae: "bell", clr: Color("MainFrameColor"))
          }
          .foregroundColor(.black)
          
          Button(action: {}) {
            SettingsCell(title: LocalizedStringKey("settingsView.profile"), imgNmae: "person", clr: Color("MainFrameColor"))
          }
          .foregroundColor(.black)
          
          Button(action: {}) {
            SettingsCell(title: LocalizedStringKey("settingsView.aboutUs"), imgNmae: "message", clr: Color("MainFrameColor"))
          }
          .foregroundColor(.black)
          Button(action: {}) {
            SettingsCell(title: LocalizedStringKey("settingsView.help"), imgNmae: "questionmark.circle", clr: Color("MainFrameColor"))
          }
          .foregroundColor(.black)
          
        }
      }
      .navigationTitle(LocalizedStringKey("settingsView.navigationTitle"))
    }
  }
}



struct SettingsView_Previews: PreviewProvider {
  static var previews: some View {
    TabsView(route: .settings)
    //              .environment(\.locale, .init(identifier: "ru"))
    
  }
}

// MARK: - Helpers

extension CGFloat {
  fileprivate static var topInset: CGFloat { 10 }
}

extension UIView {
  fileprivate static var spacer: UIView {
    let view = UIView(frame: .init(x: 0, y: 0, width: 0, height: .topInset))
    view.backgroundColor = .clear
    return view
  }
}

extension UITableView {
  fileprivate static func adjustTopInset() {
    appearance().tableHeaderView = .spacer
  }
}
