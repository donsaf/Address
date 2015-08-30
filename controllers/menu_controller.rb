require_relative "../models/address_book"

class MenuController
  attr_accessor :address_book

  def initialize
    @address_book = AddressBook.new
  end

  def main_menu
    puts "Main Menu - #{@address_book.entries.count} entries"
    puts "1 - View all entries"
    puts "2 - Create an entry"
    puts "3 - Search for an entry"
    puts "4 - Import entries from a CSV"
    puts "5 - Exit"
    puts "6 - View Entry Number n"

    print "Enter your selection: "

    selection = gets.to_i
    puts "You picked #{selection}"

    case selection
    when 1
      system "clear"
      view_all_entries
      main_menu
    when 2
      system "clear"
      create_entry
      main_menu
    when 3
      system "clear"
      search_entries
      main_menu
    when 4
      system "clear"
      read_csv
      main_menu
    when 5
      puts "Good-bye!"
      exit(0)
    when 6
      system "clear"
      view_entry_number_n
      main_menu
    else
      system "clear"
      puts "Sorry, that is not a valid input."
      main_menu
    end
  end

  def view_all_entries
    @address_book.entries.each do  |entry|
      system  "clear"
      puts entry.to_s

      entry_submenu(entry)
    end
    system "clear"
    puts "End of entries."
  end

  def create_entry
    system "clear"
    puts "New AddressBloc Entry"

    print "Name: "
    name = gets.chomp
    print "Phone number: "
    phone = gets.chomp
    print "Email: "
    email = gets.chomp

    @address_book.add_entry(name, phone, email)

    system "clear"
    puts "New entry created."
  end

  def search_entries
  end

  def read_csv
  end

  def entry_submenu(entry)
    puts "n - next entry"
    puts "d - delete entry"
    puts "e - edit this entry"
    puts "m - return to main menu"

    selection = gets.chomp

    case selection
    when "n"
    when "d"
    when "e"
    when "m"
      system "clear"
      main_menu
    else
      system "clear"
      puts "#{selection} is not a valid input"
      entry_submenu(entry)
    end
  end

  def view_entry_number_n
    
    address_book_entries = @address_book.entries

    print "Enter entry number you want to see (type 'exit' to go back to the main menu): "
    selection = gets.chomp

    if selection.to_i <= (address_book_entries.size - 1)
      puts address_book_entries[selection]
      main_menu
    elsif selection.to_s == "exit"
      puts "we'll take you back to the beginning"
      main_menu
    else
      puts "#{selection} is not a valid input"
      print "Please at least select an index number "
      view_entry_number_n
    end
  end

end