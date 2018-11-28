require('pg')

class Bounty

  attr_accessor :name, :bounty_value, :danger_level, :homeworld
  attr_reader :id

  def initialize(properties)
    @name =  properties['name']
    @bounty_value = properties['bounty_value']
    @danger_level = properties['danger_level']
    @homeworld = properties['homeworld']
    @id = properties['id'].to_i if properties['id']
  end

  def save()
    db = PG.connect({dbname: 'space_cowboys', host: 'localhost'})
    sql = "INSERT INTO bounty_hunters
    (name, bounty_value, danger_level, homeworld)
    VALUES ($1, $2, $3, $4) RETURNING *"
    values = [@name, @bounty_value, @danger_level, @homeworld]
    db.prepare("save", sql)
    @id = db.exec_prepared("save", values)[0]["id"].to_i
    db.close()

  end

  def Bounty.delete_all
  db = PG.connect({dbname: 'space_cowboys', host: 'localhost'})
  sql = "DELETE FROM bounty_hunters"
  db.prepare("delete_all", sql)
  db.exec_prepared("delete_all")
  db.close()
end

  def update
  db = PG.connect({dbname: 'space_cowboys', host: 'localhost'})
  sql = "UPDATE bounty_hunters
  SET (name, bounty_value, danger_level, homeworld) = ($1, $2, $3, $4) WHERE id = $5"
  values = [@name, @bounty_value, @danger_level, @homeworld, @id]
  db.prepare("update", sql)
  db. exec_prepared("update", values)
  db.close

end

def delete
db = PG.connect({dbname: 'space_cowboys', host: 'localhost'})
sql = "DELETE FROM bounty_hunters WHERE id = $1"
values = [@id]
db.prepare("delete_one", sql)
db.exec_prepared("delete_one", values)
db.close

end

def Bounty.find_by_name(name)
  db = PG.connect({dbname: 'space_cowboys', host: 'localhost'})
  sql = "SELECT * FROM bounty_hunters WHERE name = $1"
  values = [name]
  db.prepare("find_by_name", sql)
  results_array = db.exec_prepared("find_by_name", values)
  db.close
bounty_hash = results_array[0]
bounty = Bounty.new(bounty_hash)
return bounty
end

def Bounty.find(id)
   db = PG.connect({dbname: 'space_cowboys', host: 'localhost'})
   sql = "SELECT * FROM bounty_hunters
     WHERE id = $1"
   values = [id]
   db.prepare("find", sql)
   results_array = db.exec_prepared("find", values)
   db.close()
   bounty_hash = results_array[0]
   bounty = Bounty.new(bounty_hash)
   return bounty
 end

end
