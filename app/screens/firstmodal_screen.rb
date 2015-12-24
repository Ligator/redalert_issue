class FirstmodalScreen < PM::Screen
  title "First modal"
  stylesheet FirstmodalScreenStylesheet

  def on_load
    @message = append!(UILabel, :message)
    @show_alert        = append!(UIButton, :show_alert)
    @open_second_modal = append!(UIButton, :open_second_modal)
    @close_screen      = append!(UIButton, :close_screen)

    @show_alert.addTarget(self,
      action: "show_alert_function:",
      forControlEvents: UIControlEventTouchUpInside
    )
    @open_second_modal.addTarget(self,
      action: "open_second_modal_function:",
      forControlEvents: UIControlEventTouchUpInside
    )
    @close_screen.addTarget(self,
      action: "close_screen_function:",
      forControlEvents: UIControlEventTouchUpInside
    )
  end
  
  def show_alert_function(sender)
    app.alert(title: "This message is working", message: "by RedAlert")
  end

  def open_second_modal_function(sender)
    open_modal SecondmodalScreen.new(nav_bar: true)
  end

  def close_screen_function(sender)
    close
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
    reapply_styles
  end
end
