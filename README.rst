===================
Haskell Everywhere!
===================

Exploring the design space of how to use Haskell in different environments.
This project is a work-in-progress and meant to be a template or an example for "real" applications.


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
- try to convert the example todo app from the react-flux project to react-native to see if react-native falls short
- include some webview-sub-app as part of the native app
- try to use some native component not yet in react-native
- make run in actual iPhone and Android phone
- submit to App Store and Google Play
- profit? nah...


Installation
------------

1. install `Nix <http://nixos.org/nixpkgs/>`_. You should already have it.
2. install XCode and some Android emulator depending on your needs.
3. ``git clone https://github.com/jyrimatti/hseverywhere``
4. Execute ``init.sh`` to download and install half the Internet.

Tested in OSX and Nixpkgs revision ``f16533449269bf798cd49eac41ba876b71eeddc0``. More recent Nixpkgs revisions will also probably work.

I tried to keep everything deterministic and from messing with your global environment, but I'm no expert with NPM. Pull requests are appreciated.


Running
-------

- >>> ./run-in-web.sh
- >>> ./run-in-ios.sh
- >>> ./run-in-android.sh

Browser and iOS simulator open automatically. Android emulator needs to be running in advance (can this somehow be opened automatically?).


Haskell development
-------------------

>>> nix-shell

Now you are inside a Nix shell with the required Haskell dependencies globally installed. Use cabal and pile up your haskell environment, e.g.

>>> nix-shell -p haskellPackages.stylish-haskell -p haskellPackages.hdevtools -p haskellPackages.apply-refact -p haskellPackages.pointfree

New Haskell-dependencies should be added to both cabal file and default.nix. Then rerun nix-shell.


iOS and Android development
---------------------------

I have no idea, never done those. I think you can just develop the projects created by react-native, but note that at least for now, this repo has added the whole react-native-subproject to .gitignore.


Continuous Compilation
----------------------

>>> ./cc.sh


Live reload
-----------

Whenever Haskell code compiles, the app should automatically reload itself. No manual refresh (CMD+r/double-r) should be necessary.

``run-in-web.sh`` starts webpack-dev-server which automatically reloads the app.

In iOS simulator enable "Live Reload" in shake-gesture menu.

In Android emulator enable "Live Reload" in shake-gesture menu (F2).

For some reason Live reload did not seem to work if both iOS simulator and Android emulator were running at the same time.
