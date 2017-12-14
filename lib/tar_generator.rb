# source: http://weblog.jamisbuck.org/2015/7/23/tar-gz-in-ruby.html
require 'rubygems/package'

module TarGenerator

  def add_to_tar(file, filename_for_tar, tarfile, container)
    # We have the container and the tarfile
    # because we need to use the container file(and actual file) 
    # instead of 'tarfile' which is actually
    # the Gem::Package::TarWriter instance to send it/gzip it etc.
    filepath = File.expand_path(file)

    tarfile.add_file_simple(filename_for_tar, 0777, File.open(file).size) do |io|
      io.write(File.read(file))
    end
    container.rewind
    container
  end

  # http://code-dojo.blogspot.cl/2012/10/gzip-compressiondecompression-in-ruby.html
  def gzip_compress(string)
    wio = StringIO.new("w")
    w_gz = Zlib::GzipWriter.new(wio)
    w_gz.write(string)
    w_gz.close
    compressed = wio.string
  end

  def gzip(file, gzip_archive = Tempfile.new)
    gzip_archive.tap do |x|
      x.write(gzip_compress(File.read(file)))
    end.rewind
    gzip_archive
  end
end