//
//  User.swift
//  GitApp
//
//  Created by Indra Kurniawan on 11/01/24.
//

import Foundation

struct User: Codable {
    var name: String?
    var email: String?
    var login: String
    var id: Int
    var nodeID: String
    var avatarURL: String
    var gravatarID: String?
    var url: String
    var htmlURL: String
    var followersURL: String
    var followingURL: String
    var gistsURL: String
    var starredURL: String
    var subscriptionsURL: String
    var organizationsURL: String
    var reposURL: String
    var eventsURL: String
    var receivedEventsURL: String
    var type: String
    var siteAdmin: Bool
    var starredAt: String?

    enum CodingKeys: String, CodingKey {
        case name, email, login, id
        case nodeID = "node_id"
        case avatarURL = "avatar_url"
        case gravatarID = "gravatar_id"
        case url
        case htmlURL = "html_url"
        case followersURL = "followers_url"
        case followingURL = "following_url"
        case gistsURL = "gists_url"
        case starredURL = "starred_url"
        case subscriptionsURL = "subscriptions_url"
        case organizationsURL = "organizations_url"
        case reposURL = "repos_url"
        case eventsURL = "events_url"
        case receivedEventsURL = "received_events_url"
        case type
        case siteAdmin = "site_admin"
        case starredAt = "starred_at"
    }
}

