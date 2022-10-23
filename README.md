# GA4 Generic Event Tag

After working for over a decade with GTM, I've found that using a a single generic event tag works best for me.

This is why I've created this simple GA4 tag that can capture a formatted dataLayer push event and pass it onwards to GA4 without creating multiple event tags per each evnet you want to track.

```javascript
dataLayer.push({
    'event': 'ga_event',
    'event_name': 'log in',
    'eventParams': {
        'method': 'google',
        'campaign': 'summer vibes'
    },
    'userProp': {
        'age': 33,
        'status': 'vip'
    }
})
```

## Working with the tag
The event tag has several inputs:
1. Measurement ID (Mandatory) - Here you simply add in your GA4 Stream ID
2. Event Name (Mandatory) - Select a specific variable that you will use as the event's name
3. Event Parameters (Optional) - As GA4 events can carry various parameters, you can select a single variable to send these
4. User Properties (Optional) - Similarly, you can select a single variable that captures user properties to send

## Send Event Parameters
The event paramters should be nested under a single variable:
```javascript
'eventParams': {
    'method': 'google',
    'campaign': 'summer vibes'
}
```

## Send User Properties
The user propertiesshould be nested under a single variable:
```javascript
'userProp': {
    'age': 33,
    'status': 'vip'
}
```

