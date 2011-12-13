class WhitespaceCheck < Struct.new(:pattern, :message)
  def lines
    @lines ||= []
  end

  def check(line, number)
    lines << number if line =~ pattern
  end

  def error_for(file)
    "#{file} #{message} on lines #{lines.join(',')}" unless lines.empty?
  end

  def self.whitespace_errors_for(files)
    @whitespace_errors ||= files.inject([]) do |errors, filename|
      whitespace_checks = [
        WhitespaceCheck.new(/\s+\n$/, "has EOL spaces"),
        WhitespaceCheck.new(/\r/, "has DOS EOL characters"),
        WhitespaceCheck.new(/\t/, "has tab characters")
      ]

      File.readlines(filename).each_with_index do |line, number|
        whitespace_checks.each {|w| w.check(line, number+1)}
      end

      errors += whitespace_checks.map {|m| m.error_for(filename)}.compact
    end
  end
end

desc "Checks for whitespace problems"
task :whitespace do
  INCLUDE = [
    /\.rb$/,
    /\.erb$/,
    /\.haml$/,
    /\.js$/,
    /\.yml$/,
    /\.slim$/,
    /\.css$/,
    /\.sass$/,
    /\.scss$/,
    /\.gemspec$/,
    /\.rake$/,
    /Gemfile$/,
    /Capfile$/,
    /Rakefile$/,
  ]
  EXCLUDE = [
    /\/vendor\//,
    /\/coverage\//,
    /\/tmp\//,
  ]

  files = `git ls-files -c -m -o`.split("\n").select do |f|
    INCLUDE.any? {|filter| f =~ filter } &&
    EXCLUDE.none? {|filter| f =~ filter }
  end
  
  errors = WhitespaceCheck.whitespace_errors_for(files)
  if errors.any?
    puts errors.join("\n")
    raise "This project has whitespace errors. Please fix them before proceeding."
  end
end
