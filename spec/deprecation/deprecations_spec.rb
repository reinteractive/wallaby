require 'rails_helper'

describe 'ResourcePaginator' do
  it 'shows deprecation message' do
    expect {
      class ProductPaingator < Wallaby::ResourcePaginator
      end
    }.to output("[DEPRECATION] `Wallaby::ResourcePaginator` will be removed from 5.3.*. Please inherit `Wallaby::ModelPaginator` instead.\n").to_stderr
  end
end

describe 'Map.resource_paginator' do
  it 'shows deprecation message' do
    mapping = Wallaby::Configuration::Mapping.new
    expect {
      mapping.resource_paginator = String
    }.to output("[DEPRECATION] `resource_paginator=` will be removed from 5.3.*.  Please use `model_paginator=` instead.\n").to_stderr
    expect(mapping.model_paginator).to eq String
  end
end

describe Wallaby::ResourcesController, type: :controller do
  describe '#current_model_service' do
    it 'shows deprecation message' do
      controller.params[:resources] = 'products'
      expect {
        controller.current_model_service
      }.to output("[DEPRECATION] `current_model_service` will be removed from 5.3.*.  Please use `current_model_servicer` instead.\n").to_stderr
      expect(controller.current_model_service).to be_a Wallaby::ModelServicer
    end
  end
end

describe Wallaby::IndexHelper, type: :helper do
  describe '#paginate' do
    it 'shows deprecation message' do
      controller.params[:resources] = 'products'
      expect {
        controller.paginate(Product, Product.where(false), {})
      }.to output("[DEPRECATION] `paginate` will be removed from 5.3.*.  Please use `paginater` instead.\n").to_stderr
      expect(controller.paginate(Product, Product.where(false), {})).to be_a Wallaby::ModelPaginator
    end
  end
end