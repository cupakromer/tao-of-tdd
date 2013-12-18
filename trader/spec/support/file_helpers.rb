require 'active_support/core_ext/string/strip'
require 'tempfile'

module Helpers
  module Wrapping
    module_function
    def with_temp_file(file_name, data = nil)
      ext  = File.extname(file_name)
      base = File.basename(file_name, ext)

      file = Tempfile.new([ base, ext ])
      file.write(data.to_s.strip_heredoc)
      file.close

      yield file.path

    ensure
       file.close
       file.unlink
    end
  end
end
