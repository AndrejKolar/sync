require 'net/ftp'
require 'io/console'

SERVER = "andrejkolar.synology.me"
ACCOUNT = "admin"
LOCAL_FOLDER = "/Users/andrejkolar/Downloads/"
REMOTE_FOLDER = "/Watch/"

class Synchronize
  def self.start(options, arguments)


    #arguments
    puts options


    # Password
    puts "Password:"
    password = STDIN.noecho(&:gets).chomp

    Net::FTP.open(SERVER, ACCOUNT, password) do |ftp|
      ftp.chdir(REMOTE_FOLDER)
      files = ftp.list

      Dir.foreach(LOCAL_FOLDER) do |file|
        next if file.start_with?('.')
        next unless file.end_with?('.torrent')

        # Upload
        p "Uploading file " + file.to_s
        ftp.putbinaryfile(LOCAL_FOLDER + file)

        # Delete
        filePath = File.join(LOCAL_FOLDER, file)
        File.delete(filePath)
      end
    end

  end
end



