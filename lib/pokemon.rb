class Pokemon
  attr_accessor :id, :name, :type, :db 
  
  def initialize(id:,name:,type:,db:)
    @id = id 
    @name = name 
    @type = type
    @db = db
  end
  
  def self.save(name,type,db)
    sql = <<-SQL
      INSERT INTO pokemon (name, type)
      VALUES (?, ?)
    SQL
    
    db.execute(sql, name, type)
  end
  
  def self.find(id,db)
    sql = <<-SQL
    "SELECT * FROM pokemon WHERE id = ?"
    SQL
    result = db.execute(sql, id)[0]
    Pokemon.new(result[0], result[1])
  end
  end
  
end
