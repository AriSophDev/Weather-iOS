//
//  WeatherView.swift
//  Demo
//
//  Created by Arian Sophia Large Richardson on 13/10/24.
//

import SwiftUI

struct WeatherView: View {
    var weather: ResponseBody
    
    var body: some View {
        ZStack(alignment: .leading) {
            VStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text(weather.name)
                        .bold()
                        .font(.title)
                    
                    Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .fontWeight(.light)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                VStack {
                    HStack {
                        VStack(spacing: 20) {
                            Image(systemName: "cloud")
                                .font(.system(size: 40))
                            
                            Text("\(weather.weather[0].main)")
                        }
                        .frame(width: 150, alignment: .leading)
                        
                        Spacer()
                        
                        Text((weather.main.feelsLike - 273.15).roundDouble() + "C°")
                            .font(.system(size: 50))
                            .fontWeight(.bold)
                            .padding()
                    }
                    
                    Spacer()
                        .frame(height:  80)
                    
                    AsyncImage(url: URL(string: "https://cdn.pixabay.com/photo/2020/01/24/21/33/city-4791269_960_720.png")) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 350)
                    } placeholder: {
                        ProgressView()
                    }
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack {
                Spacer()
                VStack(alignment: .leading, spacing: 20) {
                    Text("Weather now")
                        .bold()
                        .padding(.bottom)
                    
                    HStack {
                        // Min temperature conversion from Kelvin to Celsius
                        WeatherRow(logo: "thermometer", name: "Min temp", value:
                                    ((weather.main.tempMin - 273.15).roundDouble() + "°C"))
                        Spacer()
                        // Max temperature conversion from Kelvin to Celsius
                        WeatherRow(logo: "thermometer", name: "Max temp", value:
                                    ((weather.main.tempMax - 273.15).roundDouble() + "°C"))
                    }
                    
                    HStack {
                        WeatherRow(logo: "wind", name: "Wind speed", value:
                                    (weather.wind.speed.roundDouble() + " m/s"))
                        Spacer()
                        WeatherRow(logo: "humidity", name: "Humidity", value:
                                    "\(weather.main.humidity.roundDouble())%")
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.bottom, 20)
                .foregroundColor(Color(.black))
                .background(.white)
                .cornerRadius(20, corners: [.topLeft, .topRight])
            }

        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color(hue: 0.845, saturation: 0.158, brightness: 0.416))
        .preferredColorScheme(.dark)
    }
}

#Preview {
    WeatherView(weather: previewWeather)
}

