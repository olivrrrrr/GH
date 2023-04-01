//
//  ErrorMessage.swift
//  GH
//
//  Created by Oliver Ekwalla on 31/03/2023.
//

import Foundation

enum GFError: String, Error{
    case invalidUsername  = "This username returned an invalid URL. Please try again."
    case unableToComplete = "Unable to complete your request. Please check your internet connection."
    case invalidResponse  = "Invalid response from server. Please try again"
    case invalidData      = "The data received from the server was invalid. Please try again."
}
