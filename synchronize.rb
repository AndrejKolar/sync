require 'net/ftp'
require 'io/console'

class Synchronize
  def self.start(options, arguments)

    #Options
    global_options = options[:global][:options]
    server = global_options[:server]
    account = global_options[:account]
    local_folder = global_options[:local_folder]
    remote_folder = global_options[:remote_folder]
    extension = global_options[:extension]

    # Password
    puts "Password:"
    password = STDIN.noecho(&:gets).chomp

    Net::FTP.open(server, account, password) do |ftp|
      ftp.chdir(remote_folder)
      files = ftp.list

      Dir.foreach(local_folder) do |file|
        next if file.start_with?('.')
        next unless file.end_with?(extension)

        # Upload
        puts "Uploading file " + file.to_s
        ftp.putbinaryfile(local_folder + file)

        # Delete
        filePath = File.join(local_folder, file)
        File.delete(filePath)
      end
    end

  end
end



