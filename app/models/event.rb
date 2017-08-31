class Event < ActiveRecord::Base
    enum event_type: [ :conference, :exhibition, :meeting, :training, :demo, :deployment ]
end
