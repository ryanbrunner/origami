require 'spec_helper'

describe Theme do
  def allow_colors (field)
    allow_values_for field, '#FFF', '#FFFFFF', '#3384FA', '#aabbcc'
  end

  def allow_non_colors (field)
    allow_values_for field, '#FF', '#FFFFF', 'red', 'FFFFFF', '#ghyynn'
  end

  it { should have_field :title }
  it { should validate_presence_of :title }

  it { should have_field :background_color }
  it { should validate_presence_of :background_color }
  it { should allow_colors :background_color }
  it { should_not allow_non_colors :background_color}
  

  it { should have_field :primary_color }
  it { should validate_presence_of :primary_color }
  it { should allow_colors :primary_color }
  it { should_not allow_non_colors :primary_color }
  
  it { should have_field :secondary_color }
  it { should validate_presence_of :secondary_color }
  it { should allow_colors :secondary_color }
  it { should_not allow_non_colors :secondary_color }
  
end
