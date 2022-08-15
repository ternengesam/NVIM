local present, alpha = pcall(require, "alpha")

if not present then
	return
end
local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val = {
	[[       .                                        .      ]],
	[[    ,'                                        ',       ]],
	[[    ...'                                      '...     ]],
	[[     ,....'.                                .'....,    ]],
	[[    .c.'...',',          ..''..          ,','...'.c.   ]],
	[[     ,.... '...'...    .'l0WW0l'.    ...'...' ....,    ]],
	[[     :......,'.''..',,'..kdOOdk..',,'..''.',......:    ]],
	[[     .........'......   cl.:;.lc   ......'.........      ]],
	[[       ........ .       .,....,.       . ........        ]],
	[[          ..'...     ..,,.    .,,..     ...'..           ]],
	[[               ......;;,..    ..,;;......                ]],
	[[                    ..,c;;.  .;;c,..                     ]],
	[[                ...,cdolo,x:;x,olodc,...                 ]],
	[[                 .,c',l;,k'OO'k,;l''c,.                  ]],
	[[                   ..'..l oXXo l..'..                    ]],
	[[                       ...;,...                         ]],
}

-- dashboard.section.header = {
-- 	type = "text",
-- 	val = val,
-- 	opts = { position = "center", hl = "Type" },
-- }
--
alpha.setup(dashboard.opts)
