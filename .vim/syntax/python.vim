syn keyword pythonIdentifier _

syn keyword pythonStatement
            \ assert
            \ break
            \ continue
            \ def
            \ del
            \ from
            \ import
            \ pass
            \ raise
            \ return
            \ yield

syn keyword pythonControl
            \ elif
            \ else
            \ except
            \ finally
            \ for
            \ if
            \ in
            \ try
            \ while
            \ with

syn keyword pythonKeyword
            \ as
            \ async
            \ catch
            \ class
            \ cls
            \ global
            \ lambda
            \ local
            \ nonlocal
            \ self

syn keyword pythonBuiltin
            \ __class__
            \ __dict__
            \ __getattribute__
            \ __init__
            \ __name__
            \ __repr__
            \ __setattr__

syn keyword pythonConstant
            \ inf
            \ None
            \ nan NaN

syn keyword pythonBoolean
            \ False
            \ True

syn keyword pythonType
            \ DataFrame Series Index
            \ Exception
            \ List Union Collection Tuple Enum, Dict
            \ array ndarray
            \ bool
            \ bytes
            \ complex
            \ dict
            \ float
            \ frozenset
            \ function
            \ int
            \ list
            \ range
            \ set
            \ str
            \ tuple
            \ vector matrix cube

syn keyword pythonLibrary
            \ argparse
            \ base64
            \ black
            \ bokeh
            \ boto3
            \ bs4 BeautifulSoup
            \ calendar
            \ cvxpy cp
            \ dataclasses
            \ datetime dt
            \ docker
            \ enum
            \ functools
            \ getpass
            \ gnupg
            \ io
            \ ipdb
            \ json
            \ logging log
            \ math
            \ matplotlib pyplot mpl plt
            \ nose
            \ numba
            \ numpy np
            \ os
            \ pandas pd
            \ pathlib
            \ pickle
            \ plotly
            \ psycopg2 psql
            \ pylab
            \ pyodbc
            \ quandl
            \ random
            \ rapidjson
            \ re
            \ requests
            \ scipy sp
            \ seaborn sns
            \ sklearn
            \ statsmodels sm
            \ subprocess
            \ sys
            \ talib
            \ time
            \ typing
            \ unittest
            \ urllib
            \ csv
            \ collections

syn match pythonConstant  "\<[A-Z_0-9]\{2,}\>\((\)\@!\|\<nan\>\|\<NaN\>\|\<NA\>"
syn match pythonDecorator "@\@<=\w*\|@"
syn match pythonDelimiter "\[\|\]\|(\|)\|,\|{\|}\|;"
syn match pythonFunction  "\w*(\@=\|\.\@<=\w*\["     contains=pythonDelimiter
syn match pythonNumber    "\<[0-9_.]\+\>\|[0-9_]\+e[0-9-]\+"
syn match pythonOperator  "+\|-\|*\|\/\|\/\/\(\/\)\@!\|->\|<\|>\|=\||\|&\|!\|:\|%\|\.\|\~\|\<is\>\|\<not\>\|\<or\>\|\<and\>"
syn match pythonTodo      "TODO\|FIXME\|NOTE"
syn match pythonType      "\(pd\.\)\@<=[A-Z].\w\+Index\|\(\<dt\>\.\)\@<=\(\<date\>\|\<datetime\>\|\<timedelta\>\|time\)\|\(np\.\)\@<=\(\<float_\>\|\<int_\>\|\<bool_\>\|\<str_\>\).\|\(pd\.\)\@<=Timestamp\|\(np\.\)\@<=datetime64"
syn match pythonLibrary   "\(np\.\)\@<=\(linalg\|random\)\|\(sp\.\)\@<=\(stats\)\|\(os\.\)\@<=\(path\)"
syn match pythonFormat    "\({}\)" contained containedin=pythonFormattedString
syn match pythonType      "\<[A-Z]\w\+Error\>"

syn region pythonFormat          start="{"       end="}"  contained containedin=pythonFormattedString keepend
syn region pythonComment         start="#"       end="\n" contains=pythonTodo
syn region pythonString          start="\"\"\""  end="\"\"\""
syn region pythonString          start=+"+       end=+"+
syn region pythonString          start=+'+       end=+'+
syn region pythonFormattedString start=+f"+      end=+"+
syn region pythonFormattedString start=+f'+      end=+'+
syn region pythonFormattedString start=+f\"\"\"+ end=+\"\"\"+

hi def link pythonLibrary         PreProc
hi def link pythonIdentifier      Normal
hi def link pythonBoolean         Boolean
hi def link pythonBuiltin         Special
hi def link pythonComment         Comment
hi def link pythonConstant        Constant
hi def link pythonControl         Statement
hi def link pythonType            Type
hi def link pythonDecorator       PreProc
hi def link pythonFormat          SpecialChar
hi def link pythonDelimiter       Delimiter
hi def link pythonFunction        Operator
hi def link pythonKeyword         Keyword
hi def link pythonNumber          Number
hi def link pythonOperator        Operator
hi def link pythonStatement       Statement
hi def link pythonString          String
hi def link pythonFormattedString String
hi def link pythonTodo            Todo
hi def link pythonType            Type

highlight pythonFormat ctermfg=DarkGreen ctermbg=none

"call TextEnableCodeSnip('sql', 'query.=.\"\{3\}', '\"\{3\}', 'SqlQuery')
"call TextEnableCodeSnip('sql', 'query.=.\"\(\"\)\@!', '\"', 'SqlQuery')
"highlight SqlQuery ctermfg=3 ctermbg=8
"highlight textSnipSQL ctermfg=none ctermbg=8

let b:current_syntax = "python"
