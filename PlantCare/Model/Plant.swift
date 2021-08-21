//
//  Plant.swift
//  PlantCare
//
//  Created by Dmitriy Shmilo on 21.08.2021.
//

import Foundation

enum Status: String {
	case healthy = "Healthy"
	case deteriorating = "Deteriorating"
	case critical = "Critical"
	case dead = "Dead"
}

struct Plant: Hashable, Identifiable {
	var id: Int {
		name.hash
	}
	
	let name: String
	let location: String
	let status: Status
	let water: Float
	let light: Float
	let temperature: Float
	let imageName: String
}

struct ModelData {
	static var plants: [Plant] = [
		.init(name: "Aloe Vera", location: "Living Room", status: .healthy, water: 0.66, light: 0.75, temperature: 0.55, imageName: "AloeVera"),
		.init(name: "Orchid", location: "Living Room", status: .healthy, water: 0.66, light: 0.75, temperature: 0.55, imageName: "Orchid"),
		.init(name: "Succulent", location: "Guest Room", status: .deteriorating, water: 0.66, light: 0.75, temperature: 0.55, imageName: "Succulent"),
	]
}
