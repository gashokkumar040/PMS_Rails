module TasksHelper
  def tasks_for_show
    Task.all.collect { |m| [m.name, m.id] }
  end
end




# <div class="field">
#     <%= f.label :Task %>
#     <%= f.select(:task_id, tasks_for_show, :prompt => 'Select') %>
# </div>
# <br>