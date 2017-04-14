Pod::Spec.new do |s|

  s.name         = "SwiftLint"
  s.version      = "0.12.0"
  s.summary      = "A tool to enforce Swift style and conventions."

  s.description  = <<-DESC
                   A tool to enforce Swift style and conventions, loosely based on GitHub's Swift Style Guide.
                   SwiftLint hooks into Clang and SourceKit to use the AST representation of your source files
                   for more accurate results.
                   DESC

  s.homepage     = "https://github.com/realm/SwiftLint"
  s.license      = "MIT"
  s.author       = { "Realm" => "help@realm.io" }

  s.source       = { git: 'https://github.com/realm/SwiftLint.git', submodules: true, commit: 'ec953e28d58e1f0356cbeb889b135e9573ec618e'}
  s.prepare_command = <<-CMD
       make portable_zip &&
       find . ! -name portable_swiftlint.zip -delete &&
       unzip portable_swiftlint.zip &&
       rm portable_swiftlint.zip
  CMD

  s.preserve_paths = '*'
end