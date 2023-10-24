package com.teamp.web.service;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.TimeUnit;

public class CacheService {

    private final ConcurrentHashMap<String, String> cache = new ConcurrentHashMap<>();

    public void setWithExpire(String key, String value, long timeout, TimeUnit unit) {
        cache.put(key, value);
        // Schedule the key to be removed after the specified timeout
        scheduleRemoval(key, timeout, unit);
    }

    public String get(String key) {
        return cache.get(key);
    }

    public void delete(String key) {
        cache.remove(key);
    }

    private void scheduleRemoval(String key, long timeout, TimeUnit unit) {
        new java.util.Timer().schedule(
            new java.util.TimerTask() {
                @Override
                public void run() {
                    delete(key);
                }
            },
            unit.toMillis(timeout)
        );
    }
}
