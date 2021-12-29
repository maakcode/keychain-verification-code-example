# Installation

This example needs [Ngrok](https://ngrok.com) and Ruby 3.0.3+.

1. Setup project with Makefile.

```zsh
make
```

2. Input your Apple Developer **Team ID** for Apple App Site Association. (You can find it from <https://developer.apple.com/account/#!/membership/>)

3. Run Ngrok. It bridges between your localhost and the Apple server.
```zsh
ngrok http 4567
```

4. Run Sinatra. (Local API Server)
```zsh
ruby api.rb
```

5. Open the `.xcworkspace` file and build project. It automatically matches the host name to the running ngrok's forwarding host. 

6. Close and reopen the project. (Due to Info.plist bug in Xcode 13.2.1 🥲. See [Xcode 13 Missing Info.plist](https://useyourloaf.com/blog/xcode-13-missing-info.plist/) article at useyourloaf.com)
