class Dungeon
   attr_accessor :player
   
   def initialize(player_name)
      @player = Player.new(player_name)
      @rooms = []
   end
   
   def add_room(reference, name, description, connections, items)
      @rooms << Room.new(reference, name, description, connections, items)
   end
   
   def start(location)    
      @player.location = location
      11.times do
      show_current_description
      puts "Which direction would you like to go?"
              direction = gets
              direction = direction.chomp
              direction = direction.to_sym
              go(direction)
            end
   end
   
   def show_current_description
      puts find_room_in_dungeon(@player.location).full_description
   end
   
   def item_description
      puts find_room_in_dungeon(@player.location).full_item_description
   end
   
   def find_room_in_dungeon(reference)
      @rooms.detect { |room| room.reference == reference }
   end
   
   # @rooms.detect { |room| room.(:smallcave).connections[:east] == (:smallcave).connections[:east]}
   # searches @rooms referencing smallcave, looking for connections in the east direction
   
   def find_room_in_direction(direction)
      find_room_in_dungeon(@player.location).connections[direction]
   end
   
   # find_room_in_dungeon(:smallcave).connections[:east]
   # sends player's current room connected with query to find method above
   
   def search_room
      item_description
   end
   
   def go(direction)
      puts "You go " + direction.to_s
      @player.location = find_room_in_direction(direction)
      show_current_description
   end
   
   class Player
      attr_accessor :name, :location
      
      def initialize(name)
         @name = name
      end 
   end
   
class Room
   attr_accessor :reference, :name, :description, :connections, :items
   
   def initialize(reference, name, description, connections, items)
      @reference = reference
      @name = name
      @description = description
      @connections = connections
      @items = items
   end
   
   def full_description
      @name + "\n\nYou are in " + @description
   end
   
   def full_item_description
      @name + "\n\nYou discovered " + @items
   end
end

end
