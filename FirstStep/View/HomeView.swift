//
//  ContentView.swift
//  first_Prototype
//
//  Created by Mighty  on 30/7/2564 BE.
//

import SwiftUI
import HealthKit

struct HomeView: View {
    
    
    
    private var healthStore: HealthStore?
    @State private var steps: [Step] = [Step]()
    
    
    
    init() {
        healthStore = HealthStore()
    }
    
    private func updateUIFromStatistics(_ statisticsCollection: HKStatisticsCollection) {
        
        let startDate = Calendar.current.date(byAdding: .day, value: 0, to: Date())!
        let endDate = Date()
        
        statisticsCollection.enumerateStatistics(from: startDate, to: endDate) { (statistics, stop) in
            
            let count = statistics.sumQuantity()?.doubleValue(for: .count())
            
            let step = Step(count: Int(count ?? 0), date: statistics.startDate)
            steps.append(step)
                
        }
        
    }
   
    var body: some View {
            ZStack{
                Color(#colorLiteral(red: 0.8640606999, green: 0.9640640616, blue: 0.949200213, alpha: 1))
                    .ignoresSafeArea()
                
                VStack(spacing:-50){
                    HStack(spacing:0){
                        Spacer()
                        mainMenu()
                        Spacer()
                        coinStore()
                        Spacer()
                    }
                    .padding(.horizontal, -120)
                    Spacer()
                    stepCounter()
                    attractions1()
                    }
                .padding()
                
                }
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
        .onAppear {
            if let healthStore = healthStore {
                healthStore.requestAuthorization{ success in
                    if success {
                        healthStore.calculateSteps{ statisticsCollection in
                            if let statisticsCollection = statisticsCollection {
                                //update the UI
                                updateUIFromStatistics(statisticsCollection)
                            }
                        }
                    }
                }
            }
        }
    }
}

struct homeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


struct mainMenu: View {
    var body: some View {
        
        Button(action: {
        }, label: {
            Image("Menu")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:70, height:70)
        })
        .padding()
        .padding(.top,40)
        
        
    }
}
       
struct coinStore: View{
    var body: some View{
       
        Button(action: {
            //open coin store
            
        }, label: {
            Image("Coins")
                . resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:150, height:150)
                
        })
        .padding()
        .padding(.top,40)
    }
}

struct stepCounter: View {
    var body: some View {
        VStack(spacing:-20){
            Button {
                
            } label: {
                VStack(spacing: -20){
                    Text("YOU HAVE")
                        .font(Font.custom("CookieRun Black", size:70))
                            .foregroundColor(Color(#colorLiteral(red: 1, green: 0.8526533842, blue: 0.4547202587, alpha: 1)))
                    Text("4200")//connect with HealthUI
                        .font(.system(size:100, weight:.black))
                        .foregroundColor(Color(#colorLiteral(red: 1, green: 0.8526533842, blue: 0.4547202587, alpha: 1)))
                        .multilineTextAlignment(.center)
                        .lineLimit(nil)
                        .padding()
                    Text("STEPS")
                        .font(Font.custom("CookieRun Regular", size:90))
                    .foregroundColor(Color(#colorLiteral(red: 1, green: 0.8526533842, blue: 0.4547202587, alpha: 1)))
                }
                    
        
        }
        }
        .padding()
        .padding(.top, 100.0)
        .padding(.horizontal, 15)
    }
}

struct attractions1: View {
    var body: some View {
        VStack(spacing:-250){
            Image("Attractions")
                .resizable()
                .aspectRatio(contentMode: .fit)
            Image("Road")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 450.0)
                .ignoresSafeArea()
            
        }
    }
}

