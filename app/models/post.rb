class Post < ApplicationRecord
  
  # exclude_activity_attributes is optional
  # when passed in, it will not track the given fields
  # in Activities.

  # acts_as_tracked(exclude_activity_attributes: :content)

  acts_as_tracked
  
  # Just including
  #
  # `acts_as_tracked`
  #
  # will tracking anything but [created_at, updated_at] fields.

end