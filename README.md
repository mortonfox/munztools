# munztools

Misc tools for Munzee

* diff\_myth: Show how many types of mythologicals you have captured on each
  day in a date range.
* munzee\_types: Scrape the global munzee types page and generate reports of
  munzees sorted by count.

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

For diff\_myth help:

```
bundle exec ruby diff_myth.rb --help
```
