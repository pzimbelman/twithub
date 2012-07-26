
# Twithub

Twithub is a gem to let you easily retrive both your twitter and github activity into a single feed.

[![Build Status](https://secure.travis-ci.org/pzimbelman/twithub.png?branch=master)](http://travis-ci.org/pzimbelman/twithub)

## Installation

    gem install twithub

## Basic Usage

To get a users recent activity, you can simply perform the following:

    Twithub.entries_for(:twitter => "pzimbelman", :github => "pzimbelman")

This will return an array of entry objects sorted with the most recent entry first. Additionally, you can supply a :count parameter to limit the number of entries returned:

    Twithub.entries_for(:github => "pzimbelman, :count => 8)

Currently, only a single username is accepted for both the github and twitter parameters. Support for multiple logins will likely be added soon.

## JSON and Caching

Twithub entries can be taken to JSON which will return a hash of the objects attributes:

    entry.to_json
    => "{\"content\":\"pzimbelman pushed to master at pzimbelman/blog\",\"username\":\"pzimbelman\",\"posted_at\":\"2012-07-23 17:35:47 UTC\",\"origin\":\"github\"}"

This can be useful for caching response values to reduce external http calls. In addition to this, Twithub provides the ability to easily obtain entry objects again from JSON string values:

    json_string = "{\"content\":\"pzimbelman pushed to master at pzimbelman/blog\",\"username\":\"pzimbelman\",\"posted_at\":\"2012-07-23 17:35:47 UTC\",\"origin\":\"github\"}"
    Twithub.from_json(json_string)

The from_json method will accept a string representing a single entry, or a string which represents an array of entries. 
