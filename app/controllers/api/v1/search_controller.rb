module Api
  module V1
    class SearchController < ApplicationController
      def search
        authorize! :search_smth, :search
        case current_user.role.to_sym
        when :dead_moroz
          models = []
        when :elf
          models = [Gift]
        end
        results = if params[:query].blank?
                    []
                  else
                    Elasticsearch::Model
                      .search(params[:query], models, { body: search_params })
                      .results.as_json
                    # .group_by { |result| result['_index'] }
                  end
        render json: results
      end

      private

      def search_params
        {
          size: 20,
          highlight: {
            fields: {
              '*': {
                pre_tags: ['<em>'],
              post_tags: ['</em>']
              }
            }
          }
        }
      end
    end
  end
end
