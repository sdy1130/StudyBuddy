require 'test_helper'

class RepoTest < ActiveSupport::TestCase
  test 'valid repo' do
    repo = Repo.new(name: "sadfsdaf", description: "sadfas", public: true)
    assert repo.valid?
  end

end
