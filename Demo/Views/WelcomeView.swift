//
//  WelcomeView.swift
//  Demo
//
//  Created by Arian Sophia Large Richardson on 13/10/24.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    @EnvironmentObject var locationManager:
    LocationManager
    
    
    var body: some View {
        VStack{
            VStack(spacing: 20) {
              Text("Welcome to the Weather App")
                    .bold().font(.title)
                
                Text("Please share your location")
                    .padding()
            }
            .multilineTextAlignment(.center)
            .padding()
            
            LocationButton(.shareCurrentLocation) {
                locationManager.requestLocation()
            }
            .cornerRadius(25)
            .symbolVariant(.fill)
            .foregroundColor(.white)
            
        } .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    WelcomeView()
}
