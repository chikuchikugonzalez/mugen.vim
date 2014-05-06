" -*- coding: utf-8 -*-
"
" Vim syntax file
" Language:    M.U.G.E.N.
" Maintainer:  chikuchikugonzalez <chikuchikugonzalez@gmail.com>
" Last Change: 2013 Aug 12
" Version:     4.1
" Remark:      M.U.G.E.N the 2D Fighiting Game Creation tool
"
set magic
syntax case ignore

"===============================================================================
" Syntax Definitions
"===============================================================================
"-------------------------------------------------------------------------------
" 共通シンタックス
"-------------------------------------------------------------------------------
syntax match   mugenFloat   contained /[FS]\?[+-]\?\d\{0,}\.\d\+/
syntax match   mugenInteger contained /[FS]\?[+-]\?\<\d\+\>/
syntax cluster mugenNumber contains=mugenInteger,mugenFloat
syntax region  mugenComment start=/;/ end=/$/ excludenl
syntax region  mugenString  start=/"/ end=/"/ excludenl

" 共通シンタックスハイライト設定
highlight link mugenInteger Number
highlight link mugenFloat   Float
highlight link mugenComment Comment
highlight link mugenString  String


"-------------------------------------------------------------------------------
" .defファイル
"-------------------------------------------------------------------------------
" [Info] セクション
syntax match  mugenInfoParameter     contained /^\s\{-0,}\<\(name\|displayname\|versiondate\|mugenversion\|author\|pal\.defaults\|localcoord\)\>/
syntax match  mugenInfoStatement     contained /^\s\{-0,}[^[:space:];]\{-1,}\s\{-0,}=.*$/ contains=mugenInfoParameter,mugenString,@mugenNumber,mugenComment
syntax match  mugenInfoSectionHeader contained /^\s\{-0,}\[info\].*$/ contains=mugenComment
syntax region mugenInfoSection start=/^\s\{-0,}\[info\].*$/ end=/^\s\{-0,}\[[[:print:]]\{-1,}/me=s-1,he=s-1 end=/\%$/ fold contains=mugenInfoSectionHeader,mugenInfoStatement,mugenComment

highlight link mugenInfoSectionHeader Define
highlight link mugenInfoParameter     Keyword

" [Files] セクション
syntax match  mugenFilesParameter     contained /^\s\{-0,}\<\(cmd\|cns\|st\(common\|\d\+\)\?\|sprite\|anim\|sound\|ai\|pal\d\+\)\>/
syntax match  mugenFilesStatement     contained /^\s\{-0,}[^[:space:];]\{-1,}\s\{-0,}=.*$/ contains=mugenFilesParameter,mugenComment
syntax match  mugenFilesSectionHeader contained /^\s\{-0,}\[files\].*$/ contains=mugenComment
syntax region mugenFilesSection start=/^\s\{-0,}\[files\].*$/ end=/^\s\{-0,}\[[[:print:]]\{-1,}/me=s-1,he=s-1 end=/\%$/ fold contains=mugenFilesSectionHeader,mugenFilesStatement,mugenComment

highlight link mugenFilesSectionHeader Define
highlight link mugenFilesParameter     Keyword

" [Palette Keymap] セクション
syntax match  mugenPaletteKeymapParameter     contained /^\s\{-0,}\<[abcxyz]\d\?\>/
syntax match  mugenPaletteKeymapStatement     contained /^\s\{-0,}[^[:space:];]\{-1,}\s\{-0,}=.*$/ contains=mugenPaletteKeymapParameter,mugenComment,mugenNumber
syntax match  mugenPaletteKeymapSectionHeader contained /^\s\{-0,}\[palette\s\{-1,}keymap\].*$/ contains=mugenComment
syntax region mugenPaletteKeymapSection start=/^\s\{-0,}\[palette\s\{-1,}keymap\].*$/ end=/^\s\{-0,}\[[[:print:]]\{-1,}/me=s-1,he=s-1 end=/\%$/ fold contains=mugenPaletteKeymapSectionHeader,mugenPaletteKeymapStatement,mugenComment

highlight link mugenPaletteKeymapSectionHeader Define
highlight link mugenPaletteKeymapParameter     Keyword

" [Arcade] セクション
syntax match  mugenArcadeParameter     contained /^\s\{-0,}\<\(intro\|ending\)\.storyboard\>/
syntax match  mugenArcadeStatement     contained /^\s\{-0,}[^[:space:];]\{-1,}\s\{-0,}=.*$/ contains=mugenArcadeParameter,mugenComment
syntax match  mugenArcadeSectionHeader contained /^\s\{-0,}\[arcade\].*$/ contains=mugenComment
syntax region mugenArcadeSection start=/^\s\{-0,}\[arcade\].*$/ end=/^\s\{-0,}\[[[:print:]]\{-1,}/me=s-1,he=s-1 end=/\%$/ fold contains=mugenArcadeSectionHeader,mugenArcadeStatement,mugenComment

highlight link mugenArcadeSectionHeader Define
highlight link mugenArcadeParameter     Keyword

" [Camera] セクション
syntax match  mugenCameraParameter     contained /^\s\{-0,}\<\(start[xy]\|bound\(left\|right\|high\|low\)\|tension\(high\|low\)\?\|verticalfollow\|floortension\|overdraw\(high\|low\)\|cut\(high\|low\)\|startzoom\|zoom\(out\|in\)\)\>/
syntax match  mugenCameraStatement     contained /^\s\{-0,}[^[:space:];]\{-1,}\s\{-0,}=.*$/ contains=mugenCameraParameter,mugenComment,@mugenNumber
syntax match  mugenCameraSectionHeader contained /^\s\{-0,}\[camera\].*$/ contains=mugenComment
syntax region mugenCameraSection start=/^\s\{-0,}\[camera\].*$/ end=/^\s\{-0,}\[[[:print:]]\{-1,}/me=s-1,he=s-1 end=/\%$/ fold contains=mugenCameraSectionHeader,mugenCameraStatement,mugenComment

highlight link mugenCameraSectionHeader Define
highlight link mugenCameraParameter     Keyword

" [PlayerInfo] セクション
syntax match  mugenPlayerInfoParameter     contained /^\s\{-0,}\<\(p[12]\(facing\|start[xy]\)\|\(left\|right\)bound\)\>/
syntax match  mugenPlayerInfoStatement     contained /^\s\{-0,}[^[:space:];]\{-1,}\s\{-0,}=.*$/ contains=mugenPlayerInfoParameter,mugenComment,@mugenNumber
syntax match  mugenPlayerInfoSectionHeader contained /^\s\{-0,}\[playerinfo\].*$/ contains=mugenComment
syntax region mugenPlayerInfoSection start=/^\s\{-0,}\[playerinfo\].*$/ end=/^\s\{-0,}\[[[:print:]]\{-1,}/me=s-1,he=s-1 end=/\%$/ fold contains=mugenPlayerInfoSectionHeader,mugenPlayerInfoStatement,mugenComment

highlight link mugenPlayerInfoSectionHeader Define
highlight link mugenPlayerInfoParameter     Keyword

" [Bound] セクション
syntax match  mugenBoundParameter     contained /^\s\{-0,}\<screen\(left\|right\)\>/
syntax match  mugenBoundStatement     contained /^\s\{-0,}[^[:space:];]\{-1,}\s\{-0,}=.*$/ contains=mugenBoundParameter,mugenComment,@mugenNumber
syntax match  mugenBoundSectionHeader contained /^\s\{-0,}\[bound\].*$/ contains=mugenComment
syntax region mugenBoundSection start=/^\s\{-0,}\[bound\].*$/ end=/^\s\{-0,}\[[[:print:]]\{-1,}/me=s-1,he=s-1 end=/\%$/ fold contains=mugenBoundSectionHeader,mugenBoundStatement,mugenComment

highlight link mugenBoundSectionHeader Define
highlight link mugenBoundParameter     Keyword

" [StageInfo] セクション
syntax match  mugenStageInfoParameter     contained /^\s\{-0,}\<\(zoffset\(link\)\?\|autoturn\|resetbg\|localcoord\|[xy]scale\)\>/
syntax match  mugenStageInfoStatement     contained /^\s\{-0,}[^[:space:];]\{-1,}\s\{-0,}=.*$/ contains=mugenStageInfoParameter,mugenComment,@mugenNumber
syntax match  mugenStageInfoSectionHeader contained /^\s\{-0,}\[stageinfo\].*$/ contains=mugenComment
syntax region mugenStageInfoSection start=/^\s\{-0,}\[stageinfo\].*$/ end=/^\s\{-0,}\[[[:print:]]\{-1,}/me=s-1,he=s-1 end=/\%$/ fold contains=mugenStageInfoSectionHeader,mugenStageInfoStatement,mugenComment

highlight link mugenStageInfoSectionHeader Define
highlight link mugenStageInfoParameter     Keyword

" [Shadow] セクション
syntax match  mugenShadowParameter     contained /^\s\{-0,}\<\(intensity\|color\|yscale\|fade\.range\|xshear\)\>/
syntax match  mugenShadowStatement     contained /^\s\{-0,}[^[:space:];]\{-1,}\s\{-0,}=.*$/ contains=mugenShadowParameter,mugenComment,@mugenNumber
syntax match  mugenShadowSectionHeader contained /^\s\{-0,}\[shadow\].*$/ contains=mugenComment
syntax region mugenShadowSection start=/^\s\{-0,}\[shadow\].*$/ end=/^\s\{-0,}\[[[:print:]]\{-1,}/me=s-1,he=s-1 end=/\%$/ fold contains=mugenShadowSectionHeader,mugenShadowStatement,mugenComment

highlight link mugenShadowSectionHeader Define
highlight link mugenShadowParameter     Keyword

" [Reflection] セクション
syntax match  mugenReflectionParameter     contained /^\s\{-0,}\<reflect\>/
syntax match  mugenReflectionStatement     contained /^\s\{-0,}[^[:space:];]\{-1,}\s\{-0,}=.*$/ contains=mugenReflectionParameter,mugenComment,@mugenNumber
syntax match  mugenReflectionSectionHeader contained /^\s\{-0,}\[reflection\].*$/ contains=mugenComment
syntax region mugenReflectionSection start=/^\s\{-0,}\[reflection\].*$/ end=/^\s\{-0,}\[[[:print:]]\{-1,}/me=s-1,he=s-1 end=/\%$/ fold contains=mugenReflectionSectionHeader,mugenReflectionStatement,mugenComment

highlight link mugenReflectionSectionHeader Define
highlight link mugenReflectionParameter     Keyword

" [Music] セクション
syntax match  mugenMusicParameter     contained /^\s\{-0,}\<\(bgmusic\|bgmvolume\)\>/
syntax match  mugenMusicStatement     contained /^\s\{-0,}[^[:space:];]\{-1,}\s\{-0,}=.*$/ contains=mugenMusicParameter,mugenComment,@mugenNumber
syntax match  mugenMusicSectionHeader contained /^\s\{-0,}\[music\].*$/ contains=mugenComment
syntax region mugenMusicSection start=/^\s\{-0,}\[music\].*$/ end=/^\s\{-0,}\[[[:print:]]\{-1,}/me=s-1,he=s-1 end=/\%$/ fold contains=mugenMusicSectionHeader,mugenMusicStatement,mugenComment

highlight link mugenMusicSectionHeader Define
highlight link mugenMusicParameter     Keyword

"-------------------------------------------------------------------------------
" [BGDef] / [BG] セクション
"-------------------------------------------------------------------------------
syntax match mugenBGParameter        contained /^\s\{-0,}\<\(type\|spriteno\|layerno\|start\|delta\|mask\|tile\|tilespacing\)\>/
syntax match mugenBGParameter        contained /^\s\{-0,}\<\(actionno\|width\|xscale\|yscalestart\|yscaledelta\)\>/
syntax match mugenBGParameter        contained /^\s\{-0,}\<\(trans\|alpha\|id\|positionlink\|maskwindow\|window\|windowdelta\|velocity\|scalestart\|scaledelta\|zoomdelta\|sin\.[xy]\)\>/
syntax match mugenBGDefParameter     contained /^\s\{-0,}\<\(spr\|debugbg\)\>/
syntax match mugenBGCtrlParameter    contained /^\s\{-0,}\<\(type\|time\|ctrlid\)\>/
syntax match mugenBGCtrlParameter    contained /^\s\{-0,}\<\(value\|x\|y\)\>/
syntax match mugenBGCtrlDefParameter contained /^\s\{-0,}\<\(looptime\|ctrlid\)\>/

syntax keyword mugenBGParameterSymbolType     contained normal anim parallax
syntax keyword mugenBGParameterSymbolTrans    contained default none add addalpha sub
syntax keyword mugenBGCtrlParameterSymbolType contained null visible enabled velset veladd posset posadd anim sinx siny

syntax match mugenBGStatement        contained /^\s\{-0,}[^[:space:];]\{-1,}\s\{-0,}=.*$/ contains=mugenBGParameter,@mugenNumber,mugenString,mugenComment
syntax match mugenBGStatement        contained /^\s\{-0,}\<type\>\s\{-0,}=.*$/ contains=mugenBGParameter,mugenBGParameterSymbolType,mugenComment
syntax match mugenBGStatement        contained /^\s\{-0,}\<trans\>\s\{-0,}=.*$/ contains=mugenBGParameter,mugenBGParameterSymbolTrans,mugenComment
syntax match mugenBGDefStatement     contained /^\s\{-0,}[^[:space:];]\{-1,}\s\{-0,}=.*$/ contains=mugenBGDefParameter,@mugenNumber,mugenString,mugenComment
syntax match mugenBGCtrlStatement    contained /^\s\{-0,}[^[:space:];]\{-1,}\s\{-0,}=.*$/ contains=mugenBGCtrlParameter,@mugenNumber,mugenString,mugenComment
syntax match mugenBGCtrlStatement    contained /^\s\{-0,}\<type\>\s\{-0,}=.*$/ contains=mugenBGCtrlParameter,mugenBGCtrlParameterSymbolType,mugenComment
syntax match mugenBGCtrlDefStatement contained /^\s\{-0,}[^[:space:];]\{-1,}\s\{-0,}=.*$/ contains=mugenBGCtrlDefParameter,@mugenNumber,mugenString,mugenComment

syntax match mugenBGSectionHeader        contained /^\s\{-0,}\[bg\>.\{-0,}\].*$/ contains=mugenComment
syntax match mugenBGCtrlSectionHeader    contained /^\s\{-0,}\[bgctrl\>.\{-0,}\].*$/ contains=mugenComment
syntax match mugenBGDefSectionHeader     contained /^\s\{-0,}\[bgdef\].*$/ contains=mugenComment
syntax match mugenBGCtrlDefSectionHeader contained /^\s\{-0,}\[bgctrldef\>.\{-0,}\].*$/ contains=mugenComment

syntax region mugenBGSection start=/^\s\{-0,}\[bg\>.\{-0,}\].*$/ end=/^\s\{-0,}\[[[:print:]]\{-1,}/me=s-1,he=s-1 end=/\%$/ extend contained contains=mugenBGSectionHeader,mugenBGStatement,mugenComment
syntax region mugenBGCtrlSection start=/^\s\{-0,}\[bgctrl\>.\{-0,}\].*$/ end=/^\s\{-0,}\[[[:print:]]\{-1,}/me=s-1,he=s-1 end=/\%$/ extend contained contains=mugenBGCtrlSectionHeader,mugenBGCtrlStatement,mugenComment
syntax region mugenBGDefSection start=/^\s\{-0,}\[bgdef\].*$/ skip=/^\s\{-0,}\[bg\>.\{-0,}\].*$/ end=/^\s\{-0,}\[[[:print:]]\{-1,}/me=s-1,he=s-1 end=/\%$/ fold contains=mugenBGDefSectionHeader,mugenBGDefStatement,mugenBGSection,mugenComment
syntax region mugenBGCtrlDefSection start=/^\s\{-0,}\[bgctrldef\>.\{-0,}\].*$/ skip=/^\s\{-0,}\[bgctrl\>.\{-0,}\].*$/ end=/^\s\{-0,}\[[[:print:]]\{-1,}/me=s-1,he=s-1 end=/\%$/ fold contains=mugenBGCtrlDefSectionHeader,mugenBGCtrlDefStatement,mugenBGCtrlSection,mugenComment

highlight link mugenBGSectionHeader        Function
highlight link mugenBGCtrlSectionHeader    Function
highlight link mugenBGDefSectionHeader     Define
highlight link mugenBGCtrlDefSectionHeader Define

highlight link mugenBGParameter        Keyword
highlight link mugenBGDefParameter     Keyword
highlight link mugenBGCtrlParameter    Keyword
highlight link mugenBGCtrlDefParameter Keyword

highlight link mugenBGParameterSymbolType     Type
highlight link mugenBGParameterSymbolTrans    Special
highlight link mugenBGCtrlParameterSymbolType Type

"-------------------------------------------------------------------------------
" [SceneDef] / [Scene] セクション
"-------------------------------------------------------------------------------
syntax match mugenSceneParameter    contained /^\s\{-0,}\<\(end\.time\|fade\(in\|out\)\.\(time\|col\)\|clearcolor\|layerall\.pos\|layer\d\+\.\(anim\|text\|font\|textdelay\|offset\|starttime\|endtime\)\|sound\d\+\.\(value\|starttime\|volumescale\|pan\)\|bgm\(\.loop\)\?\)\>/
syntax match mugenSceneParameter    contained /^\s\{-0,}\<\(window\|bg\.name\)\>/
syntax match mugenSceneDefParameter contained /^\s\{-0,}\<\(spr\|snd\|font\d\+\|startscene\)\>/

syntax match mugenSceneStatement    contained /^\s\{-0,}[^[:space:];]\{-1,}\s\{-0,}=.*$/ contains=mugenSceneParameter,@mugenNumber,mugenString,mugenComment
syntax match mugenSceneDefStatement contained /^\s\{-0,}[^[:space:];]\{-1,}\s\{-0,}=.*$/ contains=mugenSceneDefParameter,@mugenNumber,mugenString,mugenComment

syntax match mugenSceneSectionHeader    contained /^\s\{-0,}\[scene\>.*$/ contains=mugenInteger,mugenComment
syntax match mugenSceneDefSectionHeader contained /^\s\{-0,}\[scenedef\].*$/ contains=mugenComment

syntax region mugenSceneSection start=/^\s\{-0,}\[scene\>.*$/ end=/^\s\{-0,}\[[[:print:]]\{-1,}/me=s-1,he=s-1 end=/\%$/ extend contained contains=mugenSceneSectionHeader,mugenSceneStatement,mugenComment
syntax region mugenSceneDefSection start=/^\s\{-0,}\[scenedef\].*$/ skip=/^\s\{-0,}\[scene\>.*$/ end=/^\s\{-0,}\[[[:print:]]\{-1,}/me=s-1,he=s-1 end=/\%$/ fold contains=mugenSceneDefSectionHeader,mugenSceneDefStatement,mugenSceneSection,mugenComment

highlight link mugenSceneSectionHeader    Function
highlight link mugenSceneDefSectionHeader Define
highlight link mugenSceneParameter        Keyword
highlight link mugenSceneDefParameter     Keyword


"-------------------------------------------------------------------------------
" .airファイル
"-------------------------------------------------------------------------------
syntax match mugenBeginActionParameterLoopstart   contained /^\s\{-0,}\<loopstart\>/
syntax match mugenBeginActionParameterCLSNDefault contained /^\s\{-0,}\<clsn[12]\(default\)\?\>/
syntax match mugenBeginActionParameterCLSN        contained /^\s\{-0,}clsn[12]\[\d\+\]/ contains=@mugenNumber
syntax cluster mugenBeginActionParameter contains=mugenBeginActionParameterLoopstart,mugenBeginActionParameterCLSNDefault,mugenBeginActionParameterCLSN
syntax match mugenBeginActionParameter contained /^\s\{-0,}\<loopstart\>/
syntax match mugenBeginActionValue     contained /\<[hv]\+\>/
syntax match mugenBeginActionValue     contained /\<\(s\|a\|a1\|as\d\+d\d\+\)\>/
syntax match mugenBeginActionStatement contained /^\s\{-0,}\<clsn[12]\(default\)\?\>\s\{-0,}:\s\{-0,}\d\+.*$/ contains=mugenBeginActionParameterCLSNDefault,@mugenNumber,mugenComment
syntax match mugenBeginActionStatement contained /^\s\{-0,}clsn[12]\[\d\+\]\s\{-0,}=.*$/ contains=mugenBeginActionParameterCLSN,@mugenNumber,mugenComment
syntax match mugenBeginActionStatement contained /^\s\{-0,}\<loopstart\>.*$/ contains=mugenBeginActionParameterLoopstart,mugenComment

syntax match  mugenBeginActionSectionHeader contained /^\s\{-0,}\[begin\s\{-1,}action\s\{-1,}[-+]\?\d\+\>.\{-0,}\].*$/ contains=mugenInteger,mugenComment
syntax region mugenBeginActionSection start=/^\s\{-0,}\[begin\s\{-1,}action\s\{-1,}[-+]\?\d\+\>.\{-0,}\].*$/ end=/^\s\{-0,}\[[[:print:]]\{-1,}/me=s-1,he=s-1 end=/\%$/ fold contains=mugenBeginActionSectionHeader,mugenBeginActionStatement,mugenComment,@mugenNumber

highlight link mugenBeginActionParameter            Keyword
highlight link mugenBeginActionParameterLoopstart   Type
highlight link mugenBeginActionParameterCLSNDefault Keyword
highlight link mugenBeginActionParameterCLSN        Identifier
highlight link mugenBeginActionValue                Special
highlight link mugenBeginActionSectionHeader        Define


"-------------------------------------------------------------------------------
" .cns / .st ファイル
"-------------------------------------------------------------------------------
" [Data] セクション
syntax match mugenDataParameter contained /^\s\{-0,}\<\(life\|attack\|defence\|fall\.defence_up\|liedown\.time\|airjuggle\|\(guard\.\)\?sparkno\|ko\.echo\|volume\|\(int\|float\)persistindex\)\>/
syntax match mugenDataStatement contained /^\s\{-0,}[^[:space:];]\{-1,}\s\{-0,}=.*$/ contains=mugenDataParameter,@mugenNumber,mugenComment

syntax match  mugenDataSectionHeader contained /^\s\{-0,}\[data\].*$/ contains=mugenComment
syntax region mugenDataSection start=/^\s\{-0,}\[data\].*$/ end=/^\s\{-0,}\[[[:print:]]\{-1,}/me=s-1,he=s-1 end=/\%$/ fold contains=mugenDataSectionHeader,mugenDataStatement,mugenComment

highlight link mugenDataSectionHeader Define
highlight link mugenDataParameter     Keyword

" [Size] セクション
syntax match mugenSizeParameter contained /^\s\{-0,}\<\([xy]scale\|\(ground\|air\)\.\(back\|front\)\|height\|attack\.dist\|proj\.\(attack\.dist\|doscale\)\|\(head\|mid\)\.pos\|shadowoffset\|draw\.offset\)\>/
syntax match mugenSizeStatement contained /^\s\{-0,}[^[:space:];]\{-1,}\s\{-0,}=.*$/ contains=mugenSizeParameter,@mugenNumber,mugenComment

syntax match  mugenSizeSectionHeader contained /^\s\{-0,}\[size\].*$/ contains=mugenComment
syntax region mugenSizeSection start=/^\s\{-0,}\[size\].*$/ end=/^\s\{-0,}\[[[:print:]]\{-1,}/me=s-1,he=s-1 end=/\%$/ fold contains=mugenSizeSectionHeader,mugenSizeStatement,mugenComment

highlight link mugenSizeSectionHeader Define
highlight link mugenSizeParameter     Keyword

" [Velocity] セクション
syntax match mugenVelocityParameter contained /^\s\{-0,}\<\(\(walk\|run\|runjump\)\.\(back\|fwd\)\|\(jump\|airjump\)\.\(neu\|back\|fwd\)\|air\.gethit\.\(groundrecover\|airrecover\.\(mul\|add\|back\|fwd\|up\|down\)\)\)\>/
syntax match mugenVelocityStatement contained /^\s\{-0,}[^[:space:];]\{-1,}\s\{-0,}=.*$/ contains=mugenVelocityParameter,@mugenNumber,mugenComment

syntax match  mugenVelocitySectionHeader contained /^\s\{-0,}\[velocity\].*$/ contains=mugenComment
syntax region mugenVelocitySection start=/^\s\{-0,}\[velocity\].*$/ end=/^\s\{-0,}\[[[:print:]]\{-1,}/me=s-1,he=s-1 end=/\%$/ fold contains=mugenVelocitySectionHeader,mugenVelocityStatement,mugenComment

highlight link mugenVelocitySectionHeader Define
highlight link mugenVelocityParameter     Keyword

" [Movement] セクション
syntax match mugenMovementParameter contained /^\s\{-0,}\<\(airjump\.\(num\|height\)\|yaccel\|\(stand\|crouch\)\.friction\(\.threshold\)\?\|air\.gethit\.\(groundlevel\|groundrecover\.\(ground\.threshold\|groundlevel\)\|airrecover\.\(threshold\|yaccel\)\|trip\.groundlevel\)\|down\.\(bounce\.\(offset\|yaccel\|groundlevel\)\|friction\.threshold\)\)\>/
syntax match mugenMovementStatement contained /^\s\{-0,}[^[:space:];]\{-1,}\s\{-0,}=.*$/ contains=mugenMovementParameter,@mugenNumber,mugenComment

syntax match  mugenMovementSectionHeader contained /^\s\{-0,}\[movement\].*$/ contains=mugenComment
syntax region mugenMovementSection start=/^\s\{-0,}\[movement\].*$/ end=/^\s\{-0,}\[[[:print:]]\{-1,}/me=s-1,he=s-1 end=/\%$/ fold contains=mugenMovementSectionHeader,mugenMovementStatement,mugenComment

highlight link mugenMovementSectionHeader Define
highlight link mugenMovementParameter     Keyword

" [Quotes] セクション
syntax match mugenQuotesParameter contained /^\s\{-0,}\<victory\d\+\>/
syntax match mugenQuotesStatement contained /^\s\{-0,}[^[:space:];]\{-1,}\s\{-0,}=.*$/ contains=mugenQuotesParameter,mugenComment,mugenString

syntax match  mugenQuotesSectionHeader contained /^\s\{-0,}\[\(\w\+\.\)\?quotes\].*$/ contains=mugenComment
syntax region mugenQuotesSection start=/^\s\{-0,}\[\(\w\+\.\)\?quotes\].*$/ end=/^\s\{-0,}\[[[:print:]]\{-1,}/me=s-1,he=s-1 end=/\%$/ fold contains=mugenQuotesSectionHeader,mugenQuotesStatement,mugenComment

highlight link mugenQuotesSectionHeader Define
highlight link mugenQuotesParameter     Keyword

"-------------------------------------------------------------------------------
" [Statedef] / [State] セクション
"-------------------------------------------------------------------------------
syntax keyword mugenStateController contained afterimage afterimagetime allpalfx angleadd angledraw anglemul angleset appendtoclipboard assertspecial attackdist attackmulset
syntax keyword mugenStateController contained bgpalfx bindtoparent bindtoroot bindtotarget
syntax keyword mugenStateController contained changeanim changeanim2 changestate clearclipboard ctrlset
syntax keyword mugenStateController contained defencemulset destroyself displaytoclipboard
syntax keyword mugenStateController contained envcolor envshake explod explodbindtime
syntax keyword mugenStateController contained forcefeedback fallenvshake
syntax keyword mugenStateController contained gamemakeanim gravity
syntax keyword mugenStateController contained helper hitadd hitby hitdef hitfalldamage hitfallset hitfallvel hitoverride hitvelset
syntax keyword mugenStateController contained lifeadd lifeset
syntax keyword mugenStateController contained makedust modifyexplod movehitreset
syntax keyword mugenStateController contained nothitby null
syntax keyword mugenStateController contained offset
syntax keyword mugenStateController contained palfx parentvaradd parentvarset pause playerpush playsnd posadd posfreeze posset poweradd powerset projectile
syntax keyword mugenStateController contained remappal removeexplod reversaldef
syntax keyword mugenStateController contained screenbound selfstate sprpriority statetypeset sndpan stopsnd superpause
syntax keyword mugenStateController contained targetbind targetdrop targetfacing targetlifeadd targetpoweradd targetstate targetveladd targetvelset trans turn
syntax keyword mugenStateController contained varadd varrandom varrangeset varset veladd velmul velset victoryquote
syntax keyword mugenStateController contained width

syntax match mugenStateTriggerSymbolAxis     contained /\<[xy]\>/
syntax match mugenStateTriggerSymbolConst    contained /\<data\.\(life\|power\|attack\|defence\|fall\.defence_mul\|liedown\.time\|airjuggle\|\(guard\.\)\?sparkno\|ko\.echo\|\(int\|float\)persistindex\)\>/
syntax match mugenStateTriggerSymbolConst    contained /\<size\.\([xy]scale\|\(ground\|air\)\.\(back\|front\)\|height\|attack\.dist\|proj\.\(attack\.dist\|doscale\)\|\(head\|mid\|draw\)\.pos\.[xy]\|shadowoffset\)\>/
syntax match mugenStateTriggerSymbolConst    contained /\<velocity\.\(\(walk\|runjump\)\.\(fwd\|back\)\.x\|run\.\(fwd\|back\)\.[xy]\|\(jump\|airjump\)\.\(neu\|back\|fwd\)\.x\|air\.gethit\.\(groundrecover\.[xy]\|airrecover\.\(\(mul\|add\)\.[xy]\|back\|fwd\|up\|down\)\)\)\>/
syntax match mugenStateTriggerSymbolConst    contained /\<movement\.\(airjump\.\(num\|height\)\|yaccel\|\(stand\|crouch\)\.friction\(\.threshold\)\?\|air\.gethit\.\(groundlevel\|groundrecover\.\(ground\.threshold\|groundlevel\)\|airrecover\.\(threshold\|yaccel\)\|trip\.groundlevel\)\|down\.\(bounce\.\(offset\.[xy]\|yaccel\|groundlevel\)\|friction\.threshold\)\)\>/
syntax match mugenStateTriggerSymbolHit      contained /\<\([xy]\(vel\(add\)\?\|off\)\)\>/
syntax match mugenStateTriggerSymbolHit      contained /\<\(anim\|air\|ground\)\?type\>/
syntax match mugenStateTriggerSymbolHit      contained /\<\(hit\|slide\|ctrl\|recover\|hitshake\)time\>/
syntax match mugenStateTriggerSymbolHit      contained /\<\(hit\|fall\)count\>/
syntax match mugenStateTriggerSymbolHit      contained /\<fall\(\.\(damage\|[xy]vel\|recover\(time\)\?\|kill\|envshake\.\(time\|freq\|ampl\|phase\)\)\)\?\>/
syntax match mugenStateTriggerSymbolHit      contained /\<\(damage\|yaccel\|chainid\|guarded\|isbound\)\>/
syntax match mugenStateTriggerSymbolTeamMode contained /\<\(single\|simul\|turns\)\>/
syntax cluster mugenStateTriggerSymbol contains=mugenStateTriggerSymbolAxis,mugenStateTriggerSymbolConst,mugenStateTriggerSymbolHit,mugenStateTriggerSymbolTeamMode

syntax keyword mugenStateTrigger contained abs acos ailevel alive anim animelem animelemno animelemtime animexist animtime asin atan authorname
syntax keyword mugenStateTrigger contained backedge backedgebodydist backedgedist bottomedge
syntax keyword mugenStateTrigger contained camerazoom canrecover ceil command cond const240p const480p const720p cos ctrl
syntax keyword mugenStateTrigger contained drawgame e exp
syntax keyword mugenStateTrigger contained facing floor frontedge frontedgebodydist frontedgedist fvar
syntax keyword mugenStateTrigger contained gameheight gametime gamewidth
syntax keyword mugenStateTrigger contained hitcount hitdefattr hitfall hitover hitpausetime hitshakeover hitvel
syntax keyword mugenStateTrigger contained id ifelse inguarddist ishelper ishometeam
syntax keyword mugenStateTrigger contained leftedge life lifemax ln log lose loseko losetime
syntax keyword mugenStateTrigger contained matchno matchover movecontact moveguarded movehit movetype movereversed
syntax keyword mugenStateTrigger contained name numenemy numexplod numhelper numpartner numproj numprojid numtarget
syntax keyword mugenStateTrigger contained p1name p2life p2movetype p2name p2stateno p2statetype p3name p4name palno pi power powermax playeridexist prevstateno projcanceltime projcontact projcontacttime projguarded projguardedtime projhit projhittime
syntax keyword mugenStateTrigger contained random rightedge rondno roundsexisted roundstate
syntax keyword mugenStateTrigger contained screenpos screenheight screenwidth selfanimexist sin stateno statetype stagevar sysfvar sysvar
syntax keyword mugenStateTrigger contained tan teamside tickspersecond time timemod topedge
syntax keyword mugenStateTrigger contained uniqhitcount
syntax keyword mugenStateTrigger contained var
syntax keyword mugenStateTrigger contained win winko wintime winperfect
syntax match   mugenStateTrigger contained /\<\(vel\|pos\|camerapos\|p2dist\|p2bodydist\|parentdist\|rootdist\)\s\{-1,}[xy]\>/ contains=mugenStateTriggerSymbolAxis
syntax match   mugenStateTrigger contained /\<const\>\s\{-0,}(\s\{-0,}.\{1,}\s\{-0,})/he=s+5 contains=mugenStateTriggerSymbolConst
syntax match   mugenStateTrigger contained /\<gethitvar\>\s\{-0,}(\s\{-0,}.\{-1,}\s\{-0,})/he=s+9 contains=mugenStateTriggerSymbolHit
syntax match   mugenStateTrigger contained /\<teammode\>\s\{-0,}\(=\|!=\)\s\{-0,}\<\(single\|simul\|turns\)\>/he=s+8 contains=mugenStateTriggerSymbolTeamMode

syntax match   mugenStateParameterSymbolStateType       contained /\<[scalu]\+\>/
syntax match   mugenStateParameterSymbolMoveType        contained /\<[aihu]\+\>/
syntax match   mugenStateParameterSymbolStatePhysics    contained /\<[scanu]\+\>/
syntax match   mugenStateParameterSymbolHitAttribute    contained /\<[nsha][atp]\>/
syntax keyword mugenStateParameterSymbolTrans           contained add add1 sub none
syntax keyword mugenStateParameterSymbolAssertFlag      contained intro invisible roundnotover nobardisplay nobg nofg nostandguard nocrouchguard noairguard noautoturn nojugglecheck noko nkosnd nokoslow noshadow globalnoshadow nomusic nowalk timerfreeze unguardable
syntax keyword mugenStateParameterSymbolCoordinateSpace contained screen stage
syntax keyword mugenStateParameterSymbolPostype         contained p1 p2 front back left right none
syntax keyword mugenStateParameterSymbolWaveform        contained sine square sinesquare off
syntax keyword mugenStateParameterSymbolHelpertype      contained normal player
syntax match   mugenStateParameterSymbolHitflag         contained /\<[hlamfd]\+[-+]\?\>/
syntax keyword mugenStateParameterSymbolAnimtype        contained light medium hard back diagup
syntax keyword mugenStateParameterSymbolAffectteam      contained B E
syntax keyword mugenStateParameterSymbolHitPriority     contained dodge hit miss
syntax keyword mugenStateParameterSymbolHitAttack       contained high low trip none
syntax cluster mugenStateParameterSymbol contains=mugenStateParameterSymbolStateType,mugenStateParameterSymbolMoveType,mugenStateParameterSymbolStatePhysics
syntax cluster mugenStateParameterSymbol add=mugenStateParameterSymbolHitAttribute   
syntax cluster mugenStateParameterSymbol add=mugenStateParameterSymbolTrans          
syntax cluster mugenStateParameterSymbol add=mugenStateParameterSymbolAssertFlag     
syntax cluster mugenStateParameterSymbol add=mugenStateParameterSymbolCoordinateSpace
syntax cluster mugenStateParameterSymbol add=mugenStateParameterSymbolPostype        
syntax cluster mugenStateParameterSymbol add=mugenStateParameterSymbolWaveform       
syntax cluster mugenStateParameterSymbol add=mugenStateParameterSymbolHelpertype     
syntax cluster mugenStateParameterSymbol add=mugenStateParameterSymbolHitflag        
syntax cluster mugenStateParameterSymbol add=mugenStateParameterSymbolAnimtype       
syntax cluster mugenStateParameterSymbol add=mugenStateParameterSymbolAffectteam     
syntax cluster mugenStateParameterSymbol add=mugenStateParameterSymbolHitPriority    
syntax cluster mugenStateParameterSymbol add=mugenStateParameterSymbolHitAttack      

syntax match mugenStateTriggerStatement contained excludenl /=\s\{-0,}.*$/ contains=mugenStateTrigger,@mugenNumber,mugenComment,mugenString,@mugenStateParameterSymbol

syntax match mugenStateParameter contained /^\s\{-0,}\<type\>/
syntax match mugenStateParameter contained /^\s\{-0,}\<trigger\(all\|\d\+\)\>/
syntax match mugenStateParameter contained /^\s\{-0,}\<persistent\>/
syntax match mugenStateParameter contained /^\s\{-0,}\<\(absolute\|abspan\|accel\|add\|affectteam\)\>/
syntax match mugenStateParameter contained /^\s\{-0,}\<afterimage\.\(time\|length\|palcolor\|palinvertall\|palbright\|palcontrast\|palpostbright\|paladd\|palmul\|timegap\|framegap\|trans\)\>/
syntax match mugenStateParameter contained /^\s\{-0,}\<\(air\.\(animtype\|cornerpush\.veloff\|fall\|hittime\|juggle\|type\|velocity\)\|airguard\.\(cornerpush\.veloff\|ctrltime\|velocity\)\)\>/
syntax match mugenStateParameter contained /^\s\{-0,}\<\(alpha\|ampl\|angle\|anim\|animtype\|attr\)\>/
syntax match mugenStateParameter contained /^\s\{-0,}\<\(bindid\|bindtime\)\>/
syntax match mugenStateParameter contained /^\s\{-0,}\<\(chainid\|channel\|color\|ctrl\)\>/
syntax match mugenStateParameter contained /^\s\{-0,}\<\(damage\|darken\|dest\|down\.\(bounce\|cornerpush\.veloff\|hittime\|velocity\)\)\>/
syntax match mugenStateParameter contained /^\s\{-0,}\<\(edge\|elem\|endcmdbuftime\|envshake\.\(ampl\|freq\|phase\|time\)\|excludeid\)\>/
syntax match mugenStateParameter contained /^\s\{-0,}\<\(facing\|fall\(\.\(animtype\|damage\|envshake\.\(ampl\|freq\|phase\|time\)\|kill\|recover\(time\)\?\|[xy]velocity\)\)\?\|first\|flag\d\{0,}\|force\(air\|nofall\|stand\)\|framegap\|freq\|freqmul\|fv\|fvalue\)\>/
syntax match mugenStateParameter contained /^\s\{-0,}\<\(\(get\|give\)power\|ground\.\(cornerpush\.veloff\|hittime\|slidetime\|type\|velocity\)\|guard\.\(cornerpush\.veloff\|ctrltime\|dist\|hittime\|kill\|pausetime\|slidetime\|sparkno\|velocity\)\|guard\(flag\|sound\)\)\>/
syntax match mugenStateParameter contained /^\s\{-0,}\<\(helpertype\|hit\(flag\|once\|sound\)\)\>/
syntax match mugenStateParameter contained /^\s\{-0,}\<\(id\|ignorehitpause\|invertall\)\>/
syntax match mugenStateParameter contained /^\s\{-0,}\<\(keepone\|keyctrl\|kill\)\>/
syntax match mugenStateParameter contained /^\s\{-0,}\<\(last\|length\|loop\|lowpriority\)\>/
syntax match mugenStateParameter contained /^\s\{-0,}\<\(\(max\|min\)dist\|move\(camera\|time\|type\)\|mul\)\>/
syntax match mugenStateParameter contained /^\s\{-0,}\<\(name\|nochainid\|numhits\)\>/
syntax match mugenStateParameter contained /^\s\{-0,}\<\(offset\|ontop\|ownpal\)\>/
syntax match mugenStateParameter contained /^\s\{-0,}\<\(p[12]\(facing\|sprpriority\|stateno\)\|p1getp2facing\|p2getp1state\|p2defmul\)\>/
syntax match mugenStateParameter contained /^\s\{-0,}\<pal\(add\|bright\|color\|contrast\|invertall\|mul\|postbright\)\>/
syntax match mugenStateParameter contained /^\s\{-0,}\<palfx\.\(add\|mul\|time\)\>/
syntax match mugenStateParameter contained /^\s\{-0,}\<\(pan\|params\|pause\(bg\|movetime\|time\)\|phase\|physics\|player\|pos\(2\|type\)\?\|poweradd\|priority\)\>/
syntax match mugenStateParameter contained /^\s\{-0,}\<proj\(\(cancel\|hit\|rem\)\?anim\|\(edge\|height\|stage\)bound\|hits\|id\|\(miss\|remove\)time\|\(spr\)\?priority\|remove\|scale\|shadow\)\>/
syntax match mugenStateParameter contained /^\s\{-0,}\<\(random\|range\|recursive\|remappal\|remove\(explods\|ongethit\|time\)\|remvelocity\|reversal\.attr\)\>/
syntax match mugenStateParameter contained /^\s\{-0,}\<\(scale\|self\|shadow\|sinadd\)\>/
syntax match mugenStateParameter contained /^\s\{-0,}\<size\.\(\(air\|ground\)\.\(back\|front\)\|\(head\|mid\)\.pos\|\(height\|proj\.doscale\|shadowoffset\|[xy]scale\)\)\>/
syntax match mugenStateParameter contained /^\s\{-0,}\<\(slot\|snap\|sound\|source\|space\|spacing\|spark\(no\|xy\)\|sprpriority\|state\(no\|type\)\|supermove\(time\)\?\)\>/
syntax match mugenStateParameter contained /^\s\{-0,}\<\(text\|time\(gap\)\?\|trans\)\>/
syntax match mugenStateParameter contained /^\s\{-0,}\<\(under\|unhittable\)\>/
syntax match mugenStateParameter contained /^\s\{-0,}\<\(v\|value2\?\|vel\|velmul\|velocity\|vfacing\|volume\(scale\)\?\)\>/
syntax match mugenStateParameter contained /^\s\{-0,}\<waveform\>/
syntax match mugenStateParameter contained /^\s\{-0,}\<\(x\|xangle\|xvel\)\>/
syntax match mugenStateParameter contained /^\s\{-0,}\<\(y\|yaccel\|yangle\|yvel\)\>/
syntax match mugenStateParameter contained /^\s\{-0,}\<\(var\|fvar\|sysvar\|sysfvar\)\>(\d\+)/ contains=mugenInteger

syntax match  mugenStateStatement     contained /^\s\{-0,}[^[:space:];]\{-1,}\s\{-0,}=.*$/ contains=mugenStateParameter,mugenStateTriggerStatement,mugenComment
syntax match  mugenStateStatement     contained /^\s\{-0,}\<type\>\s\{-0,}=.*$/ contains=mugenStateParameter,mugenStateController,mugenComment
syntax match  mugenStateStatement     contained /^\s\{-0,}\<trigger\(all\|\d\+\)\>\s\{-0,}=.*$/ contains=mugenStateParameter,mugenStateTriggerStatement,mugenComment
syntax match  mugenStateSectionHeader contained /^\s\{-0,}\[state\>.\{-0,}\].*$/ contains=mugenComment
syntax region mugenStateSection start=/^\s\{-0,}\[state\>.\{-0,}\].*$/ end=/^\s\{-0,}\[[[:print:]]\{-1,}/me=s-1,he=s-1 end=/\%$/ contained contains=mugenStateSectionHeader,mugenStateStatement,mugenComment

syntax match  mugenStateDefParameter     contained /^\s\{-0,}\<\(\(move\)\?type\|physics\|anim\|velset\|ctrl\|poweradd\|juggle\|facep2\|\(hitdef\|movehit\|hitcount\)persist\|sprpriority\)\>/
syntax match  mugenStateDefStatement     contained /^\s\{-0,}[^[:space:];]\{-1,}\s\{-0,}=.*$/ contains=mugenStateDefParameter,mugenStateTriggerStatement,mugenComment
syntax match  mugenStateDefSectionHeader contained /^\s\{-0,}\[statedef\s\{-1,}[-+]\?\d\+.\{-0,}\].*$/ contains=mugenInteger,mugenComment
syntax region mugenStateDefSection start=/^\s\{-0,}\[statedef\s\{-1,}[-+]\?\d\+.\{-0,}\].*$/ skip=/^\s\{-0,}\[state\>.\{-0,}\].*$/ end=/^\s\{-0,}\[[[:print:]]\{-1,}/me=s-1,he=s-1 end=/\%$/ fold contains=mugenStateDefSectionHeader,mugenStateSection,mugenStateDefStatement,mugenComment

highlight link mugenStateSectionHeader    Function
highlight link mugenStateDefSectionHeader Define
highlight link mugenStateController       Type
highlight link mugenStateParameter        Keyword
highlight link mugenStateSpecialParameter Keyword
highlight link mugenStateDefParameter     Keyword
highlight link mugenStateTrigger          Special

highlight link mugenStateParameterSymbolStateType       Special
highlight link mugenStateParameterSymbolMoveType        Special
highlight link mugenStateParameterSymbolStatePhysics    Special
highlight link mugenStateParameterSymbolHitAttribute    Special
highlight link mugenStateParameterSymbolTrans           Special
highlight link mugenStateParameterSymbolAssertFlag      Special
highlight link mugenStateParameterSymbolCoordinateSpace Special
highlight link mugenStateParameterSymbolPostype         Special
highlight link mugenStateParameterSymbolWaveform        Special
highlight link mugenStateParameterSymbolHelpertype      Special
highlight link mugenStateParameterSymbolHitflag         Special
highlight link mugenStateParameterSymbolAnimtype        Special
highlight link mugenStateParameterSymbolAffectteam      Special
highlight link mugenStateParameterSymbolHitPriority     Special
highlight link mugenStateParameterSymbolHitAttack       Special

highlight link mugenStateTriggerSymbolAxis     Identifier
highlight link mugenStateTriggerSymbolConst    Identifier
highlight link mugenStateTriggerSymbolConst    Identifier
highlight link mugenStateTriggerSymbolConst    Identifier
highlight link mugenStateTriggerSymbolConst    Identifier
highlight link mugenStateTriggerSymbolHit      Identifier
highlight link mugenStateTriggerSymbolHit      Identifier
highlight link mugenStateTriggerSymbolHit      Identifier
highlight link mugenStateTriggerSymbolHit      Identifier
highlight link mugenStateTriggerSymbolHit      Identifier
highlight link mugenStateTriggerSymbolHit      Identifier
highlight link mugenStateTriggerSymbolTeamMode Identifier


"-------------------------------------------------------------------------------
" .cmdファイル
"-------------------------------------------------------------------------------
" [Remap] セクション
syntax match mugenRemapValue     contained /\C\<[abcxyzs]\>/
syntax match mugenRemapParameter contained /^\s\{-0,}\C\<[abcxyzs]\>/
syntax match mugenRemapStatement contained /^\s\{-0,}\<[abcxyzs]\>\s\{-0,}=\s\{-0,}\<[abcxyzs]\>.*$/ contains=mugenRemapParameter,mugenRemapValue,mugenComment

syntax match  mugenRemapSectionHeader contained /^\s\{-0,}\[remap\].*$/ contains=mugenComment
syntax region mugenRemapSection start=/^\s\{-0,}\[remap\].*$/ end=/^\s\{-0,}\[[[:print:]]\{-1,}/me=s-1,he=s-1 end=/\%$/ contains=mugenRemapSectionHeader,mugenRemapStatement,mugenComment

highlight link mugenRemapSectionHeader Define
highlight link mugenRemapParameter     Keyword
highlight link mugenRemapValue         Identifier

" [Defaults] セクション
syntax match mugenDefaultsParameter contained /\s\{-0,}\<command\.\(buffer\.\)\?time\>/
syntax match mugenDefaultsStatement contained /^\s\{-0,}[^[:space:];]\{-1,}\s\{-0,}=.*$/ contains=mugenDefaultsParameter,@mugenNumber,mugenComment

syntax match  mugenDefaultsSectionHeader contained /^\s\{-0,}\[defaults\].*$/ contains=mugenComment
syntax region mugenDefaultsSection start=/^\s\{-0,}\[defaults\].*$/ end=/^\s\{-0,}\[[[:print:]]\{-1,}/me=s-1,he=s-1 end=/\%$/ contains=mugenDefaultsSectionHeader,mugenDefaultsStatement,mugenComment

highlight link mugenDefaultsSectionHeader Define
highlight link mugenDefaultsParameter     Keyword

" [Command] セクション
syntax match mugenCommandValue     contained /\(\/\|\~\(\d\+\)\?\|\$\|>\)\{-0,}\C\(B\|DB\|D\|DF\|F\|UF\|U\|UB|\)/
syntax match mugenCommandValue     contained /\(\/\|\~\(\d\+\)\?\|>\)\{-0,}\C[abcxyzs]\(\s\{-0,}+\s\{-0,}[abcxyzs]\)\{0,}/
syntax match mugenCommandParameter contained /\s\{-0,}\<\(name\|command\|\(buffer\.\)\?time\)\>/
syntax match mugenCommandStatement contained /^\s\{-0,}[^[:space:];]\{-1,}\s\{-0,}=.*$/ contains=mugenCommandParameter,mugenCommandValue,@mugenNumber,mugenString,mugenComment

syntax match  mugenCommandSectionHeader contained /^\s\{-0,}\[command\].*$/ contains=mugenComment
syntax region mugenCommandSection start=/^\s\{-0,}\[command\].*$/ end=/^\s\{-0,}\[[[:print:]]\{-1,}/me=s-1,he=s-1 end=/\%$/ contains=mugenCommandSectionHeader,mugenCommandStatement,mugenComment

highlight link mugenCommandSectionHeader Define
highlight link mugenCommandParameter     Keyword
highlight link mugenCommandValue         Special


"===============================================================================
" Highlight Range (Sync) Definitions
"===============================================================================
syntax sync fromstart


"-------------------------------------------------------------------------------
" $Id$
" vim: set ts=4 sw=4 ft=vim nowrap expandtab:
