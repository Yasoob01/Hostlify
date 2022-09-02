class Admin::UsersGrid
  include Datagrid

  scope do
    User
  end

  #
  # Filters
  #

  filter(:id, :string, :multiple => ',')
  filter(:email, :string)
  filter(:name, :string)
  #filter(:roles, :string, :select => User::ROLES.map {|r| [r.humanize, r]})
  column_names_filter(:header => "Extra Columns", checkboxes: true)

  #
  # Columns
  #

  column(:id, :mandatory => true)
  column(:email, :mandatory => true) do |model|
    format(model.email) do |value|
      link_to value, "mailto:#{value}"
    end
  end
  column(:name, :mandatory => true)
  column(:phone, :mandatory => true)

  column(:actions, :html => true, :mandatory => true) do |record|
    button_to "Delete", admin_user_path(record), method: :delete
  end
end
