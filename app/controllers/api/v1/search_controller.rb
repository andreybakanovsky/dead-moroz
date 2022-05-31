module Api
  module V1
    class SearchController < ApplicationController
      def search
        models = [Gift]
        results = if params[:query].blank?
                    []
                  else
                    Elasticsearch::Model
                      .search(params[:query], models)
                      .results.as_json
                      .group_by { |result| result['_index'] }

                  end
        render json: results
      end
    end
  end
end
