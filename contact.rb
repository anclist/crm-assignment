class Contact

  @@contacts = []
  @@id = 1

  # This method should initialize the contact's attributes
  def initialize(first_name, last_name, email, note="")
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note

    @id = @@id
    @@id += 1
  end

#Readers

  def first_name
    @first_name
  end

  def last_name
    @last_name
  end

  def email
    @email
  end

  def note
    @note
  end

  def id
    @id
  end


#Writers

def first_name=(first_name)
  @first_name = first_name
end

def last_name=(last_name)
  @last_name = last_name
end

def email=(email)
  @email = last_name
end

def note=(note)
  @note =note
end


  # This method should call the initializer,
  # store the newly created contact, and then return it
  def self.create(first_name, last_name, email, note="")
    new_contact = Contact.new(first_name, last_name, email, note)
    @@contacts << new_contact
    return new_contact
  end

  # This method should return all of the existing contacts
  def self.all
    @@contacts
  end

  # This method should accept an id as an argument
  # and return the contact who has that id
  def self.find(id)
    found_contact = []
    all.each do |contact|
      if contact.id == id
        found_contact << contact
      end
    end
    found_contact
  end

  # This method should allow you to specify
  # 1. which of the contact's attributes you want to update
  # 2. the new value for that attribute
  # and then make the appropriate change to the contact
  def update(option, new_value)
    if option == 1
      @first_name = new_value
    elsif option == 2
      @last_name = new_value
    elsif option == 3
      @email = new_value
    elsif option == 4
      @note = new_value
    else
      p "That's not the right option"
    end
  end

  # This method should work similarly to the find method above
  # but it should allow you to search for a contact using attributes other than id
  # by specifying both the name of the attribute and the value
  # eg. searching for 'first_name', 'Betty' should return the first contact named Betty
  def self.find_by(option, current_value)
    found_contact = []
    if option == 1
      all.each do |contact|
        if contact.first_name == current_value
          found_contact << contact
        end
      end
    elsif option == 2
      all.each do |contact|
        if contact.last_name == current_value
          found_contact << contact
        end
      end
    elsif option == 3
      all.each do |contact|
        if contact.email == current_value
          found_contact << contact
        end
      end
    elsif option == 4
      all.each do |contact|
        if contact.note == current_value
          found_contact << contact
        end
      end
    else
      p "Something is wrong"
    end
    found_contact
  end

  # This method should delete all of the contacts
  def self.delete_all
    @@contacts = []
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  # This method should delete the contact
  # HINT: Check the Array class docs for built-in methods that might be useful here
  def delete(value)
    @@contacts.delete(value)
  end

  # Feel free to add other methods here, if you need them.

end


Contact.create("Tony", "Montana", "am@gmail.com", "something")
Contact.create("Luz", "Leon", "am@gmail.com","something")
Contact.create("Cesar", "Martinez", "am@gmail.com","something")
Contact.create("Nathy", "Crespillo", "am@gmail.com","something")
Contact.create("Juan", "Blanco", "am@gmail.com","something")
