//
//  ContentView.swift
//  WeatherApp
//
//  Created by Gamze Akyüz on 17.05.2025.
//

import SwiftUI
import CoreLocation

struct ContentView: View {
    @StateObject private var locationManager = LocationManager()
    @StateObject private var viewModel = WeatherViewModel()
    
    let backgroundColor = LinearGradient(gradient: Gradient(colors: [Color("LavenderSky"), Color("AmberTwilight")]),startPoint: .top, endPoint: .bottom)
    
    var body: some View {
        NavigationView {
            ZStack {
                
                backgroundColor
                    .ignoresSafeArea()

                VStack(spacing: 20) {
                    Text("Senin Konumun")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .multilineTextAlignment(.center)
                        .bold()
                        .foregroundColor(.gray)
                        .padding(.all, 10)
                    
                    
                    if locationManager.location != nil {
                        contentForWeather()
                    } else {
                        PermissionView(status: locationManager.status)
                    }
                }
                .padding()
            }
            .onAppear {
                loadWeatherIfLocationAvailable()
            }
            .onReceive(locationManager.$location.compactMap { $0 }) { loc in
                viewModel.fetchWeather(latitude: loc.latitude, longitude: loc.longitude)
            }
            .navigationBarHidden(true)
        }
    }

    @ViewBuilder
    private func contentForWeather() -> some View {
        if let error = viewModel.errorMessage {
            Text(error)
                .foregroundColor(.red)
                .padding()
        } else if viewModel.maxTemp.isEmpty || viewModel.minTemp.isEmpty {
            ProgressView("Yükleniyor...")
                .scaleEffect(1.5)
                .padding()
        } else {
            VStack(spacing: 30) {
                CurrentWeatherCard(
                    tempMax: viewModel.maxTemp.first ?? 0.0,
                    tempMin: viewModel.minTemp.first ?? 0.0,
                    time: viewModel.dates.first ?? "",
                    weatherCode: viewModel.weatherCodes.first ?? 0
                )
                .transition(.scale)
                .animation(.easeInOut, value: viewModel.maxTemp)
                

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 30) {
                        ForEach(viewModel.dates.indices, id: \.self) { index in
                            DailyWeatherCard(
                                daily:
                                    viewModel.dates[index],
                                temperature: viewModel.maxTemp[index],
                                weatherCode: viewModel.weatherCodes[index]
                            )
                            .transition(.slide)
                            .animation(.easeInOut.delay(Double(index) * 0.05), value: viewModel.maxTemp)
                        }

                    }
                    .padding(.horizontal)
                }
                Spacer()
            }
        }
    }

    private func loadWeatherIfLocationAvailable() {
        if let location = locationManager.location {
            viewModel.fetchWeather(latitude: location.latitude, longitude: location.longitude)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
