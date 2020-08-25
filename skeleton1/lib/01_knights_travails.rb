require "./00_tree_node.rb"

class KnightPathFinder
    require 'byebug'
    POSSIBLE_MOVES = [ [-2,-1], [-2,1], [-1,-2], [-1,2], [1,-2], [1,2], [2,-1], [2,1] ]
    
    def self.valid_moves(current_pos)
        moves = []

         POSSIBLE_MOVES.each do |move| 
            top_to_bottom = (move[0] + current_pos[0]) 
            left_to_right = (move[1] + current_pos[1])
            if (top_to_bottom <= 7 && top_to_bottom >= 0) && (left_to_right <= 7 && left_to_right >= 0)
                moves << [top_to_bottom, left_to_right]
            end
        end
        
        
        moves
    end

    attr_reader :root_node, :considered_positions

    def initialize(start_pos)
        @root_node = start_pos
        @considered_positions = [start_pos]
    end

    require 'byebug'
    def new_move_positions(pos)
    
        possible_moves = KnightPathFinder.valid_moves(pos)
        
        final_options = possible_moves.select do |move|
            top_to_bottom_move = move[0] 
            left_to_right_move = move[1] 
            if !@considered_positions.include?([top_to_bottom_move, left_to_right_move])
                [top_to_bottom_move, left_to_right_move]
            end
        end
        final_options.each { |pos| @considered_positions << pos}
        p "Your move options are : #{final_options}"
    end

    def build_move_tree
        nodes = [root_node]

        until nodes.length == 64
            current_nodes = nodes.shift
            current_pos = current_nodes
            new_move_positions(current_pos).each do |pos_pos|
                nodes << pos_pos
            end
        end

        nodes
    end
end

new = KnightPathFinder.new([0,0])

puts
puts
p new
new.new_move_positions([0, 0])
p new
puts ' -------- '
# p move.new_move_positions([3,3])





#valid_moves = up/down/left/right 3 spaces upd/down/right/left 1 space
#kpf.find_path([3, 3]) # => [[0, 0], [2, 1], [3, 3]]
# S S x x V V x x
# x V S S x x x x 
# S V x x V V x x
# S V S V x x x x
# V V x V V x x x 
# x S x V x x x x
# x x x V x x x x 
# V x x x x x x x
#pos_visited = [1, 2], [2, 5], [4, 1], [4, 5], [5, 2], [3,3]
# avail_pos = [1, 4], [2, 1], [5, 4]
# [[-2, 1], [-1, -2], [2, 1]]

#
# 
# POSSIBLE_MOVES = [ [-2,1],[1,2],[1,2],[2,1],[2,-1],[1,-2],[-1,-2],[-2,-1] ]

#0,0 + -2,1 => -2,1 + 
