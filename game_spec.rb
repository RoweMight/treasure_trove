    
require_relative 'game'
require_relative 'die'


describe Game do

  before do
    @game = Game.new("Knuckleheads")

    @initial_health = 100
    @player = Player.new("moe", @initial_health)
    
    @game.add_player(@player)
 end

    it "W00ts the player if a high number is rolled" do
        allow_any_instance_of(Die).to receive(:roll).and_return(5)
  
        @game.play(2)

        expect(@player.health).to eq(@initial_health + (15*2))
   end
  
    it "Skips the player if a medium number is rolled" do
        allow_any_instance_of(Die).to receive(:roll).and_return(3)
  
        @game.play  (2)  

        expect(@player.health).to eq(@initial_health)
    end

    it "Blams the player if a low number is rolled" do
        allow_any_instance_of(Die).to receive(:roll).and_return(1)

        @game.play(2)

        expect(@player.health).to eq(@initial_health -(10*2))
    end

    def play(rounds)
      puts  "There are #{@players.size} players in the #{@title}:"

        @players.each do |player|
          puts player
        end

      1.upto(rounds) do |round|
        puts "\nRound #{round}:"    
        @players.each do |player|
          GameTurn.take_turn(player)
          puts player
      end
    end
  end      
end
