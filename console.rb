require('pry')
require_relative('models/bounty.rb')
# Bounty.delete_all

cowboy1 = Bounty.new({
'name' => 'Morag',
'bounty_value' => '12',
'danger_level' => 'Low',
'homeworld' => 'Jupiter'
})

cowboy2 = Bounty.new({
'name' => 'Roy',
'bounty_value' => '1200',
'danger_level' => 'High',
'homeworld' => 'Earth'
})

cowboy3 = Bounty.new({
'name' => 'Janice',
'bounty_value' => '1900',
'danger_level' => 'High',
'homeworld' => 'Saturn'
})

  cowboy1.save()
  cowboy2.save()
  cowboy3.save()

  cowboy2.name = "Ronald"
  cowboy2.update
  cowboy1.delete

  found = Bounty.find_by_name("Ronald")

 found_by_id = Bounty.find(3)

  binding.pry
  nil
