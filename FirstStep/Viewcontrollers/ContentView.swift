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
                HStack{
                    Spacer()
                    sideMenu()
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
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
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


struct sideMenu: View {
    var body: some View {
            ZStack{
                Button(action: {
                    //open menu
                }, label: {
                    Image("Menu")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width:70, height:70)

                })
        }
            .padding(.trailing)
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
        .padding(.leading)
    }
}

struct menuItem: Identifiable{
    var id = UUID ()
    let text: String
    let imageName: String
    let handler: () -> Void = {
        print("Tapped Item")
    }
}
struct menuContent: View {
    let items: [menuItem] = [
        menuItem(text: "Home", imageName: "custom.flame.fill"),
        menuItem(text: "Journey", imageName: "figure.walk"),
        menuItem(text: "Leaderboard", imageName: "list.starl"),
        menuItem(text: "Achievements", imageName: "achievements"),
        menuItem(text: "Settings", imageName: "custom.gear"),
    
    ]
    
    var body: some View {
       
        ZStack {
            Color(UIColor(red: 33/255, green: 33/255, blue: 33/255, alpha: 1))
        }
        
        VStack(alignment: .leading, spacing: 0) {
            ForEach(items) { item in
                HStack{
                    Image(systemName: item.imageName)
                        .resizable()
                        .aspectRatio(contentMode:.fit)
                        .frame(width: 22, height: 22, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    Text(item.text)
                        .bold()
                        .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                        .font(.system(size: 20))
                    
                    Spacer()
                }
                .onTapGesture {
                    
                }
                .padding()
                Divider()
                
            }
            Spacer()
        }
        .padding(.top, 25)
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
