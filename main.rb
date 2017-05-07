class Object
  def self.const_missing(c)
    if c == :HomesController
      require './homes_controller'
      const_get(c)
    else
      super
    end
  end
end

homes_ctrl = HomesController.new
homes_ctrl.show
