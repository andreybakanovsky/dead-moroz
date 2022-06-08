namespace :elastic_search do
  desc 'Index models to elasticsearch'
  task :index_models, [:models] => :environment do |_, args|
    # loads all the classes inside the “app” folder
    Rails.application.eager_load!
    # include all models inside the app/models folder
    default_models = ApplicationRecord.descendants.map(&:to_s).reject { |model| model == 'Karma' }

    argument_models = args[:models]&.split(',')&.map(&:strip)
    models = argument_models || default_models

    model_classes = models.map { |model| model.underscore.camelize.constantize }
    model_classes.each do |model|
      model.import force: true
    end
  end
end
