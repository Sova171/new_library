# frozen_string_literal: true

Rating.delete_all

Rating.new({ title: 'Eager to read' }).save!
Rating.new({ title: 'Enjoyed' }).save!
Rating.new({ title: 'Unsatisfied' }).save!
Rating.new({ title: 'For one-time reading' }).save!
