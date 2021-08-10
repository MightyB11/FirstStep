//
//  ContentView.swift
//  first_Prototype
//
//  Created by Mighty  on 30/7/2564 BE.
//

import SwiftUI
import HealthKit

struct ContentView: View {
    
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
        
        ZStack {
            Color(#colorLiteral(red: 0.8640606999, green: 0.9640640616, blue: 0.949200213, alpha: 1))
                .ignoresSafeArea()
            VStack(spacing:-50){
                topMenu() //menu and coin
                Spacer()
                stepCounter()
                attractions1()
                }
            }
    
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct topMenu: View {
    var body: some View {
        HStack(){
            Spacer()
            Button(action: {
                
            }, label: {
                Image("Menu")
                    .resizable()
                    .frame(width:70, height:70)
                    .padding(.trailing, 80.0)
                    .padding(.leading, 30.0)
            })
            Spacer()
            Button(action: {
                
            }, label: {
                Image("Coins")
                    . resizable()
                    .frame(width:150, height:150)
                    .padding(.leading, 50.0)
                    .padding(.trailing, 30.0)
            })
            Spacer()
        }
        .padding(.top, 40.0)
    
    }
}
    

struct stepCounter: View {
    var body: some View {
        VStack(spacing:-20){
            Button(action: {
                //Action
            }, label: {
                    Text("คุณมี")
                        .font(.system(size: 70, weight: .bold))
                        .foregroundColor(Color(#colorLiteral(red: 1, green: 0.8526533842, blue: 0.4547202587, alpha: 1)))
                
                        
            })
            Button(action: {
            }, label: {
                Text("4200")//connect with HealthUI
                    .font(.system(size:100, weight:.black))
                    .foregroundColor(Color(#colorLiteral(red: 1, green: 0.8526533842, blue: 0.4547202587, alpha: 1)))
                    .multilineTextAlignment(.center)
                    .lineLimit(nil)
                    .padding()
            })

            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("ก้าว")
                    .font(.system(size: 90, weight: .bold))
                    .foregroundColor(Color(#colorLiteral(red: 1, green: 0.8526533842, blue: 0.4547202587, alpha: 1)))
            })
    
        }
        .padding(.top, 100.0).padding(.horizontal, 15)
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
