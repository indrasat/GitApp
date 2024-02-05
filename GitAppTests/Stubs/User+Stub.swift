//
//  User+Stub.swift
//  GitAppTests
//
//  Created by Indra Kurniawan on 11/01/24.
//

import Foundation

extension User {
    static func stub(
        name: String = "John Doe",
        email: String = "johndoe@example.com",
        login: String = "johndoe",
        id: Int = 123456,
        nodeID: String = "MDQ6VXNlcjEyMzQ1Ng==",
        avatarURL: String = "https://github.com/images/error/johndoe_happy.gif",
        gravatarID: String = "41d064eb2195891e12d0413f63227ea7",
        url: String = "https://api.github.com/users/johndoe",
        htmlURL: String = "https://github.com/johndoe",
        followersURL: String = "https://api.github.com/users/johndoe/followers",
        followingURL: String = "https://api.github.com/users/johndoe/following{/other_user}",
        gistsURL: String = "https://api.github.com/users/johndoe/gists{/gist_id}",
        starredURL: String = "https://api.github.com/users/johndoe/starred{/owner}{/repo}",
        subscriptionsURL: String = "https://api.github.com/users/johndoe/subscriptions",
        organizationsURL: String = "https://api.github.com/users/johndoe/orgs",
        reposURL: String = "https://api.github.com/users/johndoe/repos",
        eventsURL: String = "https://api.github.com/users/johndoe/events{/privacy}",
        receivedEventsURL: String = "https://api.github.com/users/johndoe/received_events",
        type: String = "User",
        siteAdmin: Bool = false,
        starredAt:  String = "2020-07-09T00:17:55Z"
    ) -> User {
        return User(
            name: name,
            email: email,
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
            siteAdmin: siteAdmin,
            starredAt: starredAt
        )
    }
}


