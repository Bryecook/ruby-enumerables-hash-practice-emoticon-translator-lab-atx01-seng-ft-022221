require "pry"
require "yaml"

def load_library(path)
  emoticon=YAML.load_file(path)
  emoticon.each do |name, emote|
    emoticon[name]={}
    emoticon[name][:english]= emote[0]
    emoticon[name][:japanese]= emote [1]
  end
  emoticon
end

def get_japanese_emoticon(path, emoticon)
  library=load_library(path)
  library.each do |key, value|
    value.each do |language, emote|
      if emote.include?(emoticon)
        return value[:japanese]
      else
        return "Sorry, that emoticon was not found"
      end
    end
  end 
  end

def get_english_meaning(path, emoticon)
  library=load_library(path)
  library.each do |key, value|
    value.each do |language, emote|
      if emoticon==emote
          return key
      else
        puts "Sorry, that emoticon was not found"  
      end 
    end
  end 
end