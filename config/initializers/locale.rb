I18n.available_locales = [:en, :ja]
I18n.default_locale = :ja

require 'i18n'
I18n.locale # => :en
I18n.locale = :ja
I18n.locale # => :ja
require 'faker'
Faker::Config.locale # => :ja
Faker::Config.locale = :en
Faker::Config.locale # => :en