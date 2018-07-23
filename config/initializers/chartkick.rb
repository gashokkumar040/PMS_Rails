# To set options for all of your charts, create an initializer config/initializers/chartkick.rb with:

Chartkick.options = {
  height: "400px",
  colors: ["pink", "#999"]
}

Chartkick.options[:html] = '<div id="%{id}" style="height: %{height};">Loading...</div>'