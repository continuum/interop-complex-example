# source: http://weblog.jamisbuck.org/2015/7/23/tar-gz-in-ruby.html
require 'rubygems/package'

module TarGenerator

  def add_to_tar(file, filename_for_tar, tarfile, container)
   # tmp = Tempfile.new
   # tar = container ? Gem::Package::TarWriter.new(container) : Gem::Package::TarWriter.new(tmp)
    filepath = File.expand_path(file)

    tarfile.add_file_simple(filename_for_tar, 0777, File.open(file).size) do |io|
      io.write(File.read(file))
    end
    container.rewind
    container
   #return container.rewind && container if container
    #tmp.rewind
  #  tmp 
   # tar
  #  tar
    # return tar.add_file_simple(File.expand_path(file), 0777, file.size) do |io|
    #   io.write(File.read(file))
    # end if File.file? file

    # return create!(file, tar_archive) if file.is_a? Array
    # create!([file], tar_archive) if file.is_a? String
  end

  def create!(filepaths, tar_archive = nil)
    # Filepaths should be an array
    # This one actually stops directories from being included, but need does "write them as files", needs polishing
    tar = tar_archive ? tar_archive : Gem::Package::TarWriter.new(Tempfile.new)

    path = "/home/eugenio/workspaces/interop-complex-example"
    filepaths.each do |fp|
      tar.add_file_simple(fp.split('/').last, 0777, File.open(fp).size) do |e|
        e.write(File.read(fp))
      end unless File.directory?(fp)
    end
  end

  # http://code-dojo.blogspot.cl/2012/10/gzip-compressiondecompression-in-ruby.html
  def gzip_compress(string)
   # debugger
    wio = StringIO.new("w")
    w_gz = Zlib::GzipWriter.new(wio)
    w_gz.write(string)
    w_gz.close
    compressed = wio.string
  end

  def gzip(file, gzip_archive = Tempfile.new)

    # This one does work!
    # tmpp = Tempfile.new.tap {|x| x.write(gzip("hola mundo como estas"))}
    #  #<Tempfile:/tmp/20171213-8304-6jyk0t> 
    # tmpp.rewind
  #  debugger
    gzip_archive.tap do |x|
      x.write(
        gzip_compress(
          File.read(file)
          )
      )
      #x.write(gzip_compress(File.read(file))) 
    end
    gzip_archive.rewind
    gzip_archive

    # File.open(gzip_archive) do |gz|
    #   gz.write(Zlib::Deflate.deflate(File.read(file)))
    # end
  end
end

  # Dir.glob(path + '/*').each do |fp|
  #   tar.add_file_simple(fp.split('/').last, 0777, File.open(fp).size) do |e| 
  #     e.write(fp)
  #   end
  # end
  
  # #Dir.glob(path + '/*').each { |fp| tar.add_file_simple(fp.split('/').last, 0777, File.open(fp).size) { |e| e.write(File.read(fp)) unless File.directory?(fp)}}
  

  # File.open("demo.tar.gz", "wb") do |file|
  #   Zlib::GzipWriter.wrap(file) do |gz|
  #     Gem::Package::TarWriter.new(gz) do |tar|
  #     awesome_stuff = "This is awesome!\n"
  #     tar.add_file_simple("awesome/stuff.txt",
  #         0444, awesome_stuff.length
  #     ) do |io|
  #         io.write(awesome_stuff)
  #     end

  #     more_awesome = "This is awesome, too!\n"
  #     tar.add_file_simple("more/awesome.txt",
  #         0444, more_awesome.length
  #     ) do |io|
  #         io.write(more_awesome)
  #     end
  #     end
  #   end
  # end
