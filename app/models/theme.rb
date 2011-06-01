class Theme
  include Mongoid::Document
  include Mongoid::Timestamps

  after_save :generate_sass

  field :title, :type => String
  field :description, :type => String
  field :background_color, :type => String
  field :secondary_color, :type => String
  field :primary_color, :type => String

  COLOR_FORMAT = /^#([A-F0-9]{3}|[A-F0-9]{6})$/i

  validates :title, :presence => true
  validates :background_color, :presence => true,
                               :format => COLOR_FORMAT
  validates :secondary_color, :presence => true,
                              :format => COLOR_FORMAT
  validates :primary_color, :presence => true,
                            :format => COLOR_FORMAT

  def to_sass
    ["$primary_color: #{self.primary_color};",
     "$secondary_color: #{self.secondary_color};",
     "$background_color: #{self.background_color};",
     "BODY { background-color: $background_color; }"].join("\n")
  end

  def generate_sass
    engine = Sass::Engine.new(self.to_sass)
    engine.options[:syntax] = :scss
    save_file engine.render
  end

  def save_file (content)
    File.open File.join(Rails.root, 'public', 'stylesheets', file_name), 'w' do |f|
      f.puts content
    end 
  end

  def file_name
    self.title.underscore.gsub(/\s/, '_') + ".css"
  end
end
