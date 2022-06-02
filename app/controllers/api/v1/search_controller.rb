module Api
  module V1
    class SearchController < ApplicationController
      def search
        authorize! :search_smth, :search
        models = [Gift]
        results = if params[:query].blank?
                    []
                  else
                    Elasticsearch::Model
                      .search(params[:query], models, { body: highlight_fields })
                      .results.as_json
                      .group_by { |result| result['_index'] }

                  end
        render json: results
      end

      private

      def highlight_fields
        {
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
