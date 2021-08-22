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

struct Vitals<V>: Hashable
	where V: Hashable {

	let value: V
	let status: Status
	
	init(_ value: V, _ status: Status) {
		self.value = value
		self.status = status
	}
}

struct Plant: Hashable, Identifiable {
	var id: Int {
		name.hash
	}
	
	let name: String
	let location: String
	let status: Status
	let water: Vitals<Float>
	let light: Vitals<Float>
	let temperature: Vitals<Float>
	let imageName: String
}

struct ModelData {
	static var plants: [Plant] = [
		.init(
			name: "Aloe Vera",
			location: "Living Room",
			status: .healthy,
			water: .init(0.66, .healthy),
			light: .init(0.75, .healthy),
			temperature: .init(0.55, .healthy),
			imageName: "AloeVera"
		),
		.init(
			name: "Orchid",
			location: "Living Room",
			status: .healthy,
			water: .init(0.25, .deteriorating),
			light: .init(0.73, .healthy),
			temperature: .init(0.50, .healthy),
			imageName: "Orchid"
		),
		.init(
			name: "Succulent",
			location: "Guest Room",
			status: .deteriorating,
			water: .init(0.11, .critical),
			light: .init(0.90, .deteriorating),
			temperature: .init(0.80, .healthy),
			imageName: "Succulent"
		),
	]
}
