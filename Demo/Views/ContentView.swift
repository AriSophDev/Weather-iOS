//
//  ContentView.swift
//  Demo
//
//  Created by Arian Sophia Large Richardson on 13/10/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    var weatherManager = WeatherManager()
    @State var weather: ResponseBody?
    
    
    var body: some View {
        VStack {
            
            if let location = locationManager.location {
                if let weather = weather {
                    WeatherView(weather: weather)
                    
                } else {
                    LoadingView()
                        .task {
                            do {
                                weather = try await weatherManager.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                            } catch {
                                print("error getting weather \(error)")
                            }
                        }
                }
                
            } else {
                if locationManager.isLoading{
                    LoadingView()
                } else {
                    WelcomeView()
                        .environmentObject(locationManager)
                }
            }
        }
        //style
        .background(Color(hue: 0.845, saturation: 0.158, brightness: 0.416))
        .preferredColorScheme(.dark)
        
    }
}

#Preview {
    ContentView()
}
