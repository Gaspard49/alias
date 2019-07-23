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
  file.puts("Welcome to my Ruby Program!\n")
  file.puts("Created on #{t.strftime("%d/%m/%Y")} by Gaspard Tertrais.")
  file.close
  end

def git_init
git = Dir.chdir "./#{ARGV.first}" do `git init`
 end
 end

def rspec_init
 rspec = Dir.chdir "./#{ARGV.first}" do `rspec --init`
end
end


def create_Gemfile
file = File.open("./#{ARGV.first}/Gemfile", "a")
file.puts("source 'https://rubygems.org'")
file.puts("ruby '2.5.1'")
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

    def create_app
      file = File.open("./#{ARGV.first}/lib/app.rb", "w")
      end

      def create_app_spec
        file = File.open("./#{ARGV.first}/spec/app_spec.rb", "a")
        file.puts("require_relative '../lib/app.rb'")
        file.puts("describe 'the method' do")
        file.puts("  it 'describe what should do' do")
        file.puts("    expect(method).not_to be_nil")
        file.puts("  end")
        file.puts("end")
        file.close
        end

def perform
  check_if_user_gave_input
  create_folder(get_folder_name)
  create_README
  git_init
  rspec_init
  create_Gemfile
  create_env
  create_gitingnore
  create_lib
  create_app
  create_app_spec
  system("code #{ARGV.first}")
  end
  
  perform


