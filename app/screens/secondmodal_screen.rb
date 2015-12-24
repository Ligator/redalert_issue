class SecondmodalScreen < PM::TableScreen
  title "Second modal screen"
  stylesheet SecondmodalScreenStylesheet

  def on_load
    set_nav_bar_button :left, title: "Close", action: :nav_left_button
  end

  def nav_left_button
    close
  end
  
  def table_data
    [{
      cells:[
        {
          title: "Show alert box with RedAlert",
          subtitle: "Not Working",
          action: :show_alert_by_redalert
        },
        {
          title: "Show alert box WIHOUT RedAlert",
          subtitle: "Working",
          action: :show_alert_native
        }
      ]
    }]
  end

  def show_alert_by_redalert
    app.alert(title: "This message is NOT working", message: "by RedAlert")
  end

  def show_alert_native
    @ui_alert = UIAlertView.alloc.initWithTitle("This message is working",
      message: "I am not using RedAlert!",
      delegate: self,
      cancelButtonTitle: "Cancel",
      otherButtonTitles: nil)
    @ui_alert.show
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
