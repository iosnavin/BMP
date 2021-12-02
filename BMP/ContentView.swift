//
//  ContentView.swift
//  BMP
//
//  Created by Naveen Reddy on 18/11/21.
//

import SwiftUI
import Combine


import SwiftUI



struct ContentView: View {
    @ObservedObject var vm = ViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.black
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    VStack {
                        HStack {
                            GenderView(image: "male", name: "Male")
                                .padding(.top, 50)
                                .padding(.leading, 70)
                            Spacer()
                            GenderView(image: "female", name: "Female")
                                .padding(.top, 50)
                                .padding(.trailing, 70)
                        }
                        Spacer()
                    }
                    VStack{
                        Texters(text: "HEIGHT", valueText: "\(String(format: "%.0f", vm.person.height))cm")
                        Slider(value: $vm.person.height, in: 0...200)
                            .frame(width: 300, height: 30)
                            .accentColor(Color.white)
                            .padding(.top, -10)
                    }
                    .padding(.bottom, 100)
                    HStack{
                        VStack{
                            Texters(text: "WEIGHT", valueText: "\(vm.person.weight)")
                            HStack{
                                Button(action: {
                                    vm.performWeight(action: .decrease)
                                }, label: {
                                    Image(systemName: "minus")
                                    .font(.system(size: 30))})
                                Button(action: {
                                    vm.performWeight(action: .increase)
                                }, label: {
                                    Image(systemName: "plus")
                                        .font(.system(size: 30))
                                })
                            }
                        }
                        .frame(width: 200, height: 100)
                        Spacer()
                        VStack{
                            Texters(text: "AGE", valueText: "\(vm.person.age)")
                            HStack{
                                Button(action: {
                                    vm.performAge(action: .decrease)
                                }, label: {
                                    Image(systemName: "minus")
                                    .font(.system(size: 30))})
                                Button(action: {
                                    vm.performAge(action: .increase)
                                }, label: {
                                    Image(systemName: "plus")
                                        .font(.system(size: 30))
                                })
                            }
                        }
                        .frame(width: 200, height: 100)
                    }
                    .padding(.bottom, 100)
                    
                    PrimaryButton(name: "CALCULATE YOUR BMI") {
                        self.vm.pushToDetail = true
                    }
                }
                NavigationLink("",destination: ResultView(vm: vm),
                               isActive: $vm.pushToDetail)
            }
            
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct GenderView: View {
    var image: String
    var name: String
    var colorChange: Color = .green
    
    var body: some View {
        VStack {
            Button {} label: {
                VStack{
                    Image(image)
                        .resizable()
                        .frame(width: 60, height: 60)
                    Text(name)
                        .foregroundColor(.gray)
                        .font(.headline)
                }
            }
        }
    }
}


struct Texters: View {
    var text: String
    var valueText: String
    var textColor: Color = .white
    
    var body: some View {
        Text(text)
            .bold()
            .foregroundColor(.gray)
            .font(.headline)
        Text(valueText)
            .font(.system(size: 50))
            .foregroundColor(textColor)
    }
}


struct PrimaryButton: View {
    let name: String
    var action: (()->())?
    
    var body: some View {
        Button(name) {
            action?()
        }
        .frame(width: 350, height: 50)
        .foregroundColor(Color.white)
        .background(Color.red)
        .cornerRadius(15.0)
        .padding(.bottom, 60)
    }
}
