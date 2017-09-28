require 'pry'
require_relative 'contact'

class CRM

  def initialize

  end

  def main_menu
    while true # repeat indefinitely
      print_main_menu
      user_selected = gets.to_i
      call_option(user_selected)
    end
  end

  def print_main_menu
    puts '[1] Add a new contact'
    puts '[2] Modify an existing contact'
    puts '[3] Delete a contact'
    puts '[4] Display all the contacts'
    puts '[5] Search by attribute'
    puts '[6] Exit'
    puts 'Enter a number: '
  end

  def call_option(user_selected)
    case user_selected
    when 1 then add_new_contact
    when 2 then modify_existing_contact
    when 3 then delete_contact
    when 4 then display_all_contacts
    when 5 then search_by_attribute
    when 6 then exit
    # Finish off the rest for 3 through 6
    # To be clear, the methods add_new_contact and modify_existing_contact
    # haven't been implemented yet
    end
  end

  def add_new_contact
    print 'Enter First Name: '
    first_name = gets.chomp

    print 'Enter Last Name: '
    last_name = gets.chomp

    print 'Enter Email Address: '
    email = gets.chomp

    print 'Enter a Note: '
    note = gets.chomp

    Contact.create(first_name, last_name, email, note)
  end

  def modify_existing_contact
    puts "What would you like to change?"
    option = what_option
    contact_to_modify = search_by_attribute.first
    puts "What's the new value?"
    new_value = gets.chomp
    contact_to_modify.update(option, new_value)
  end

  def delete_contact

  end

  def display_all_contacts
    print Contact.all
  end

  def search_by_attribute
    puts "What would you like to find?"
    option = what_option
    current_value = current_value(option)
    p Contact.find_by(option, current_value)
    # binding.pry
  end

  def what_option
    puts '[1] First Name'
    puts '[2] Last Name'
    puts '[3] email address'
    puts '[4] notes'
    option = gets.chomp.to_i
  end

  def current_value(option)
    if option == 1
      option_display = "First Name"
    elsif option == 2
      option_display = "Last Name"
    elsif option == 3
      option_display = "email address"
    elsif option == 4
      option_display = "note"
    end
    puts "What's your contact current #{option_display}?"
    current_value = gets.chomp

  end

end


a_crm_app = CRM.new
a_crm_app.main_menu
