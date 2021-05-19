# Flutter Web Template - Firebase Auth

A lightweight template for Flutter Web application, containing a Home page, and a Admin page. This template has standard web navigation (without #), and uses Google Authentication method from Firebase for sining the user in. When successfully signed in, the Provider/ChangeNotifier will emit a state change.
This template is meant as a Starter Kit for you to improve and expand upon, maybe you want to use Bloc/Cubit instead of Provider. 🤷‍♀️

FYI: ```_contentHandler()``` function in AdminPage.dart is a "hack" for identifying the user Auth state. Because **Hot Reload** disconnects the Auth Provider the User object remains null, even though the user is actually signed in. Therefor hitting the ```command + s``` will not work properly, you instead have to hit the **refresh button in Chrome**.

### TODO:

- ###### Add web support to an existing app. Run the following command from your project’s directory:
```flutter create .```

- ###### Create a Firebase project, add the script to index.html, and enable Google authentication.
- ###### Implement this configuratuion: https://flutter.dev/docs/development/ui/navigation/url-strategies


### Features
- ###### FlutterFire
- ###### Nullsafety
- ###### Provider/Changenotifier
- ###### PathUrl strategy

When using Flutter Web with null-safety you will experience the following crash
```Error: Expected a value of type 'Object', but got one of type 'Null'```
There doesn't seem to be a fix for it atm, but at least it doesn't impact the app.

A small donation would be appreciated
https://www.paypal.com/paypalme/christermuntean 🙏
