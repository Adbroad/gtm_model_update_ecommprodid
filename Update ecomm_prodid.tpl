___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "MACRO",
  "id": "cvt_temp_public_id",
  "categories": ["ADVERTISING"],
  "version": 1,
  "securityGroups": [],
  "displayName": "Update ecomm_prodid",
  "description": "Replaces a character in your google_tag_param.ecomm_prodid by another character of your choice. Can also add a suffix. Works for strings or arrays of products.",
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "TEXT",
    "name": "to_replace",
    "displayName": "Valeur à remplacer",
    "simpleValueType": true,
    "help": "Le texte à remplacer dans l\u0027id produit"
  },
  {
    "type": "TEXT",
    "name": "replace_value",
    "displayName": "Valeur de remplacement",
    "simpleValueType": true,
    "help": "La valeur de remplacement à mettre à la place."
  },
  {
    "type": "TEXT",
    "name": "prefix",
    "displayName": "Prefixe",
    "simpleValueType": true,
    "help": "Préfixe à ajouter à l\u0027id (optionnel)",
    "canBeEmptyString": false
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

// Saisissez le code de votre modèle ici.
const copyFromDatalayer = require('copyFromDataLayer');
const log = require('logToConsole');

const google_tag_params = copyFromDatalayer('google_tag_params');
if(!google_tag_params) return false;

const ecomm_prodid = google_tag_params.hasOwnProperty('ecomm_prodid') ? google_tag_params.ecomm_prodid : null;
if(!ecomm_prodid) return false;

let newGtagParams = google_tag_params;
if(typeof ecomm_prodid !== "string") {
  newGtagParams.ecomm_prodid = google_tag_params.ecomm_prodid.map(p => {
    if(data.prefix) {
      p = data.prefix + p;
    }
    p = p.replace(data.to_replace, data.replace_value);
    return p;
  });
} else {
  if(data.prefix) {
    newGtagParams.ecomm_prodid = data.prefix + google_tag_params.ecomm_prodid;
  }
  newGtagParams.ecomm_prodid = google_tag_params.ecomm_prodid.replace(data.to_replace, data.replace_value);
}

// Les variables doivent renvoyer une valeur.
return newGtagParams;


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "read_data_layer",
        "versionId": "1"
      },
      "param": [
        {
          "key": "keyPatterns",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "google_tag_params"
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
    "isRequired": true
  }
]


___TESTS___

scenarios: []


___NOTES___

Created on 01/03/2023 13:13:59


