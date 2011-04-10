# coding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
Quiz.create(:question => 'dog', :answer_a => '猫', :answer_b => '犬', :answer_c => '鳥', :answer_d => 'イカ', :answer => 'b')
Quiz.create(:question => 'cat', :answer_a => '猫', :answer_b => '犬', :answer_c => '鳥', :answer_d => 'イカ', :answer => 'a')
Quiz.create(:question => 'bird', :answer_a => '猫', :answer_b => '犬', :answer_c => '鳥', :answer_d => 'イカ', :answer => 'c')

