//
//  SearchView.swift
//  IType App
//
//  Created by Daria Zvezdochkina on 29.03.2022.
//

import SwiftUI

struct SearchView: View {
  @ObservedObject private var searchViewModel = SearchViewModel()
  @State var isPresented: Bool = false
  @State var selectedSchedule: SearchViewModel.ScheduleVariants = .none
  
  var body: some View {
    NavigationView {
      ScrollView {
        VStack {
          HStack {
            Button(action: {
              print("button pressed")
            }) {
              Image(systemName: "clear")
                .renderingMode(.original)
                .resizable()
                .frame(width: 28, height: 28)
            }
            Spacer()
            Text(LocalizedStringKey("searchView.searchTitle"))
              .fontWeight(.semibold)
              .font(.title)
              .frame(maxWidth: .infinity, alignment: .center)
            Spacer()
            
            Button {
              isPresented.toggle()
            } label: { Image(systemName: "slider.vertical.3")
                .resizable()
                .frame(width: 28, height: 28)
              .foregroundColor(Color("MainFrameColor")) }
          }
          .sheetWithDetents(
            isPresented: $isPresented,
            detents: [.medium(),.large()]
          ) {
            print("The sheet has been dismissed")
          } content: {
            FiltersView(searchViewModel: searchViewModel, isPresented: $isPresented, selectedSchedule: $selectedSchedule)
          }
          if searchViewModel.text.isEmpty {
            Text("Please, scroll down to see \nthe search field")
              .multilineTextAlignment(.center)
              .padding()
              .foregroundColor(.gray)
          }
          VStack(spacing: 10) {
            ForEach(searchViewModel.vacancies) { vacancy in
              RoundedRectangle(cornerRadius: 30)
                .shadow(color: Color("MainFrameColor"), radius: 2)
                .overlay(
                  VStack {
                    NavigationLink(destination: DetailedVacancyView(viewModel: .init(vacancyId: vacancy.id))) {
                      VStack (spacing: 5) {
                        Text(vacancy.name)
                          .font(.title)
                          .fontWeight(.bold)
                          .padding()
                        
                        Text(vacancy.area.name)
                          .font(.headline)
                          .fontWeight(.bold)
                        Text(vacancy.employer.name)
                          .font(.headline)
                          .fontWeight(.bold)
                        if let requirement = vacancy.snippet.requirement {
                          Text(requirement)
                            .font(.footnote)
                            .padding()
                        }
                        Spacer()
                        if let salary = vacancy.salary {
                          Text(salary.description)
                            .font(.headline)
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .padding(.trailing, 16)
                          
                        }
                        Text(vacancy.schedule.description)
                          .font(.headline)
                          .fontWeight(.bold)
                          .frame(maxWidth: .infinity, alignment: .trailing)
                          .padding(.trailing, 16)
                          .padding(.bottom, 15)
                      }
                      .foregroundColor(.black)
                    }
                  }
                )
            }
            .foregroundColor(Color.white)
            .frame(height: 300)
            .padding()
          }
        }
        .navigationBarTitleDisplayMode(.inline)
        .padding()
        .searchable(text: $searchViewModel.text, prompt: LocalizedStringKey("homeView.searchKeyTerms"))
        .onSubmit(of: .search) {
          Task {
            await searchViewModel.fetchVacancies()
            
          }
        }
      }
    }
  }
}

struct SheetPresentationForSwiftUI<Content>: UIViewRepresentable where Content: View {
  
  @Binding var isPresented: Bool
  let onDismiss: (() -> Void)?
  let detents: [UISheetPresentationController.Detent]
  let content: Content
  
  init(
    _ isPresented: Binding<Bool>,
    onDismiss: (() -> Void)? = nil,
    detents: [UISheetPresentationController.Detent] = [.medium()],
    @ViewBuilder content: () -> Content
  ) {
    self._isPresented = isPresented
    self.onDismiss = onDismiss
    self.detents = detents
    self.content = content()
  }
  
  func makeUIView(context: Context) -> UIView {
    let view = UIView()
    return view
  }
  
  func updateUIView(_ uiView: UIView, context: Context) {
    
    let viewController = UIViewController()
    
    let hostingController = UIHostingController(rootView: content)
    
    viewController.addChild(hostingController)
    viewController.view.addSubview(hostingController.view)
    
    hostingController.view.translatesAutoresizingMaskIntoConstraints = false
    hostingController.view.leftAnchor.constraint(equalTo: viewController.view.leftAnchor).isActive = true
    hostingController.view.topAnchor.constraint(equalTo: viewController.view.topAnchor).isActive = true
    hostingController.view.rightAnchor.constraint(equalTo: viewController.view.rightAnchor).isActive = true
    hostingController.view.bottomAnchor.constraint(equalTo: viewController.view.bottomAnchor).isActive = true
    hostingController.didMove(toParent: viewController)
    
    if let sheetController = viewController.presentationController as? UISheetPresentationController {
      sheetController.detents = detents
      sheetController.prefersGrabberVisible = true
      sheetController.prefersScrollingExpandsWhenScrolledToEdge = false
      sheetController.largestUndimmedDetentIdentifier = .medium
    }
    
    viewController.presentationController?.delegate = context.coordinator
    
    
    if isPresented {
      uiView.window?.rootViewController?.present(viewController, animated: true)
    } else {
      uiView.window?.rootViewController?.dismiss(animated: true)
    }
    
  }
  

  func makeCoordinator() -> Coordinator {
    Coordinator(isPresented: $isPresented, onDismiss: onDismiss)
  }
  
  class Coordinator: NSObject, UISheetPresentationControllerDelegate {
    @Binding var isPresented: Bool
    let onDismiss: (() -> Void)?
    
    init(isPresented: Binding<Bool>, onDismiss: (() -> Void)? = nil) {
      self._isPresented = isPresented
      self.onDismiss = onDismiss
    }
    
    func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
      isPresented = false
      if let onDismiss = onDismiss {
        onDismiss()
      }
    }
    
  }
  
}

struct sheetWithDetentsViewModifier<SwiftUIContent>: ViewModifier where SwiftUIContent: View {
  
  @Binding var isPresented: Bool
  let onDismiss: (() -> Void)?
  let detents: [UISheetPresentationController.Detent]
  let swiftUIContent: SwiftUIContent
  
  init(isPresented: Binding<Bool>, detents: [UISheetPresentationController.Detent] = [.medium()] , onDismiss: (() -> Void)? = nil, content: () -> SwiftUIContent) {
    self._isPresented = isPresented
    self.onDismiss = onDismiss
    self.swiftUIContent = content()
    self.detents = detents
  }
  
  func body(content: Content) -> some View {
    ZStack {
      SheetPresentationForSwiftUI($isPresented,onDismiss: onDismiss, detents: detents) {
        swiftUIContent
      }.fixedSize()
      content
    }
  }
}

extension View {
  
  func sheetWithDetents<Content>(
    isPresented: Binding<Bool>,
    detents: [UISheetPresentationController.Detent],
    onDismiss: (() -> Void)?,
    content: @escaping () -> Content) -> some View where Content : View {
      modifier(
        sheetWithDetentsViewModifier(
          isPresented: isPresented,
          detents: detents,
          onDismiss: onDismiss,
          content: content)
      )
    }
}



struct SearchView_Previews: PreviewProvider {
  static var previews: some View {
    TabsView(route: .search)
  }
}
