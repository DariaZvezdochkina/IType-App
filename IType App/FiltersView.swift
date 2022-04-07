//
//  FiltersView.swift
//  IType App
//
//  Created by Daria Zvezdochkina on 07.04.2022.
//

import SwiftUI

struct FiltersView: View {
  
  @ObservedObject var searchViewModel: SearchViewModel
  @Binding var isPresented: Bool
  @Binding var selectedSchedule: SearchViewModel.ScheduleVariants
  
    var body: some View {
      VStack(spacing: 25) {
        VStack {
          HStack {
            Text("Salary")
              .fontWeight(.semibold)
              .font(.title)
              .frame(maxWidth: .infinity, alignment: .leading)
            Spacer()
            Toggle("", isOn: $searchViewModel.isPresentedSalaryTo)
              .toggleStyle(SwitchToggleStyle(tint: Color("MainFrameColor")))
            
          }
          if searchViewModel.isPresentedSalaryTo {
            HStack {
              Text("To:")
              Spacer()
              TextField("Type amount", text: $searchViewModel.salaryTo)
                .onSubmit {
                  Task {
                    await searchViewModel.fetchVacancies()
                    
                  }
                }
            }
          }
        }
        .padding(25)
        VStack {
          Text("Schedule")
            .fontWeight(.semibold)
            .font(.title)
            .frame(maxWidth: .infinity, alignment: .leading)
          HStack{
            Spacer()
            VStack{
              Picker(selection: $selectedSchedule, label: Text("Schedule")) {
                ForEach(SearchViewModel.ScheduleVariants.allCases, id: \.self) { sch in
                  Text("\(sch.rawValue)")
                }
              }
              .pickerStyle(SegmentedPickerStyle())
            }
          }
        }
        .padding(25)
        Spacer()
      }
    }
}

struct FiltersView_Previews: PreviewProvider {
    static var previews: some View {
      FiltersView(searchViewModel: SearchViewModel(), isPresented: .constant(true), selectedSchedule: .constant(.none))
    }
}
