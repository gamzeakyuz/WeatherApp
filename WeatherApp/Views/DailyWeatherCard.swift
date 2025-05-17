//
//  DailyWeatherCard.swift
//  WeatherApp
//
//  Created by Gamze Akyüz on 17.05.2025.
//

import SwiftUI

struct DailyWeatherCard: View {
    let daily: String
    let temperature: Double
    let weatherCode: Int
    
    var body: some View {
        VStack {
            
            
            
            VStack(spacing: 10) {
                
                Image(systemName: weatherCodeToIconName(weatherCode))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 60, height: 60)
                    .foregroundColor(.cloudyCalm)
                    .padding(.top)
                
                HStack(spacing: 10) {
                    
                    Text(getDayLabel(from: daily))
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .padding(.leading, 10)
                    
                    Text(" | ")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)
                        .multilineTextAlignment(.center)
                    
                    Text(weatherCodeToDescription(weatherCode))
                        .font(.headline)
                        .multilineTextAlignment(.center)
                        .bold()
                        .foregroundColor(.gray)
                }
                
                Text("\(String(format: "%.1f", temperature))°C")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.black)
                    .padding(.top)
            }
            
        }
        .frame(width: 350, height: 200)
        .background(LinearGradient(gradient: Gradient(colors: [Color("LavenderSky"), Color("AmberTwilight")]), startPoint: .bottomTrailing, endPoint: .topTrailing))
        .border(.accent)
        .cornerRadius(50)
        .shadow(radius: 5)
        
    }
}

struct HourlyWeatherCard_Previews: PreviewProvider {
    static var previews: some View {
        DailyWeatherCard(daily: "2025-05-17", temperature: 20.0, weatherCode: 1)
    }
}
