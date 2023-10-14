//
//  MovieModel.swift
//  MovieInfoX
//
//  Created by Umer Hamid Khani on 13/10/2023.
//

import Foundation

struct Movie: Decodable {
    let id: Int
    let title: String
    let overview: String
}
