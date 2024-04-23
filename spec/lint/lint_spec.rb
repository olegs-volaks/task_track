# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'FactoryBot lint' do
  context 'check all factories ' do
    it 'all factories must be successfully created' do
      FactoryBot.lint(traits: true)
    end
  end
end
