# munztools

Misc tools for Munzee

* diff\_myth: Show how many types of mythologicals you have captured on each
  day in a date range.
* munzee\_types: Parse the global Munzee types web page and report on Munzee
  counts by type and category.
* capture\_types: Report on player's captures by type and category.
* deploy\_types: Report on player's deploys by type and category.

## Setup

Run ``bundle install`` to set up the required gems.

You'll also need to obtain a client ID and client secret.

1. Go to the Munzee [Developer Dashboard](https://www.munzee.com/api/apps).
1. Click on 'Create App'.
1. Enter the app details as follows:
    * App Name: `munztools`
    * Description: `Misc tools for Munzee`
    * Redirect URI: `http://localhost:8557/oauth2/callback`
1. Click on 'Create App'.
1. Take note of the ID and Secret of the newly created app.
1. Create a file named `.munztools.conf` in your home directory.
1. Add the following lines to this file:

    ```yaml
    client_id: CLIENT_ID
    client_secret: CLIENT_SECRET
    ```

    where CLIENT\_ID and CLIENT\_SECRET are the ID and Secret you noted above.

## Usage

For diff\_myth usage info:

```sh
bundle exec ruby diff_myth.rb --help
```

For munzee\_types usage info:

```sh
bundle exec ruby munzee_types.rb --help
```

For capture\_types usage info:

```sh
bundle exec ruby player_stats/capture_types.rb --help
```

For deploy\_types usage info:

```sh
bundle exec ruby player_stats/deploy_types.rb --help
```
