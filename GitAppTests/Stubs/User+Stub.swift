//
//  User+Stub.swift
//  GitAppTests
//
//  Created by Indra Kurniawan on 11/01/24.
//

import Foundation

extension User {
    static func stub(
        login: String = "octocat",
        id: Int = 1,
        nodeID: String = "MDQ6VXNlcjE=",
        avatarURL: URL = URL(string: "https://github.com/images/error/octocat_happy.gif")!,
        gravatarID: String = "",
        url: URL = URL(string: "https://api.github.com/users/octocat")!,
        htmlURL: URL = URL(string: "https://github.com/octocat")!,
        followersURL: URL = URL(string: "https://api.github.com/users/octocat/followers")!,
        followingURL: String = "https://api.github.com/users/octocat/following{/other_user}",
        gistsURL: String = "https://api.github.com/users/octocat/gists{/gist_id}",
        starredURL: String = "https://api.github.com/users/octocat/starred{/owner}{/repo}",
        subscriptionsURL: URL = URL(string: "https://api.github.com/users/octocat/subscriptions")!,
        organizationsURL: URL = URL(string: "https://api.github.com/users/octocat/orgs")!,
        reposURL: URL = URL(string: "https://api.github.com/users/octocat/repos")!,
        eventsURL: String = "https://api.github.com/users/octocat/events{/privacy}",
        receivedEventsURL: URL = URL(string: "https://api.github.com/users/octocat/received_events")!,
        type: String = "User",
        siteAdmin: Bool = false
    ) -> User {
        return User(
            login: login,
            id: id,
            nodeID: nodeID,
            avatarURL: avatarURL,
            gravatarID: gravatarID,
            url: url,
            htmlURL: htmlURL,
            followersURL: followersURL,
            followingURL: followingURL,
            gistsURL: gistsURL,
            starredURL: starredURL,
            subscriptionsURL: subscriptionsURL,
            organizationsURL: organizationsURL,
            reposURL: reposURL,
            eventsURL: eventsURL,
            receivedEventsURL: receivedEventsURL,
            type: type,
            siteAdmin: siteAdmin
        )
    }
}

