function fish_greeting
    if [ $BJF_PATH ]
      set joke_str (python $BJF_PATH/get_joke.py)

      #Question heading
      set_color -o blue
      echo -n "Q: "

      set_color normal

      #Question content
      set_color blue
      echo $joke_str[1]

      #Answer Heading
      set_color -o yellow
      echo -n "A: "

      set_color normal

      #Answer Content
      set_color yellow
      echo $joke_str[2]
    end
end
