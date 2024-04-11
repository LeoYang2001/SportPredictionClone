//
//  NewsModel.swift
//  SportPrediction_clone
//
//  Created by 杨嘉煌 on 4/9/24.
//

import Foundation


struct NewsArticle : Decodable {
    let publishedAt: publishedAt
    let urlToImage: urlToImage
    let description: description
    let ID: ID
    let url: url
    let author: auther
    let title: title
}

struct NewsResponse : Decodable{
    let body: [NewsArticle]
}

struct publishedAt: Decodable {
    let S: String
}

struct urlToImage: Decodable {
    let S: String
}

struct description: Decodable {
    let S: String
}

struct ID: Decodable {
    let S: String
}

struct url: Decodable {
    let S: String
}

struct auther: Decodable {
    let S: String
}
struct title: Decodable {
    let S: String
}
