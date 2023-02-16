# frozen_string_literal: true

# Configure editor
Pry.config.editor = proc { |file, line| "nvim +#{line} #{file}" }

# In case you want to see the project and the env plus the nav
Pry.config.prompt = Pry::Prompt[:rails] if Pry::Prompt[:rails]

# Configure pry theme
unless ENV['PRY_BW']
  Pry.color = true
  Pry.config.theme = 'railscasts'
  Pry.config.prompt = PryRails::RAILS_PROMPT if defined?(PryRails::RAILS_PROMPT)
  Pry.config.prompt ||= Pry.prompt
end

# Add shortcuts
Pry.commands.alias_command 't', 'backtrace'
Pry.commands.alias_command 's', 'step'
Pry.commands.alias_command 'n', 'next'
Pry.commands.alias_command 'c', 'continue'
Pry.commands.alias_command 'f', 'finish'
Pry.commands.alias_command 'ff', 'frame'
Pry.commands.alias_command 'u', 'up'
Pry.commands.alias_command 'd', 'down'
Pry.commands.alias_command 'b', 'break'
Pry.commands.alias_command 'w', 'whereami'

Pry.config.commands.alias_command 'e', 'edit', desc: 'Edit current console'
Pry.config.commands.alias_command 'hh', 'hist -T 20', desc: 'Last 20 commands'
Pry.config.commands.alias_command 'hg', 'hist -T 20 -G', desc: 'Up to 20 commands matching expression'
Pry.config.commands.alias_command 'hG', 'hist -G', desc: 'Commands matching expression ever used'
Pry.config.commands.alias_command 'hr', 'hist -r', desc: 'hist -r <command number> to run a command'

Pry.commands.alias_command '?', 'show-source -d'

if defined?(PryByebug)
  def pp(obj)
    Pry::ColorPrinter.pp(obj)
  end
end

# Use awesome_print (or amazing_print)
begin
  require 'awesome_print'
  AwesomePrint.pry!
rescue LoadError => e
  begin
    puts "no awesome_print :( try gem install awesome_print #{e}"
    puts 'trying amazing_print'
    require 'amazing_print'
    AmazingPrint.pry!
  rescue LoadError => err2
    puts "no amazing_print either :( #{err2}"
  end
end

# Hit Enter to repeat last command
Pry::Commands.command(/^$/, 'repeat last command') do
  pry_instance.run_command Pry.history.to_a.last
end

# adds the directories /spec and /test directories to the path if they exist and not already included
before_session_hook = Pry::Hooks.new.add_hook(:before_session, :add_dirs_to_load_path) do
  current_dir = `pwd`.chomp
  dirs_added = %w[spec test presenters lib]
               .map { |d| "#{current_dir}/#{d}" }
               .map do |path|
    if File.exist?(path) && $LOAD_PATH.exclude?(path)
      i $LOAD_PATH << path
      path
    end
  end.compact
  puts "Added #{dirs_added.join(', ')} to load path per hook in ~/.pryrc." unless dirs_added.empty?
end
before_session_hook.exec_hook(:before_session)

# Utility global methods for convenience
def a_array
  (1..6).to_a
end

def a_hash
  { hello: 'world', free: 'of charge' }
end

# help methods
def more_help
  puts 'Helpful shortcuts:'
  puts 'e  : edit            Edit current console command'
  puts 'hh : hist -T 20      Last 20 commands'
  puts 'hg : hist -T 20 -G   Up to 20 commands matching expression'
  puts 'hG : hist -G         Commands matching expression ever used'
  puts 'hr : hist -r         hist -r <command number> to run a command'
  puts
  puts 'Samples variables'
  puts 'a_array  :  [1, 2, 3, 4, 5, 6]'
  puts 'a_hash   :  { hello: "world", free: "of charge" }'
  puts
  puts 'helper   : Access Rails helpers'
  puts 'app      : Access url_helpers'
  puts
  puts 'require "rails_helper"               : Require rails_helper'
  puts 'include FactoryBot::Syntax::Methods  : To include Factory Bot Syntax'
  puts
  puts 'or if you defined one...'
  puts 'require "pry_helper"'
  puts
  puts 'Sidekiq::Queue.new.clear              : To clear sidekiq'
  puts 'Sidekiq.redis { |r| puts r.flushall } : Another clear of sidekiq'
  puts
  puts "Run `require 'factory_bot'`; FactoryBot.find_definitions` for FactoryBot"
  puts
  puts 'Installed debugging Shortcuts'
  puts 'w  :  whereami'
  puts 's  :  step'
  puts 'n  :  next'
  puts 'c  :  continue'
  puts 'f  :  finish'
  puts 'pp(obj)  :  pretty print object'
  puts ''
  puts 'Stack movement'
  puts 't  :  backtrace'
  puts 'ff :  frame'
  puts 'u  :  up'
  puts 'd  :  down'
  puts 'b  :  break'
  puts
  puts 'Introspection'
  puts '$    :  show whole method of current context'
  puts '$ foo:  show definition of foo'
  puts '? foo:  show docs for for'
  puts
  puts 'Be careful not to use shortcuts for temp vars, like `u = User.first`'
  puts 'Run `help` to see all the pry commands that would conflict (and lots good info)'
  puts
  ''
end
