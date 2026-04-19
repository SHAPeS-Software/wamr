require 'open3'
require 'shellwords'

module WAMR
  class Scanner
    def initialize(root_path = ".")
      @root_path = File.expand_path(root_path)
    end

    def scan
      command = build_command

      stdout, stderr, status = Open3.capture3(command)

      if status.success?
        paths = stdout.split("\n").map { |p| p.sub(/\/\.git$/, '').strip }.reject(&:empty?)
        display_results(paths)
      else
        puts "Error running command: #{stderr}"
      end
    end

    private

    def build_command
      escaped_path = @root_path.shellescape

      # Ignore the hiddens directorys so the program doesn't crash on perm denied
      hidden = File.basename(@root_path).start_with?('.')

      if windows?
        "powershell -Command \"Get-ChildItem -Path #{escaped_path} -Recurse -Directory -Filter .git -ErrorAction SilentlyContinue | Select-Object -ExpandProperty Parent | Select-Object -ExpandProperty FullName\""
      else
        if hidden
          "find #{escaped_path} -type d -name .git 2>/dev/null -exec dirname {} \\;"
        else
          "find #{escaped_path} \\( -path '*/.*' ! -name .git \\) -prune -o -type d -name .git -print 2>/dev/null | sed 's|/\\.git$||'"
        end
      end
    end

    def windows?
      RUBY_PLATFORM =~ /mswin|mingw|cygwin/
    end

    def display_results(paths)
      if paths.empty?
        puts "No Git repositories found in #{@root_path}!"
        return
      end

      paths.each_with_index do |path, i|
        puts "[#{i + 1}] #{path}"
      end

      puts "\nTotal Git repositories found: #{paths.size}"
    end
  end
end
