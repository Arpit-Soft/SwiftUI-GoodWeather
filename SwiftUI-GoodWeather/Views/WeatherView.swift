//
//  ContentView.swift
//  SwiftUI-GoodWeather
//
//  Created by Arpit Dixit on 23/06/21.
//

import SwiftUI

struct WeatherView: View {
    
    @ObservedObject var weatherVM: WeatherViewModel
    
    init() {
        self.weatherVM = WeatherViewModel()
    }
    
    var body: some View {
        VStack(alignment: .center) {
            
            TextField("Enter city name", text: self.$weatherVM.cityName, onCommit:  {
                self.weatherVM.search()
            })
            .font(.custom("Arial", size: 50))
            .multilineTextAlignment(.center)
            .padding()
            .fixedSize()
            
            Text(self.weatherVM.temperature)
            .font(.custom("Arial", size: 100))
            .foregroundColor(Color.white)
            .padding()
            
            
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(Color.green)
        .edgesIgnoringSafeArea(.all)
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}
#endif
