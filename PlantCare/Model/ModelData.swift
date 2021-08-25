//
//  ModelData.swift
//  PlantCare
//
//  Created by Dmitriy Shmilo on 25.08.2021.
//

import Foundation

struct ModelData {
	static var plants: [Plant] = [
		.init(
			name: "Aloe Vera",
			location: "Living Room",
			status: .healthy,
			water: .init(0.66, .percent, .healthy),
			light: .init(0.75, .percent, .healthy),
			temperature: .init(0.25, .degrees, .healthy),
			imageName: "AloeVera"
		),
		.init(
			name: "Orchid",
			location: "Living Room",
			status: .healthy,
			water: .init(0.25, .percent, .deteriorating),
			light: .init(0.73, .percent, .healthy),
			temperature: .init(0.243, .degrees, .healthy),
			imageName: "Orchid"
		),
		.init(
			name: "Succulent",
			location: "Guest Room",
			status: .deteriorating,
			water: .init(0.11, .percent, .critical),
			light: .init(0.90, .percent, .deteriorating),
			temperature: .init(0.433, .degrees, .healthy),
			imageName: "Succulent"
		),
	]
}
