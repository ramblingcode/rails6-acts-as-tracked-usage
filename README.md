# Using ActsAsTracked on Rails project

This is a sample Rails 6 project which is using ActsAsTracked. It's version
6x but you can use it with any Rails version above 4.2.

# Testing out

In order to test stuff you should first install dependencies
and create DB.

bundle install

bin/rails db:create db:schema:load db:seed

bin/rails c

```ruby
post = Post.first

Post.tracking_changes(actor: User.first) do
  post.update(content: 'New Content')
end

post.activities

> [#<ActsAsTracked::Activity:0x0000561f330b9cf0
  id: 1,
  actor_id: 1,
  actor_type: "User",
  subject_id: 2,
  subject_type: "Post",
  parent_id: nil,
  parent_type: nil,
  attribute_changes: {"content"=>["Great post content.", "New Content"]},
  activity_type: "updated",
  human_description: nil,
  created_at: Thu, 25 Jun 2020 12:03:39 UTC +00:00,
  updated_at: Thu, 25 Jun 2020 12:03:39 UTC +00:00>]

Post.activities_for([2])

> [#<ActsAsTracked::Activity:0x0000561f330b9cf0
  id: 1,
  actor_id: 1,
  actor_type: "User",
  subject_id: 2,
  subject_type: "Post",
  parent_id: nil,
  parent_type: nil,
  attribute_changes: {"content"=>["Great post content.", "New Content"]},
  activity_type: "updated",
  human_description: nil,
  created_at: Thu, 25 Jun 2020 12:03:39 UTC +00:00,
  updated_at: Thu, 25 Jun 2020 12:03:39 UTC +00:00>]

post.activities_as_subject

> [#<ActsAsTracked::Activity:0x0000561f330b9cf0
  id: 1,
  actor_id: 1,
  actor_type: "User",
  subject_id: 2,
  subject_type: "Post",
  parent_id: nil,
  parent_type: nil,
  attribute_changes: {"content"=>["Great post content.", "New Content"]},
  activity_type: "updated",
  human_description: nil,
  created_at: Thu, 25 Jun 2020 12:03:39 UTC +00:00,
  updated_at: Thu, 25 Jun 2020 12:03:39 UTC +00:00>]

post.activities_as_actor

> []
```