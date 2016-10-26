===================
Haskell Everywhere!
===================

Exploring the design space of how to use Haskell in different environments.
This project is a work-in-progress and meant to be a template or an example for "real" applications.


.. image:: hseverywhere.png


Steps
-----

- *copy-paste a simple example app from https://hackage.haskell.org/package/react-flux*
- *make run in web browser*
- *make run as GTK app (not done since couldn't get webkit to compile under osx)*
- *wrap with `react-native <https://facebook.github.io/react-native/>`_*
- *curse `NPM <https://www.npmjs.com/>`_*
- *make run in iOS simulator*
- *include https://github.com/necolas/react-native-web to make run in browser again*
- *make run in Android emulator*
- *make Live Reload work in all envs*
- *write a README*
- *cleanup and upload to github*
- *make run in OSX with https://github.com/ptmt/react-native-desktop*
- *try to convert the example todo app from the react-flux project to react-native to see if react-native falls short*
- *create scripts for easy packaging*
- *publish example apps to internet (except for ios...)*
- *purify nix-scripts to reduce hidden dependencies*
- *add support of 3rd party (also native) addons*
- make GHCJSi REPL work
- make run in actual iPhone and Android phone
- submit to App Store and Google Play
- finish todo app to work perfectly in all platforms
- include some webview-sub-app as part of the native app
- try to use some native component not yet in react-native
- make run in windows with https://github.com/ReactWindows/react-native
- profit? nah...


I just wanna try the example app!
---------------------------------

Available in:

http://lahteenmaki.net/hsEverywhere.html

http://lahteenmaki.net/hsEverywhere.dmg

http://lahteenmaki.net/hsEverywhere.apk

If you don't trust me (and you shouldn't!), just follow the instructions to build on your own machine.


Installation
------------

1. install `Nix <http://nixos.org/nixpkgs/>`_. You should already have it.
2. install XCode if running in OSX. Install Vagrant if running in Windows. No other dependencies should be needed.
3. ``git clone https://github.com/jyrimatti/hseverywhere``
4. Execute ``quickstart.sh`` to download and install half the Internet, initialize, build, package and run everything.

Tested in OSX.

I tried to keep everything deterministic and from messing with your global environment, but I'm no expert with NPM. Pull requests are appreciated.

Installation creates a subdirectory containing all the react-native stuff.
This directory is for now completely generated (unless You modify it somehow yourself), so if you think you've messed up something or want to update js-dependencies, just rm -R the generated directory and re-run init.sh.


Windows
-------

Initialize a Windows VM with Visual Studio:

- >>> ./init-windows.bat

When the VM starts, execute the commands from ``init-WinRM.bat`` as Administrator.
Vagrant should now be able to connect and finish initialization.

Open the solution (from c:\vagrant\<projectname>\windows\<projectname>.sln) and let Visual Studio "Install missing features". I couldn't resolve a suitable subset of the features to install automatically, curse Microsoft and installers.

You can now start the Windows app, after which it should be able to connect to the same packager as ios/android:

./run-windows.bat

For actual debugging and resolving of mysterious crashes you can start the app from Visual Studio.


Addons
------

List addons to ``addons.txt`` preferably with a version number.
Add initialization to ``register_addons.[platform.].js``
Execute ``init-addons.sh`` to install and link the addons.

Note that most addons currently work only on IOS and Android.


Running
-------

- >>> ./run-web.sh
- >>> ./run-ios.sh
- >>> ./run-android.sh
- >>> ./run-osx.sh
- >>> ./run-windows.sh

or just

- >>> ./run-all.sh

Also start packagers:
- >>> ./start-packagers.sh

Browser, iOS simulator and Android emulator open automatically.
OSX opens XCode, in which you have to 'Run' the app (can this be done from the command line?).
Windows app runs inside a Virtual Box VM.

All can be run simultaneously.
Default port choices can be changed (except for Android/Windows) by giving new port as an argument, e.g.

- >>> ./run-osx.sh 8191

If Android emulator complains about HAX etc, check you don't have any VirtualBoxes running.


Haskell development
-------------------

>>> ./shell.sh

Now you are inside a Nix shell with the required Haskell dependencies globally installed. Use cabal and pile up your haskell environment, e.g.

>>> nix-shell -p haskellPackages.stylish-haskell -p haskellPackages.hdevtools -p haskellPackages.apply-refact -p haskellPackages.pointfree

Unfortunately, ghc-mod or hdevtools don't yet work with GHCJS.

New Haskell-dependencies should be added to both cabal file and default.nix. Then rerun nix-shell.


iOS/Android/OSX/Windows development
---------------------------

I have no idea, never done those. I think you can just develop the projects created by react-native, but note that at least for now, this repo has added the whole react-native-subproject to .gitignore.


Continuous Compilation
----------------------

>>> ./cc.sh

Feedback cycle is still quite poor.
If I have all 4 platforms running and save a change in Haskell code,
after about 45 seconds I see the effect in all platforms (and osx needs a manual reload).
Could be worse, though.


Live reload
-----------

Whenever Haskell code compiles, the app should automatically reload itself. No manual refresh (CMD+r/double-r) should be necessary, except in OSX.

``run-web.sh`` starts webpack-dev-server which automatically reloads the app.

In other platforms, enable "Live Reload" in shake-gesture menu.


Repl
----

- >>> ./build.sh
- >>> ./run-<platform>.sh
- >>> ./repl.sh

Somewhat working for all platforms, but really unstable and slow.
Always hooked to port 8080 for now, so can only be used with one platform at a time.
How can I pass a port from shell scripts to the actual runtime?


Packaging
---------

- >>> ./package-web.sh
- >>> ./package-android.sh
- >>> ./package-osx.sh

or just

- >>> ./package-all.sh

Problems
--------

- some styling inconsistencies between ios and android
- react-native-desktop is still work-in-progress
  - needs message for alert although should be optional
  - text-input is always multiline
  - text-input seems to fire onBlur after half-a-second its activation
  - rotation-transformation does not seem to work
- react-native-web is still work-in-progress
  - no support for ListView
  - no support for Linking API
  - TextInput does not support submitting
  - text components collapse together (maybe a missing white-space: pre; ?)
