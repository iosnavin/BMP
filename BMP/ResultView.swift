//
//  ResultView.swift
//  BMP
//
//  Created by Naveen Reddy on 19/11/21.
//

import SwiftUI
import Combine

struct ResultView: View {
    var vm: ViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                ZStack{
                    Color.black.ignoresSafeArea()
                    VStack{
                        Texters(text: "", valueText:"",
                                textColor: Color(.systemBlue))
                            .padding(.bottom)
                        Text("Normal BMI range:")
                            .foregroundColor(.gray).bold()
                        Text("18.5 - 25 kg/m2")
                            .foregroundColor(.white).bold()
                            .padding(.bottom, 20)
                        Texters(text: "Your Age", valueText: "\(vm.person.age)",textColor: .orange)
                        
                        Text("")
                            .foregroundColor(.gray)
                            .padding()
                    }
                }
                PrimaryButton(name: "RECALCULATE YOUR BMI" ) {
                }
            }
//            NavigationLink(destination: ContentView(vm: vm), isActive: $vm.pushToDetail)
        }
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(vm: ViewModel())
    }
}
