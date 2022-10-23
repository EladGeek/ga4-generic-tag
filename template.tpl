___TERMS_OF_SERVICE___
By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "TAG",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "GA4 Generic Event",
  "brand": {
    "id": "Creative Geek",
    "displayName": ""
  },
  "description": "",
  "containerContexts": [
    "WEB"
  ]
}
___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "TAG",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "GA4 Generic Event",
  "categories": ["ANALYTICS"],
  "brand": {
    "id": "Creative Geek",
    "displayName": ""
  },
  "description": "",
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "TEXT",
    "name": "measurementId",
    "displayName": "Measurement ID",
    "simpleValueType": true,
    "help": "Enter the Measurement ID (e.g, G-A2ABC2ABCD) for your GA4 property.",
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      }
    ]
  },
  {
    "type": "SELECT",
    "name": "eventName",
    "displayName": "Event Name Variable",
    "macrosInSelect": true,
    "selectItems": [],
    "simpleValueType": true
  },
  {
    "type": "SELECT",
    "name": "eventParams",
    "displayName": "Event Parameters Object (Optional)",
    "macrosInSelect": true,
    "selectItems": [],
    "simpleValueType": true,
    "notSetText": "None",
    "defaultValue": ""
  },
  {
    "type": "SELECT",
    "name": "userProp",
    "displayName": "User Properties Object (Optional)",
    "macrosInSelect": true,
    "selectItems": [],
    "simpleValueType": true,
    "notSetText": "None",
    "defaultValue": ""
  },
  {
    "type": "GROUP",
    "name": "advncedOptions",
    "displayName": "Advanced options",
    "groupStyle": "ZIPPY_CLOSED",
    "subParams": [
      {
        "type": "SIMPLE_TABLE",
        "name": "ignoreParams",
        "displayName": "Parameters to Exclude",
        "simpleTableColumns": [
          {
            "defaultValue": "",
            "displayName": "Parameter name",
            "name": "column1",
            "type": "TEXT"
          }
        ],
        "help": "Event parameters listed here will not be sent to Google."
      },
      {
        "type": "SIMPLE_TABLE",
        "name": "ignoreProp",
        "displayName": "Properties to Exclude",
        "simpleTableColumns": [
          {
            "defaultValue": "",
            "displayName": "Property name",
            "name": "column1",
            "type": "TEXT"
          }
        ],
        "help": "User properties listed here will not be sent to Google."
      }
    ]
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

const log = require('logToConsole');
const query = require('queryPermission');
const createQueue = require('createQueue');
const createArgumentsQueue = require('createArgumentsQueue');
const copyFromWindow = require('copyFromWindow');
const setInWindow = require('setInWindow');
const injectScript = require('injectScript');
const getTimestampMillis = require('getTimestampMillis');
const encodeUriComponent = require('encodeUriComponent');
const eventName = data.eventName;
const measurementId = data.measurementId;
let eventParams = data.eventParams || undefined;
let userProp = data.userProp || undefined;
let ignoreParams = data.ignoreParams || undefined;
let ignoreProps = data.ignoreProps || undefined;


let gtag = copyFromWindow('gtag');
if (!gtag) {
    gtag = createArgumentsQueue('gtag', 'dataLayer');
    injectScript('https://www.googletagmanager.com/gtag/js?id=' + encodeUriComponent(measurementId), data.gtmOnSuccess, data.gtmOnFailure, 'gtag');

    gtag('js', getTimestampMillis());
}


gtag('config', measurementId, {
    send_page_view: false
});


if (userProp) {
    if (ignoreProps) {
        for (let key in ignoreProps) {
            if (userProp.hasOwnProperty(key)) {
                userProp.key = undefined;
            }
        }
    }
    gtag('set', 'user_properties', userProp);
}

if (ignoreParams) {
    for (let key in ignoreParams) {
        if (eventParams.hasOwnProperty(key)) {
            eventParams.key = undefined;
        }
    }
}


if (!eventParams) {
    eventParams = {};
}

eventParams.send_to = measurementId;

gtag('event', eventName, eventParams);

data.gtmOnSuccess();


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "logging",
        "versionId": "1"
      },
      "param": [
        {
          "key": "environments",
          "value": {
            "type": 1,
            "string": "debug"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "access_globals",
        "versionId": "1"
      },
      "param": [
        {
          "key": "keys",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "dataLayer"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "gtag"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  }
                ]
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "inject_script",
        "versionId": "1"
      },
      "param": [
        {
          "key": "urls",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "https://www.googletagmanager.com/gtag/js?id\u003d*"
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


___TESTS___

scenarios: []
setup: ''


___NOTES___

Created on 10/23/2022, 6:33:29 PM




___TEMPLATE_PARAMETERS___

[
  {
    "type": "TEXT",
    "name": "measurementId",
    "displayName": "Measurement ID",
    "simpleValueType": true,
    "help": "Enter the Measurement ID (e.g, G-A2ABC2ABCD) for your GA4 property.",
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      }
    ]
  },
  {
    "type": "SELECT",
    "name": "eventName",
    "displayName": "Event Name",
    "macrosInSelect": true,
    "selectItems": [],
    "simpleValueType": true
  },
  {
    "type": "SELECT",
    "name": "eventParams",
    "displayName": "Event Parameters (Optional)",
    "macrosInSelect": true,
    "selectItems": [],
    "simpleValueType": true
  },
  {
    "type": "SELECT",
    "name": "userProp",
    "displayName": "User Properties (Optional)",
    "macrosInSelect": true,
    "selectItems": [],
    "simpleValueType": true
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

const log = require('logToConsole');
const query = require('queryPermission');
const createQueue = require('createQueue');
const createArgumentsQueue = require('createArgumentsQueue');
const copyFromWindow = require('copyFromWindow');
const setInWindow = require('setInWindow');
const injectScript = require('injectScript');
const getTimestampMillis = require('getTimestampMillis');
const encodeUriComponent = require('encodeUriComponent');
const eventName = data.eventName;
const measurementId = data.measurementId;
let eventParams = data.eventParams || undefined;
let userProp = data.userProp || undefined;


let gtag = copyFromWindow('gtag');
if (!gtag) {
    gtag = createArgumentsQueue('gtag', 'dataLayer');
    injectScript('https://www.googletagmanager.com/gtag/js?id=' + encodeUriComponent(measurementId), data.gtmOnSuccess, data.gtmOnFailure, 'gtag');

    gtag('js', getTimestampMillis());
}


gtag('config', measurementId, {
    send_page_view: false
});


if (userProp) {
    gtag('set', 'user_properties', userProp);
}


if (!eventParams) {
    eventParams = {};
}

eventParams.send_to = measurementId;

gtag('event', eventName, eventParams);

data.gtmOnSuccess();


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "logging",
        "versionId": "1"
      },
      "param": [
        {
          "key": "environments",
          "value": {
            "type": 1,
            "string": "debug"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "access_globals",
        "versionId": "1"
      },
      "param": [
        {
          "key": "keys",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "dataLayer"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "gtag"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  }
                ]
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "inject_script",
        "versionId": "1"
      },
      "param": [
        {
          "key": "urls",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "https://www.googletagmanager.com/gtag/js?id\u003d*"
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


___TESTS___

scenarios: []


___NOTES___

Created on 10/23/2022, 4:40:00 PM


