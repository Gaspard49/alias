def check_if_user_gave_input
  abort("mkdir: missing input") if ARGV.empty?
end

def get_folder_name
  return folder_name = ARGV.first
end

def create_folder(name)
  Dir.mkdir(name)
end

def create_README
  t = Time.now
  file = File.open("./#{ARGV.first}/README.md", "a")
  file.puts("#Welcome to my Ruby Program!\n\n\n\n")
  file.puts(">Created on #{t.strftime("%d/%m/%Y")} by Gaspard Tertrais.\n\n\n\n")
  file.puts("**Note aux correcteurs**\n\n\n\n")
  file.puts("## Content\n\n\n\n")
  file.puts("- **lib/** : Classes and data file for names list.")
  file.puts("- **spec/**: Execute to check programs")
  file.puts("- **app** : execution files.")
  file.puts("- **Gemfile, Gemfile.lock** : Gem and dependencies. See below.\n\n\n\n")
  file.puts("## Classes\n\n\n\n")
  file.puts("Provides methods and variables to organize class process and its different phases.\n\n\n\n")
  file.puts("- \# initialize\n\n\n\n")
  file.puts("## Gemfile\n\n\n\n")
  file.puts("```\n\n\n\n")
  file.puts("ruby '2.5.1'")
  file.puts("source 'https://rubygems.org'")
  file.puts("gem 'dotenv'")
  file.puts("gem 'pry'")

  file.close
end

def create_app
  file = File.open("./#{ARGV.first}/app.rb", "a")
  file.puts("require 'bundler'")
  file.puts("Bundler.require\n\n")
  file.puts("$:.unshift File.expand_path('./../lib', __FILE__)")
  file.puts("require 'scrapper'\n\n")
  file.puts("MyClass.new.perform")
end

def git_init
  git = Dir.chdir "./#{ARGV.first}" do 'git init'
  end
end

def rspec_init
 rspec = Dir.chdir "./#{ARGV.first}" do `rspec --init`
 end
end


def create_Gemfile
  file = File.open("./#{ARGV.first}/Gemfile", "a")
  file.puts("ruby '2.5.1'")
  file.puts("source 'https://rubygems.org'")
  file.puts("gem 'pry'")
  file.puts("gem 'rspec'")
  file.close
end

def create_env
  file = File.open("./#{ARGV.first}/.env", "w")
end

def create_gitingnore
  file = File.open("./#{ARGV.first}/.gitignore", "a")
  file.puts(".env")
  file.close
end

def create_lib 
 Dir.mkdir("./#{ARGV.first}/lib")
end

def create_dir_app
  Dir.mkdir("./#{ARGV.first}/lib/app")
end

def create_scrapper
  file = File.open("./#{ARGV.first}/lib/app/scrapper.rb", "a")
end

def create_email_sender
  file = File.open("./#{ARGV.first}/lib/app/email_sender.rb", "a")
end

def create_dir_views
 Dir.mkdir("./#{ARGV.first}/lib/views")
end

def create_done
  file = File.open("./#{ARGV.first}/lib/views/done.rb", "a")
end

def create_index
  file = File.open("./#{ARGV.first}/lib/views/index.rb", "a")
end

def create_db 
  Dir.mkdir("./#{ARGV.first}/db")
 end

 def create_thing
  file = File.open("./#{ARGV.first}/db/thing.csv", "a")
end

def create_app_spec
  file = File.open("./#{ARGV.first}/spec/app_spec.rb", "a")
  file.puts("require_relative '../app'\n\n")
  file.puts("describe 'the method' do")
  file.puts("  it 'describe what should do' do")
  file.puts("    expect(method).not_to be_nil")
  file.puts("  end")
  file.puts("end")
  file.close
 end

def bundle_install
  rspec = Dir.chdir "./#{ARGV.first}" do `bundle install`
  end
end

def perform
  check_if_user_gave_input
  create_folder(get_folder_name)
  create_README
  git_init
  rspec_init
  create_Gemfile
  create_app
  create_env
  create_gitingnore
  create_lib
  create_dir_app
  create_scrapper
  create_email_sender
  create_dir_views
  create_done
  create_index
  create_db
  create_thing
  create_app_spec
  bundle_install
  system("code #{ARGV.first}")
end
  
perform