module OrganizationsHelper

  def organizations_for_select
  Organization.all.collect { |m| [m.name, m.id] }
  end
end
