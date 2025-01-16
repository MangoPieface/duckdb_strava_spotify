#DuckDB interrogation of Spotify data

This little bit of SQL allows you to use DuckDB to query your Spotify data, and see what tracks and artists tickled your fancy across the years.

It also combines this data with an export of Strava activities, so you can see what you were listening to doing exercise.

# Spotify data
If you have used Spotify for a while you are sitting on a treasure trove of data as you are able to export everything you've ever listened to, when you listened to it, for how long, on what OS etc. etc.

Details of of what is in this data export can be found in [Understanding my data - Spotify](https://support.spotify.com/uk/article/understanding-my-data/).

You can download your data from [Account privacy - Spotify](https://www.spotify.com/uk/account/privacy/).

# Strava data
You can bulk download all your Strava data from here [Exporting your Data and Bulk Export – Strava Support](https://support.strava.com/hc/en-us/articles/216918437-Exporting-your-Data-and-Bulk-Export#h_01GG58HC4F1BGQ9PQZZVANN6WF)



# DuckDB

[DuckDB](https://duckdb.org/) is a [very fast database](https://tomtunguz.com/motherduck-seed-a/) designed for online analytic processing (OLAP) of small to medium datasets - It is portable and runs easily on a laptop.

It's 20MB, has zero dependencies and is open-source.

## Prerequities

- Download [DuckDB](https://duckdb.org/docs/installation/?version=stable&environment=cli&platform=win&download_method=package_manager&architecture=x86_64)
- Get your [Understanding my data - Spotify](https://support.spotify.com/uk/article/understanding-my-data/).
- [optional] Get your [Strava data](https://support.strava.com/hc/en-us/articles/216918437-Exporting-your-Data-and-Bulk-Export#h_01GG58HC4F1BGQ9PQZZVANN6WF)

## Getting started

TODO
