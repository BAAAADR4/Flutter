class Tweet {
  final String author;
  final String handle;
  final String content;
  final int replies;
  final int retweets;
  final int likes;

  const Tweet({
    required this.author,
    required this.handle,
    required this.content,
    required this.replies,
    required this.retweets,
    required this.likes,
  });
}

const List<Tweet> tweets = [
  Tweet(
    author: '1',
    handle: '@1',
    content: 'test',
    replies: 42,
    retweets: 8,
    likes: 156,
  ),
  Tweet(
    author: '2',
    handle: '@2',
    content: 'test',
    replies: 3,
    retweets: 1,
    likes: 27,
  ),
  Tweet(
    author: '2',
    handle: '@2',
    content: 'test',
    replies: 12,
    retweets: 5,
    likes: 89,
  ),
];
