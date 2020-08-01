//
//  Senator.swift
//  Reppy
//
//  Created by Enzo Jimenez-Soto on 7/31/20.
//  Copyright © 2020 Enzo Jimenez-Soto. All rights reserved.
//

import Foundation

struct Senator: Decodable {
    
    var title: String
    var shortTitle: String
    var firstName: String
    var middleName: String?
    var lastName: String
    var suffix: String?
    var dateOfBirth: String
    var gender: String
    var party: String
    var twitterAccount: String
    var faceBookAccount: String
    var contactForm: String
    var nextElection: String
    var totalVotes: Int
    var missedVotes: Int
    var totalPresent: Int
    var lastUpdated: String
    var office: String
    var phone: String
    var fax: String?
    var state: String
    var stateRank: String
    var missedVotesPercentage: Double
    var votesWithPartyPercentage: Double
    var votesAgainstPartyPercentage: Double
    
    
    private enum SenatorCodingKeys: String, CodingKey {
        
        case title = "title"
        case shortTitle = "short_title"
        case firstName = "first_name"
        case middleName = "middle_name"
        case lastName = "last_name"
        case suffix = "suffix"
        case dateOfBirth = "date_of_birth"
        case gender = "gender"
        case party = "party"
        case twitterAccount = "twitter_account"
        case faceBookAccount = "facebook_account"
        case contactForm = "contact_form"
        case nextElection = "next_election"
        case totalVotes = "total_election"
        case missedVotes = "missed_voted"
        case totalPresent = "total_present"
        case lastUpdated = "last_updated"
        case office = "office"
        case phone = "phone"
        case fax = "fax"
        case state = "state"
        case stateRank = "state_rank"
        case missedVotesPercentage = "missed_with_party_pct"
        case votesWithPartyPercentage = "votes_with_party_pct"
        case votesAgainstPartyPercentage = "votes_against_party_pct"
        
    }
    
    
     init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: SenatorCodingKeys.self)
        let Title = try container.decode(String.self, forKey: .title)
        let ShortTitle = try  container.decode(String.self, forKey: .shortTitle)
        let FirstName = try  container.decode(String.self, forKey: .firstName)
        let MiddleName = try  container.decodeIfPresent(String.self, forKey: .middleName)
        let LastName = try  container.decode(String.self, forKey: .lastName)
        let Suffix = try  container.decodeIfPresent(String.self, forKey: .suffix)
        let DateOfBirth = try  container.decode(String.self, forKey: .dateOfBirth)
        let Gender = try  container.decode(String.self, forKey: .gender)
        let Party = try  container.decode(String.self, forKey: .party)
        let TwitterAccount = try  container.decode(String.self, forKey: .twitterAccount)
        let FaceBookAccount = try  container.decode(String.self, forKey: .faceBookAccount)
        let ContactForm = try  container.decode(String.self, forKey: .contactForm)
        let NextElection = try  container.decode(String.self, forKey: .nextElection)
        let TotalVotes = try  container.decode(Int.self, forKey: .totalVotes)
        let MissedVotes = try  container.decode(Int.self, forKey: .missedVotes)
        let TotalPresent = try  container.decode(Int.self, forKey: .totalPresent)
        let LastUpdated = try  container.decode(String.self, forKey: .lastUpdated)
        let Office = try  container.decode(String.self, forKey: .office)
        let Phone = try  container.decode(String.self, forKey: .phone)
        let Fax = try  container.decode(String.self, forKey: .fax)
        let State = try  container.decode(String.self, forKey: .state)
        let StateRank = try  container.decode(String.self, forKey: .stateRank)
        let MissedVotesPercentage = try  container.decode(Double.self, forKey: .missedVotesPercentage)
        let VotesWithPartyPercentage = try  container.decode(Double.self, forKey: .votesWithPartyPercentage)
        let VotesAgainstPartyPercentage = try  container.decode(Double.self, forKey: .votesAgainstPartyPercentage)
        

        
        
        self.title = Title
        self.shortTitle = ShortTitle
        self.firstName = FirstName
        self.middleName = MiddleName
        self.lastName = LastName
        self.suffix = Suffix
        self.dateOfBirth = DateOfBirth
        self.gender = Gender
        self.party = Party
        self.twitterAccount = TwitterAccount
        self.faceBookAccount = FaceBookAccount
        self.contactForm = ContactForm
        self.nextElection = NextElection
        self.totalVotes = TotalVotes
        self.missedVotes = MissedVotes
        self.totalPresent = TotalPresent
        self.lastUpdated = LastUpdated
        self.office = Office
        self.phone = Phone
        self.fax = Fax
        self.state = State
        self.stateRank = StateRank
        self.missedVotesPercentage = MissedVotesPercentage
        self.votesWithPartyPercentage = VotesWithPartyPercentage
        self.votesAgainstPartyPercentage = VotesAgainstPartyPercentage
        
    }
    
}
