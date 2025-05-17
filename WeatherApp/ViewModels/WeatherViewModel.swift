//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Gamze Akyüz on 17.05.2025.
//

import Foundation

class WeatherViewModel: ObservableObject {
    @Published var maxTemp: [Double] = []
    @Published var minTemp: [Double] = []
    @Published var dates: [String] = []
    @Published var errorMessage: String?
    @Published var weatherCodes: [Int] = []

    
    func fetchWeather(latitude: Double, longitude: Double) {
        let urlString  = "https://api.open-meteo.com/v1/forecast?latitude=\(latitude)&longitude=\(longitude)&daily=temperature_2m_max,temperature_2m_min,weathercode&timezone=auto"
        
        
        guard let url = URL(string: urlString) else {
            errorMessage = "Geçersiz URL"
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    self.errorMessage = "İstek hatası: \(error.localizedDescription)"
                    return
                }
                
                guard let data = data else {
                    self.errorMessage = "Veri alınamadı"
                    return
                }
                
                do {
                    let decoded = try JSONDecoder().decode(WeatherResponse.self, from: data)
                    self.maxTemp = decoded.daily.temperature_2m_max
                    self.minTemp = decoded.daily.temperature_2m_min
                    self.dates = decoded.daily.time
                    self.weatherCodes = decoded.daily.weathercode
                    self.errorMessage = nil
                } catch let decodingError as DecodingError {
                    switch decodingError {
                    case .keyNotFound(let key, _):
                        print("Eksik anahtar: \(key)")
                    case .typeMismatch(_, let context):
                        print("Tip uyuşmazlığı: \(context)")
                    case .valueNotFound(let value, let context):
                        print("Eksik değer: \(value), \(context)")
                    case .dataCorrupted(let context):
                        print("Veri bozulmuş: \(context)")
                    default:
                        print("Diğer hata: \(decodingError.localizedDescription)")
                    }
                }
                catch {
                    print(String(data: data, encoding: .utf8) ?? "Veri çözümlenemedi")
                    self.errorMessage = "Veri çözümlenemedi: \(error.localizedDescription)"
                }
            }
        }.resume()
    }
}
