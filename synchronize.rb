require 'net/sftp'
require 'io/console'
require 'highline/import'

class Synchronize
  def self.start(options, arguments)

    # Options
    global_options = options[:global][:options]
    server = global_options[:server]
    account = global_options[:account]
    local_folder = global_options[:local_folder]
    remote_folder = global_options[:remote_folder]
    extension = global_options[:extension]

    # Check values
    if server == "CHANGE_DEFAULT"
      puts "FTP Server should be passed as an option (-s) or specified in the config file (~/.sync_config)"
      return
    end

    if account == "CHANGE_DEFAULT"
      puts "FTP account name should be passed as an option (-a) or specified in the config file (~/.sync_config)"
      return
    end

    if local_folder == "CHANGE_DEFAULT"
      puts "Local folder should be passed as an option (-l) or specified in the config file (~/.sync_config)"
      return
    end

    if remote_folder == "CHANGE_DEFAULT"
      puts "Remote folder on the ftp server should be passed as an option (-r) or specified in the config file (~/.sync_config)"
      return
    end

    if extension == "CHANGE_DEFAULT"
      puts "File extension should be passed as an option (-e) or specified in the config file (~/.sync_config)"
      return
    end

    # Password
    password = ask("Password: ") { |q| q.echo="*"}

    Net::SFTP.start(server, account, :password => password) do |sftp|

      Dir.foreach(local_folder) do |file|
        next if file.start_with?('.')
        next unless file.end_with?(extension)

        # Upload
        puts "Uploading file " + file.to_s
        sftp.upload!(local_folder + file, remote_folder + file)

        # Delete
        filePath = File.join(local_folder, file)
        File.delete(filePath)
      end
    end

  end
end
