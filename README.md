This is a fork of [HouseTrip's remote_lock](https://github.com/HouseTrip/remote_lock) gem, adding support to Dalli as way to handle memcache connections.

remote_lock
===========

This is a rewrite of a initial extraction from Nick Kallen's [cache-money](http://github.com/nkallen/cache-money) and
also a fork from James Golick [memcache-lock](https://github.com/jamesgolick/memcache-lock)

This adds supports for memcache or redis as lock storage.

Initialization
-------------

* Lock using Dalli:

  ```ruby
  # dalli = Rails.cache.dalli
  # Or whatever way you have your memcache connection
  $lock = RemoteLock.new(RemoteLock::Adapters::Dalli.new(dalli))
  ```

* Lock using Memcached:

  ```ruby
  # memcache = MemCache.new(YAML.load(File.read("/path/to/memcache/config")))
  # Or whatever way you have your memcache connection
  $lock = RemoteLock.new(RemoteLock::Adapters::Memcached.new(memcache))
  ```

* Lock using Redis:

  ```ruby
  # redis = Redis.new
  # Or whatever way you have your redis connection
  $lock = RemoteLock.new(RemoteLock::Adapters::Redis.new(redis))
  ```

Usage
-----

Then, wherever you'd like to lock a key, use it like this:

```ruby
$lock.synchronize("some-key") do
  # stuff that needs synchronization in here
end
```

Options:

* TTL

  By default keys will expire after 60 seconds, you can define this per key:

  ```ruby
  $lock.synchronize("my-key", expiry: 30.seconds) do ... end
  ```

* Attempts

  By default it will try 11 times to lock the resource, this can be set per key:

  ```ruby
  $lock.synchronize("my-key", retries: 5) do ... end
  ```

* Tries interval

  You can customize the interval between tries, initially it's 10ms:

  ```ruby
  $lock.synchronize("my-key", initial_wait: 10e-3) do ... end
  ```

For more info, see lib/remote_lock.rb. It's very straightforward to read.
