$LOAD_PATH << File.join(File.dirname(__FILE__), "app", "controllers")

class Object
  def self.const_missing(c)
    super if @is_reloaded
    if c =~ /.*Controller\Z/
      @is_reloaded = true
      file_name = c.to_s.gsub(/::/, '/').
        gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
        gsub(/([a-z\d])([A-Z])/,'\1_\2').
        tr("-", "_").
        downcase
      require file_name
      result = const_get(c)
      @is_reloaded = false
      return result
    else
      super
    end
  end
end

homes_ctrl = HomesController.new
homes_ctrl.show
