module TranslatorServices
  class Translator
    attr_reader :target_text

    def initialize(target_text, source_language = 'en', target_language = 'fi')
      @target_text = target_text
      @source_language = source_language
      @target_language = target_language
    end

    def self.call(...)
      new(...).execute
    end

    def execute
      translator = Aws::Translate::Client.new(
        region: Rails.application.credentials.aws_translate[:region],
        access_key_id: Rails.application.credentials.aws_translate[:access_key_id],
        secret_access_key: Rails.application.credentials.aws_translate[:secret_access_key]
      )
      response = translator.translate_text({
        text: @target_text,
        source_language_code: @source_language,
        target_language_code: @target_language,
        settings: {
          formality: 'INFORMAL', # accepts FORMAL
          profanity: 'MASK'
        }
      })
      response.translated_text
    end
  end
end
