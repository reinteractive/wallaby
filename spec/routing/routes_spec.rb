require 'rails_helper'

describe 'routing', type: :request do
  let(:response) { double 'Response', call: [ 200, {}, ["Coming soon"] ] }
  let(:script_name) { '/admin' }

  it 'routes to the general resourceful routes' do
    resources = 'posts'
    expect(Wallaby::ResourcesController).to receive(:action).with(:index).and_return(response)
    get "#{ script_name }/#{ resources }"

    expect(Wallaby::ResourcesController).to receive(:action).with(:create).and_return(response)
    post "#{ script_name }/#{ resources }"

    expect(Wallaby::ResourcesController).to receive(:action).with(:new).and_return(response)
    get "#{ script_name }/#{ resources }/new"

    expect(Wallaby::ResourcesController).to receive(:action).with(:edit).and_return(response)
    get "#{ script_name }/#{ resources }/1/edit"

    expect(Wallaby::ResourcesController).to receive(:action).with(:show).and_return(response)
    get "#{ script_name }/#{ resources }/1"

    expect(Wallaby::ResourcesController).to receive(:action).with(:update).and_return(response)
    patch "#{ script_name }/#{ resources }/1"

    expect(Wallaby::ResourcesController).to receive(:action).with(:destroy).and_return(response)
    delete "#{ script_name }/#{ resources }/1"
  end

  context 'when target resources controller exists' do
    it 'routes to the general resourceful routes' do
      module Admin
        AliensController = Class.new(Wallaby::ResourcesController)
      end
      resources = 'aliens'

      expect(Admin::AliensController).to receive(:action).with(:index).and_return(response)
      get "#{ script_name }/#{ resources }"

      expect(Admin::AliensController).to receive(:action).with(:create).and_return(response)
      post "#{ script_name }/#{ resources }"

      expect(Admin::AliensController).to receive(:action).with(:new).and_return(response)
      get "#{ script_name }/#{ resources }/new"

      expect(Admin::AliensController).to receive(:action).with(:edit).and_return(response)
      get "#{ script_name }/#{ resources }/1/edit"

      expect(Admin::AliensController).to receive(:action).with(:show).and_return(response)
      get "#{ script_name }/#{ resources }/1"

      expect(Admin::AliensController).to receive(:action).with(:update).and_return(response)
      patch "#{ script_name }/#{ resources }/1"

      expect(Admin::AliensController).to receive(:action).with(:destroy).and_return(response)
      delete "#{ script_name }/#{ resources }/1"
    end
  end
end