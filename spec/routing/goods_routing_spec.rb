require 'rails_helper'

RSpec.describe GoodsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/goods').to route_to('goods#index')
    end

    it 'routes to #new' do
      expect(get: '/goods/new').to route_to('goods#new')
    end

    it 'routes to #show' do
      expect(get: '/goods/1').to route_to('goods#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/goods/1/edit').to route_to('goods#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/goods').to route_to('goods#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/goods/1').to route_to('goods#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/goods/1').to route_to('goods#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/goods/1').to route_to('goods#destroy', id: '1')
    end
  end
end
