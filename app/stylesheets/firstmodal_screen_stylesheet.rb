class FirstmodalScreenStylesheet < ApplicationStylesheet
  # Add your view stylesheets here. You can then override styles if needed,
  # example: include FooStylesheet

  def setup
    # Add stylesheet specific setup stuff here.
    # Add application specific setup stuff in application_stylesheet.rb
  end

  def root_view(st)
    st.background_color = color.white
  end

  def message(st)
    st.frame = {t: 100, w: 200, h: 18, centered: :horizontal}
    st.text_alignment = :center
    st.color = color.battleship_gray
    st.font = font.medium
    st.text = 'Tap an option'
    st.number_of_lines = 0
  end

  def show_alert(st)
    st.frame = {t: 140, w: 350, h: 30, centered: :horizontal}
    st.text = 'RedAlert works here too'
    st.background_gradient = {
      colors: [color("3F94D4"), color("3252A0")],
      locations: [0.0, 1.0]
    }
  end

  def open_second_modal(st)
    st.frame = {t: 180, w: 350, h: 30, centered: :horizontal}
    st.text = 'Open the second modal screen'
    st.background_gradient = {
      colors: [color("3F94D4"), color("3252A0")],
      locations: [0.0, 1.0]
    }
  end

  def close_screen(st)
    st.frame = {t: 220, w: 350, h: 30, centered: :horizontal}
    st.text = 'Close this modal screen'
    st.background_gradient = {
      colors: [color("3F94D4"), color("3252A0")],
      locations: [0.0, 1.0]
    }
  end

end
