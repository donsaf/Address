def greeting
  
  greet_with = ARGV.delete_at(0)

  ARGV.each do |arg|
    puts greet_with + " " + arg
  end

end

greeting