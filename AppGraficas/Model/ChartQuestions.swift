//
//  ChartQuestions.swift
//  AppGraficas
//
//  Created by Anahi Rojas on 03/10/21.
//

import Foundation

// MARK: - ResponseChart
struct ResponseChart: Codable {
    let colors: [String]
    let questions: [Question]
}

// MARK: - Question
struct Question: Codable {
    let total: Int
    let text: String
    let chartData: [ChartDatum]
}

// MARK: - ChartDatum
struct ChartDatum: Codable {
    let text: String
    let percetnage: Int
}
