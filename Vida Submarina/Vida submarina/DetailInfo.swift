//
//  DetailInfo.swift
//  Vida submarina
//
//  Created by CEDAM 13 on 25/04/23.
//

import SwiftUI
import MapKit

struct DetailInfo: View {
    var nombre : String
    var flora : String
    var fauna : String
    var clima : String
    
    @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 27.36, longitude: -113.39), span: MKCoordinateSpan(latitudeDelta: 5, longitudeDelta: 5))
    
    var animales = ["marsopa1", "ballena1", "delfines1", "manaties1", "dugongos1", "focas", "otaridos1", "ballenagris1", "ballenajorobada", "ballenaazul1", "tortugamarina1", "vaquitamarina", "totoaba", "abulonblanco", "caballitodemar", "pezdedecierto", "estrellamar",]
    
    var body: some View {
        ZStack {
            Rectangle().fill(Gradient(colors: [.white, .white, Color(hex: 0xffD168FF, alpha: 0.9), Color(hex: 0xff05BFE8)]))
                .ignoresSafeArea()
            ScrollView {
                VStack{
                    Map(coordinateRegion: $mapRegion).frame(width: 450, height: 300)
                    Text(nombre)
                    Text("Flora de la región:").font(.largeTitle)
                    Text(flora)
                    Text("Fauna de la región:").font(.largeTitle)
                    Text(fauna)
                    Text("Clima habitual del lugar:").font(.largeTitle)
                    Text(clima)
                    ScrollView(.horizontal){
                        ForEach(0..<17){photo in
                            HStack(spacing: 20){
                                Image(animales[photo]).resizable().frame(width: 300, height: 250)
                            }
                        }
                    }
                    Spacer()
                }
            }
        }
    }
}

struct DetailInfo_Previews: PreviewProvider {
    static var previews: some View {
        DetailInfo(nombre: "", flora: "", fauna: "", clima: "")
    }
}
