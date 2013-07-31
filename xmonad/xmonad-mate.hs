import XMonad

-- n.b. the following code is inlined & badly ported from XMonad.Config.Gnome
-- from the XMonad Contrib packages:

-- original code by:
--      Copyright    : (c) Spencer Janssen <spencerjanssen@gmail.com>
--      License      : BSD
-- ported from GNOME to MATE by:
--      Copyright    : (c) rfc <reuben.fletchercostin@gmail.com>
--      License      : BSD

import Data.Ratio

import XMonad.Config.Desktop
import XMonad.Util.Run (safeSpawn)
import XMonad.Layout.Tabbed
import XMonad.Layout.NoBorders
import XMonad.Layout.PerWorkspace
import XMonad.Layout.IM
import XMonad.Layout.Grid
import XMonad.Layout.Spacing

import qualified Data.Map as M

import System.Environment (getEnvironment)

myWorkspaces = [ "1:main", "2:emacs", "3:web", "4:shells", "5:chat",
                 "6:email", "7", "8", "9" ]

myManageHook = composeAll
  [ className =? "Pidgin" --> doShift "5:chat"
  ]

myTheme = defaultTheme
  { fontName = "xft:Ubuntu-R:size=10"
  , decoHeight = 24
  }

myTiled  = smartSpacing 4 $ Tall 1 (3/100) (1/2)
myTabbed = tabbed shrinkText myTheme

gridLayout = spacing 8 $ Grid
pidginLayout = withIM (18/100) (Role "buddy_list") gridLayout

myLayout = onWorkspace "5:chat" pidginLayout $ myTiled ||| myTabbed

mateConfig = desktopConfig
  { terminal           = "mate-terminal"
  , keys               = mateKeys <+> keys desktopConfig
  , startupHook        = mateRegister >> startupHook desktopConfig
  , normalBorderColor  = "#777777"
  , focusedBorderColor = "#ff00ff"
  , borderWidth        = 1
  , layoutHook         = (desktopLayoutModifiers myLayout) ||| noBorders Full
  , manageHook         = myManageHook <+> manageHook desktopConfig
  , workspaces         = myWorkspaces
  }

mateKeys (XConfig {modMask = modm}) = M.fromList $
  [ ((modm, xK_p), mateRun)
  , ((modm .|. shiftMask, xK_q), spawn "mate-session-save --kill")
  -- , ((modm .|. shiftMask, xK_j), spawn "mate-terminal --profile blah")
  ]

-- | Launch the "Run Application" dialog.  mate-panel must be running for this
-- to work.
mateRun :: X ()
mateRun = withDisplay $ \dpy -> do
  rw         <- asks theRoot
  mate_panel <- getAtom "_MATE_PANEL_ACTION"
  panel_run  <- getAtom "_MATE_PANEL_ACTION_RUN_DIALOG"

  io $ allocaXEvent $ \e -> do
    setEventType e clientMessage
    setClientMessageEvent e rw mate_panel 32 panel_run 0
    sendEvent dpy rw False structureNotifyMask e
    sync dpy False

-- | Register xmonad with mate. 'dbus-send' must be in the $PATH with which
-- xmonad is started.
--
-- This action reduces a delay on startup only only if you have configured
-- mate-session>=2.26: to start xmonad with a command as such:
--
-- > mateconftool-2 -s /desktop/mate/session/required_components/windowmanager xmonad --type string
mateRegister :: MonadIO m => m ()
mateRegister = io $ do
  x <- lookup "DESKTOP_AUTOSTART_ID" `fmap` getEnvironment
  whenJust x $ \sessionId ->
    safeSpawn "dbus-send"
      [ "--session"
      , "--print-reply=string"
      , "--dest=org.mate.SessionManager"
      , "/org/mate/SessionManager"
      , "org.mate.SessionManager.RegisterClient"
      , "string:xmonad"
      , "string:" ++ sessionId]

main = xmonad mateConfig

