class User < ApplicationRecord
    has_many :posts, :dependent => :destroy
    has_many :follows, :dependent => :destroy
end
