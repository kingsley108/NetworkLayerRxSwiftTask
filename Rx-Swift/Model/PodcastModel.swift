import Foundation


struct PodcastEpisode: Codable {
    let id: String
    let record: Record
    let metadata: Metadata
}

// MARK: - Metadata
struct Metadata: Codable {
    let name: String
    let readCountRemaining, timeToExpire: Int
    let createdAt: String
}

// MARK: - Record
struct Record: Codable {
    let id, title, author: String
    let enclosureLength: Int
    let enclosureURL: String
    let fileSize, pubDate: String
    let created: Int
    let show: Show
    let duration, description: String
    let imageURL, universalLink: String
    let isExplicit: Bool
    let nextEpisode, nextContentLink: String?
    let link: Link
    let extendedPubDate: String
    let screenIdentifier: String
    let offsetMS: Int

    enum CodingKeys: String, CodingKey {
        case id, title, author
        case enclosureLength = "enclosure_length"
        case enclosureURL = "enclosure_url"
        case fileSize = "file_size"
        case pubDate = "pub_date"
        case created, show, duration, description
        case imageURL = "image_url"
        case universalLink = "universal_link"
        case isExplicit = "is_explicit"
        case nextEpisode = "next_episode"
        case nextContentLink = "next_content_link"
        case link
        case extendedPubDate = "extended_pub_date"
        case screenIdentifier = "screen_identifier"
        case offsetMS = "offset_ms"
    }
}

// MARK: - Link
struct Link: Codable {
    let href, type: String
}

// MARK: - Show
struct Show: Codable {
    let id, title: String
    let imageURL: String
    let link: Link

    enum CodingKeys: String, CodingKey {
        case id, title
        case imageURL = "image_url"
        case link
    }
}

