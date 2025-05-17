//
//  CurrentWeatherCard.swift
//  WeatherApp
//
//  Created by Gamze Akyüz on 17.05.2025.
//

import SwiftUI

struct CurrentWeatherCard: View {
    
    let tempMax: Double
    let tempMin: Double
    let time: String
    let weatherCode: Int
    
    var body: some View {
        ZStack {
            VStack(spacing: 8) {
                Image(systemName: weatherCodeToIconName(weatherCode))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.cloudyCalm)
                HStack {
                    Text("Şu Anki Sıcaklık")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Text(" | ")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)
                        .multilineTextAlignment(.center)
                    Text(weatherCodeToDescription(weatherCode).uppercased())
                        .fontWeight(.heavy)
                        .foregroundColor(.gray)
                        .font(.callout)
                }
                
                Text(getDayLabel(from: time))
                    .font(.title)
                    .foregroundColor(.gray)
                Text("\(String(format: "%.1f", tempMax))°C")
                    .font(.system(size: 70))
                    .bold()
                    .foregroundColor(.gray)
                Text(" minimum °C ")
                    .font(.subheadline)
                    .bold()
                    .foregroundColor(.gray)
                Text("\(String(format: "%.1f", tempMin))°C")
                    .font(.system(size: 30))
                    .foregroundColor(.gray)
                
                
                
            }
            .frame(width: 350, height: 450)
            .background(LinearGradient(gradient: Gradient(colors: [Color("LavenderSky"), Color("AmberTwilight")]), startPoint: .topLeading, endPoint: .center))
            .border(.accent)
            .cornerRadius(50)
            .shadow(radius: 5)
        }
    }
    
}

struct CurrentWeatherCard_Previews: PreviewProvider {
    static var previews: some View {
        CurrentWeatherCard(tempMax: 0.0, tempMin: 0.0, time: "", weatherCode: 1)
    }
}
