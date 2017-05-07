class Object
  def self.const_missing(c)
    if c =~ /.*Controller\Z/
      file_name = c.to_s.gsub(/::/, '/').
        gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
        gsub(/([a-z\d])([A-Z])/,'\1_\2').
        tr("-", "_").
        downcase
      require "./app/controllers/#{file_name}.rb"
      const_get(c)
    else
      super
    end
  end
end

homes_ctrl = HomesController.new
homes_ctrl.show

books_ctrl = BooksController.new
books_ctrl.show

invalid_ctrl = InvaildCtrl.new
invalid_ctrl.show
