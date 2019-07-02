require 'yaml'

bot_data = {:presubs => [["dont","don't"], ["youre", "you're"], ["love", "like"], ["apologize", "are sorry"], ["dislike", "hate"], ["despise", "hate"], ["yeah", "yes"], ["mom", "family"]], :responses => {:default => ["I don't understand.", "What?", "Huh?", "Tell me something else.", "I'm tired of this.", "Change the subject."],:greeting => ["Hi. I'm [name]. Want to chat?", "What's on your mind?", "Hi. What would you like to talk about?"],:farewell => ["Good bye!", "Au revoir"],
                                                                                                                                                                                                            'hello' => ["How's it going?", "How do you do?", "Enough of the pleasantries!"],
                                                                                                                                                                                                            'sorry' => ["There's no need to apologize."], 'different' => ["How is it different?", "What has changed?"],
                                                                                                                                                                                                            'i like *' => ["Why do you like" *?", "Wow! I like * too!"] }}

#Visar användaren YAML data for bot strukturen

puts bot_data.to_yaml


#Skriver YAML data till fil
f = File.open(ARGV.first || 'bot_data', "w")
f.puts bot_data.to_yaml
f.close
