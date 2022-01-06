require_relative '../lib/bot.rb'
RSpec.describe bot.get_updates do
    it 'its return true if it works' do
      expect(command = message.get_command_for(bot)).to eql true
    end
  end