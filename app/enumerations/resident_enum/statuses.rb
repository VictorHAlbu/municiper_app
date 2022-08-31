# frozen_string_literal: true

module ResidentEnum
  class Statuses < EnumerateIt::Base
    associate_values(:active, :inactive)
  end
end
