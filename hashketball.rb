require 'pry'

def game_hash
  {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" => {
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },
        "Reggie Evans" => {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },
        "Brook Lopez" => {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
        "Mason Plumlee" => {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 12,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5,
        },
        "Jason Terry" => {
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
        },
      }
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
        "Jeff Adrien" => {
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
        "Bismak Biyombo" => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 7,
          :blocks => 15,
          :slam_dunks => 10
        },
        "DeSagna Diop" => {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
        "Ben Gordon" => {
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
        "Brendan Haywood" => {
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 22,
          :blocks => 5,
          :slam_dunks => 12
        },
      }
    }
  }
end

def num_points_scored(player_name)
  result = 0
  game_hash().each do |location, team_data|
    team_data.each do |data_key, data_value|
      if data_key == :players
        data_value.each do |current_player_name, player_stats|
          if player_name == current_player_name
            player_stats.each do |player_stat, value|
              result = value if player_stat == :points
            end
          end
        end
      end
    end
  end
  result
end

def shoe_size(player_name)
  result = 0
  game_hash().each do |location, team_data|
    team_data.each do |data_key, data_value|
      if data_key == :players
        data_value.each do |current_player_name, player_stats|
          if player_name == current_player_name
            player_stats.each do |stat, value|
              result = value if stat == :shoe
            end
          end
        end
      end
    end
  end
  result
end

def rebounds(player_name)
  result = 0
  game_hash().each do |location, team_data|
    team_data.each do |data_key, data_value|
      if data_key == :players
        data_value.each do |current_player_name, player_stats|
          if player_name == current_player_name
            result = player_stats[:rebounds]
          end
        end
      end
    end
  end
  result
end

def team_colors(team_name)
  result = ''
  game_hash().each do |location, team_data|
    if team_data[:team_name] == team_name
      result = team_data[:colors]
    end
  end
  result
end

def team_names
  result = []
  game_hash().each do |location, team_data|
    result << team_data[:team_name]
  end
  result
end

def player_numbers(team_name)
  result = []
  game_hash().each do |location, team_data|
    if team_data[:team_name] == team_name
      team_data.each do |data_key, data_value|
        if data_key == :players
          data_value.each do |current_player_name, player_stats|
            player_stats.each do |stat, value|
              result << value if stat == :number
            end
          end
        end
      end
    end
  end
  result
end

def player_stats(player_name)
  result = {}
  game_hash().each do |location, team_data|
    team_data.each do |data_key, data_value|
      if data_key == :players
        data_value.each do |current_player_name, player_stats|
          if player_name == current_player_name
            result = player_stats
          end
        end
      end
    end
  end
  result
end

def big_shoe_rebounds
  largest_footed_player = ""
  largest_size = 0
  result = ""
  game_hash().each do |location, team_data|
    team_data.each do |data_key, data_value|
      if data_key == :players
        data_value.each do |current_player_name, player_stats|
          if player_stats[:shoe] > largest_size
            largest_footed_player = current_player_name
            largest_size = player_stats[:shoe]
          end
        end
      end
    end
  end
  result = rebounds(largest_footed_player)
end

def most_points_scored
  largest_score_player = ""
  most_points = 0
  result = ""
  game_hash().each do |location, team_data|
    team_data.each do |data_key, data_value|
      if data_key == :players
        data_value.each do |current_player_name, player_stats|
          if player_stats[:points] > most_points
            largest_score_player = current_player_name
            most_points = player_stats[:points]
          end
        end
      end
    end
  end
  result = largest_score_player
end

def most_steals
  largest_steals_player = ""
  most_steals = 0
  result = ""
  game_hash().each do |location, team_data|
    team_data.each do |data_key, data_value|
      if data_key == :players
        data_value.each do |current_player_name, player_stats|
          if player_stats[:steals] > most_steals
            largest_steals_player = current_player_name
            most_steals = player_stats[:steals]
          end
        end
      end
    end
  end
  result = largest_steals_player
end

def winning_team
  team_1_score = 0
  team_2_score = 0
  result = ""
  game_hash().each do |location, team_data|
    team_data.each do |data_key, data_value|
      if data_key == :players
        data_value.each do |current_player_name, player_stats|
          player_score = num_points_scored(current_player_name)
          location == :home ? team_1_score += player_score : team_2_score += player_score
        end
      end
    end
  end
  result = team_1_score > team_2_score ? game_hash()[:home][:team_name] : game_hash()[:away][:team_name]
end

def player_with_longest_name
  result = ""
  game_hash().each do |location, team_data|
    team_data.each do |data_key, data_value|
      if data_key == :players
        data_value.each do |current_player_name, player_stats|
          result = current_player_name.length > result.length ? current_player_name : result
        end
      end
    end
  end
  result
end

def long_name_steals_a_ton?
  player_with_longest_name == most_steals
end
