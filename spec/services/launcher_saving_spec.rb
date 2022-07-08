require 'rails_helper'

RSpec.describe LauncherSaving, type: :model do
  let(:limit) { 2000 }
  let(:page) { 100 }
  let(:launch_list) { "/2.2.0/launch" }

  it "shoud return 200" do
    response = HttParty.get(launch_list, { limit: limit, query: { page: page }  })
    expect(response.code).to eq 200
  end
end
