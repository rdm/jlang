NB. edith demo

coclass 'qtdemo'

Text=: 0 : 0
<p>The <b><i>King and Queen of Hearts</i></b> were seated on their throne when
they arrived, with a great crowd assembled about them -- all
sorts of little birds and beasts, as well as the whole pack of
cards: the Knave was standing before them, in chains, with a
soldier on each side to guard him; and near the King was the
White Rabbit, with a trumpet in one hand, and a scroll of
parchment in the other.</p>

<p>In the very middle of the court was a table, with a large dish of
tarts upon it: they looked so good, that it made Alice quite
hungry to look at them -- `I wish they'd get the trial done,' she
thought, `and hand round the refreshments!' But there seemed to
be no chance of this, so she began looking at everything about
her, to pass away the time.</p>

<p>Alice had never been in a court of justice before, but she had
read about them in books, and she was quite pleased to find that
she knew the name of nearly everything there. `That's the judge,'
she said to herself, `because of his great wig.'</p>

<p>The judge, by the way, was the King; and as he wore his crown
over the wig, he did not look at all comfortable, and it was
certainly not becoming.</p>

<p>`And that's the jury-box,' thought Alice, `and those twelve
creatures,' (she was obliged to say `creatures,' you see, because
some of them were animals, and some were birds,) `I suppose they
are the jurors.' She said this last word two or three times over
to herself, being rather proud of it: for she thought, and
rightly too, that very few little girls of her age knew the
meaning of it at all. However, `jury-men' would have done just as
well.</p>

<p>The twelve jurors were all writing very busily on slates. `What
are they doing?' Alice whispered to the Gryphon. `They can't have
anything to put down yet, before the trial's begun.'</p>

<p>`They're putting down their names,' the Gryphon whispered in
reply, `for fear they should forget them before the end of the
trial.'</p>

<p>`Stupid things!' Alice began in a loud, indignant voice, but she
stopped hastily, for the White Rabbit cried out, `Silence in the
court!' and the King put on his spectacles and looked anxiously
round, to make out who was talking.</p>

<p>Alice could see, as well as if she were looking over their
shoulders, that all the jurors were writing down `stupid things!'
on their slates, and she could even make out that one of them
didn't know how to spell `stupid,' and that he had to ask his
neighbour to tell him. `A nice muddle their slates'll be in
before the trial's over!' thought Alice.</p>

<p>`Herald, read the accusation!' said the King.</p>

<p>On this the White Rabbit blew three blasts on the trumpet, and
then unrolled the parchment scroll, and read as follows:</p>

<blockquote>
   <i>`The Queen of Hearts, she made some tarts,<br />
    &nbsp;&nbsp;&nbsp;   All on a summer day:<br />
    The Knave of Hearts, he stole those tarts,<br />
    &nbsp;&nbsp;&nbsp;   And took them quite away!'</i>
</blockquote>
<p>`Consider your verdict,' the King said to the jury.</p>

<p>`Not yet, not yet!' the Rabbit hastily interrupted. `There's a
great deal to come before that!'</p>

<p>`Call the first witness,' said the King; and the White Rabbit
blew three blasts on the trumpet, and called out, `First
witness!'</p>

<p>The first witness was the Hatter. He came in with a teacup in one
hand and a piece of bread-and-butter in the other. `I beg pardon,
your Majesty,' he began, `for bringing these in: but I hadn't
quite finished my tea when I was sent for.'</p>

<pre>
This is a test.
  Font should be pre.
    And staggered.
</pre>
)

EDIT=: 0

EDITHDEMO=: 0 : 0
pc edithdemo closeok escclose;pn "Edith Demo";
menupop "&File";
menu open "&Open" "Ctrl+O" "" "";
menu edit "&Edit" "Ctrl+E" "" "";
menu print "&Print" "Ctrl+P" "" "";
menusep;
menu quit "&Quit" "Ctrl+Q" "" "";
menupopz;
cc ted edith flush;
)

NB. =========================================================
edithdemo_run=: 3 : 0
wd EDITHDEMO
if. UNAME -: 'Linux' do. fnt=: 'font: 12pt "DejaVu Serif"' else. fnt=: 'font: 12pt "Georgia";' end.
if. UNAME -: 'Linux' do. fnte=: 'font: 12pt "DejaVu Mono"' else. fnte=: 'font: 12pt "Courier New";' end.
wd 'set ted stylesheet *QTextEdit {color:#00007f;background-color:#ffffee;',fnt,'}'
wd 'set ted text *',Text
wd 'pmove 100 10 700 500'
wd 'pshow'
NB. call these after the pshow:
wd 'set ted select 1580 1763'
wd 'set ted scroll 15'
)

NB. =========================================================
edithdemo_close=: 3 : 0
wd 'pclose'
)

edithdemo_close_button=: edithdemo_quit_button=: edithdemo_close

edithdemo_open_button=: 3 : 0
fn=. wd'mb open1 "Open HTML file" "" "HTML file (*.html *.htm)|All files (*.*)"'
if. 0=#fn do.
  wd'set ted text *',Text
  return.
end.
txt=. freads fn
wd'set ted text *',txt
wd 'set ted stylesheet *QTextEdit {color:#00007f;background-color:#ffffee;',fnt,'}'
EDIT=: 0
)

edithdemo_edit_button=: 3 : 0
if. EDIT do.
  wd'set ted edit 0'
  wd'set edit checked 0'
  wd 'set ted stylesheet *QTextEdit {color:#00007f;background-color:#ffffee;',fnt,'}'
  EDIT=: 0
else.
  wd'set ted edit 1'
  wd'set edit checked 1'
  wd 'set ted stylesheet *QTextEdit {color:#000000;background-color:#ffffff;',fnte,'}'
  EDIT=: 1
end.
)

edithdemo_print_button=: 3 : 0
wd'cmd ted print'
)

NB. =========================================================
edithdemo_run''
