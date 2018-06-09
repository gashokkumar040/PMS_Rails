require "administrate/base_dashboard"

class UserDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    projects: Field::HasMany,
    id: Field::Number,
    first_name: Field::String,
    email: Field::String,
    encrypted_password: Field::String,
    username: Field::String,
    last_name: Field::String,
    date_of_birth: Field::DateTime,
    is_female: Field::Boolean,
    phonenum: Field::String,

  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :projects,
    :id,
    :first_name,
    :last_name,
    :phonenum,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :first_name,
    :email,
    :username,
    :last_name,
    :date_of_birth,
    :is_female,
    :phonenum,

  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [

    :first_name,
    :email,
    :encrypted_password,

    :username,
    :last_name,
    :date_of_birth,
    :is_female,
    :phonenum,

  ].freeze

  # Overwrite this method to customize how users are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(user)
  #   "User ##{user.id}"
  # end
end
