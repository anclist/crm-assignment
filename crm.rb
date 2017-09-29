require 'pry'
require_relative 'contact'

class CRM

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

    contact = Contact.create(first_name: first_name, last_name: last_name, email: email, note: note)
  end

  def modify_existing_contact
    puts "What would you like to change?"
    option = what_option
    contact_to_modify = search_by_attribute
    puts "What's the new value?"
    new_value = gets.chomp
    contact_to_modify.update(option => new_value)
  end

  def delete_contact
    contact_to_delete = search_by_attribute
    id = contact_to_delete.id
    Contact.delete(id)
  end

  def display_all_contacts
    # p Contact.all
    Contact.all.each do |contact|
      puts "Name: #{contact.first_name}, Last Name: #{contact.last_name}, email: #{contact.email}, notes: #{contact.note}"
    end
  end

  def search_by_attribute
    puts "What would you like to find?"
    option = what_option
    current_value = current_value(option)
    p Contact.find_by(option => current_value)
    Contact.find_by(option => current_value)
  end

  def what_option
    puts '[1] First Name'
    puts '[2] Last Name'
    puts '[3] email address'
    puts '[4] notes'
    option = gets.chomp.to_i
    if option == 1
      "first_name"
    elsif option == 2
      "last_name"
    elsif option == 3
      "email"
    elsif option == 4
      "note"
    end
  end

  def current_value(option)
    if option == "first_name"
      option_display = "First Name"
    elsif option == "last_name"
      option_display = "Last Name"
    elsif option == "email"
      option_display = "email address"
    elsif option == "note"
      option_display = "note"
    end
    puts "What's your contact current #{option_display}?"
    current_value = gets.chomp

  end

end

at_exit do
  ActiveRecord::Base.connection.close
end

a_crm_app = CRM.new
a_crm_app.main_menu
