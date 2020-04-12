class Twitter {
    var userDictionary: [Int : User]
    var posterDictionary: [Int : [Int]]
    //uid : [poid]
    var postsDictionary: [Int : Int]
    //poid, postsCountBefore
    
    /** Initialize your data structure here. */
    init() {
        userDictionary = [:]
        posterDictionary = [:]
        postsDictionary = [:]
    }
    
    /** Compose a new tweet. */
    func postTweet(_ userId: Int, _ tweetId: Int) {
        if userDictionary[userId] == nil {
            userDictionary.updateValue(User.init(userId: userId), forKey: userId)
        }
        if posterDictionary[userId] == nil {
            posterDictionary.updateValue([], forKey: userId)
        }
        if postsDictionary[tweetId] != nil {
            return
        }
        userDictionary[userId]!.addPost(postId: tweetId)
        posterDictionary[userId]!.append(tweetId)
        postsDictionary.updateValue(postsDictionary.count + 1, forKey: tweetId)
    }
    
    /** Retrieve the 10 most recent tweet ids in the user's news feed. Each item in the news feed must be posted by users who the user followed or by the user herself. Tweets must be ordered from most recent to least recent. */
    func getNewsFeed(_ userId: Int) -> [Int] {
        if userDictionary[userId] == nil {
            return []
        }
        let followers: [Int] = userDictionary[userId]!.followers
        var unSortedPostsWithTime: [Int : Int] = [:]
        var sortedPosts: [Int] = []
        for i in followers {
            if posterDictionary[i] == nil {
                continue
            }
            for j in posterDictionary[i]! {
                if postsDictionary[j] == nil {
                    continue
                }
                unSortedPostsWithTime.updateValue(postsDictionary[j]!, forKey: j)
            }
        }
        
        if posterDictionary[userId] != nil {
            for i in posterDictionary[userId]! {
                if postsDictionary[i] == nil {
                    continue
                }
                unSortedPostsWithTime.updateValue(postsDictionary[i]!, forKey: i)
            }
        }
        
        let sortedPostsWithTime: [Dictionary<Int, Int>.Element] = unSortedPostsWithTime.sorted(by: {$0.1 > $1.1})
        
        for i in sortedPostsWithTime {
            sortedPosts.append(i.key)
        }
        
        if sortedPosts.count > 10 {
            sortedPosts = [Int](sortedPosts[0...9])
        }
        
        return sortedPosts
    }
    
    /** Follower follows a followee. If the operation is invalid, it should be a no-op. */
    func follow(_ followerId: Int, _ followeeId: Int) {
        if userDictionary[followerId] == nil{
            userDictionary.updateValue(User.init(userId: followerId), forKey: followerId)
        }
        if userDictionary[followeeId] == nil {
            userDictionary.updateValue(User.init(userId: followeeId), forKey: followeeId)
        }
        
        userDictionary[followerId]!.followTo(followeeId: followeeId)
    }
    
    /** Follower unfollows a followee. If the operation is invalid, it should be a no-op. */
    func unfollow(_ followerId: Int, _ followeeId: Int) {
        guard userDictionary[followerId] != nil && userDictionary[followeeId] != nil else {
            return
        }
        
        userDictionary[followerId]!.unFollow(followeeId: followeeId)
    }
    
    class User : Equatable, Hashable {
        var userId: Int = -1
        var followers: [Int] = []
        var posts: [Int] = []
        
        init(userId: Int) {
            self.userId = userId
        }
        
        func followTo(followeeId: Int) {
            if followers.contains(followeeId) {
                return
            }
            followers.append(followeeId)
        }
        
        func unFollow(followeeId: Int) {
            let place:Int? = followers.firstIndex(of: followeeId)
            if place == nil {
                return
            }
            followers.remove(at: place!)
        }
        
        func addPost(postId: Int) {
            posts.append(postId)
        }
        
        func hash(into hasher: inout Hasher) {
            hasher.combine(userId)
        }
        
        static func ==(_ left: User, _ right: User) -> Bool {
            return left.hashValue == right.hashValue
        }
    }
}
