//
//  PermissionView.swift
//  WeatherApp
//
//  Created by Gamze Akyüz on 17.05.2025.
//

import SwiftUI
import CoreLocation

struct PermissionView: View {
    let status: CLAuthorizationStatus?
    
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "location.slash")
                .resizable()
                .scaledToFit()
                .frame(width: 90, height: 90)
                .foregroundColor(.red)
            
            Text("Konum izni bekleniyor veya alınamadı.")
                .font(.headline)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            if let status = status {
                switch status {
                case .notDetermined:
                    Text("Lütfen konum iznini onaylayın.")
                        .foregroundColor(.gray)
                case .denied, .restricted:
                    Text("Konum izni reddedildi. Ayarlardan izin verin.")
                        .foregroundColor(.red)
                default:
                    EmptyView()
                }
            }
            
            ProgressView()
        }
        .padding()
    }
}


struct PermissionView_Previews: PreviewProvider {
    static var previews: some View {
        PermissionView(status: .authorizedAlways)
    }
}
