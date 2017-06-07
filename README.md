# Telldus

This is a library for controlling your smart devices though the [Telldus Live API](http://api.telldus.com).

You will need to add your own [API keys](http://api.telldus.com/keys/index) by one of the following ways:

* Add the keys to `config/config.exs`
```
  config :telldus, oauth: %{
    consumer_key: "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
    consumer_secret: "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
    access_token: "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
    access_token_secret: "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
  }
```
* Configure them using the following system environment variables: `CONSUMER_KEY`, `CONSUMER_SECRET`, `ACCESS_TOKEN`, `ACCESS_TOKEN_SECRET`
