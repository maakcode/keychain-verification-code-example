# Keychain Verification Code

1. Run server and ngrok.
2. Set any password and sign in.
3. Save password in Keychain.
4. Press 'Connect OTP' button.
5. Select the password.

<div>
<img width="390" alt="Keychain Verification Code with Autofill" src="https://user-images.githubusercontent.com/11623298/210806963-fc24b6e2-ec56-4b56-9f3b-ec48570ce61c.png">
<img width="390" alt="Keychain Verification Code in Passwords" src="https://user-images.githubusercontent.com/11623298/210806969-bd6d889b-a3ca-4754-b362-662c89e33b23.png">
</div>

# Installation

This example needs [ngrok](https://ngrok.com) and Ruby 3.1.3 (using rbenv recommended)

1. Install packages using Bundler
```zsh
make install
```

2. Setup project with Makefile.

```zsh
make setup
```

3. Input your Apple Developer **Team ID** for Apple App Site Association. (You can find it from <https://developer.apple.com/account/#!/membership/>)

4. Run Ngrok. It bridges between your localhost and the Apple server.
```zsh
ngrok http 4567
```

5. Run Sinatra. (Local API Server)
```zsh
ruby api.rb
```

6. Open the `.xcworkspace` file and build project. It automatically matches the host name to the running ngrok's forwarding host. 

7. If you have Xcode error about entitlements, please clean up your build folder.
