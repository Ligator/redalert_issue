class HomeScreen < PM::TableScreen
  title "Test"
  stylesheet HomeScreenStylesheet

  def on_load
    set_nav_bar_button :right, title: "Open modal", action: :nav_right_button
  end

  def nav_right_button
    open_modal FirstmodalScreen.new(nav_bar: false)
  end

  def table_data
    [{
      cells:[
        {
          title: "Show alert box with RedAlert",
          subtitle: "Working",
          action: :show_alert
        }
      ]
    }]
  end

  def show_alert
    app.alert(title: "This message is working", message: "by RedAlert")
  end

  # You don't have to reapply styles to all UIViews, if you want to optimize, another way to do it
  # is tag the views you need to restyle in your stylesheet, then only reapply the tagged views, like so:
  #   def logo(st)
  #     st.frame = {t: 10, w: 200, h: 96}
  #     st.centered = :horizontal
  #     st.image = image.resource('logo')
  #     st.tag(:reapply_style)
  #   end
  #
  # Then in will_animate_rotate
  #   find(:reapply_style).reapply_styles#

  # Remove the following if you're only using portrait
  def will_animate_rotate(orientation, duration)
    find.all.reapply_styles
  end
end
