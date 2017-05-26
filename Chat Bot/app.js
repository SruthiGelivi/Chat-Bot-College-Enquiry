/**
 * Copyright 2015 IBM Corp. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

'use strict';

var express = require('express'); // app server
var bodyParser = require('body-parser'); // parser for post requests
var Conversation = require('watson-developer-cloud/conversation/v1'); // watson sdk

var app = express();

// Bootstrap application settings
app.use(express.static('./public')); // load UI from public folder
app.use(bodyParser.json());

// Create the service wrapper
var conversation = new Conversation({
  // If unspecified here, the CONVERSATION_USERNAME and CONVERSATION_PASSWORD env properties will be checked
  // After that, the SDK will fall back to the bluemix-provided VCAP_SERVICES environment property
   username:'2a4c59f7-40d3-4209-a6f1-9b76112c30b9',
       //'e17d5d9a-988a-47c7-97f8-ac79a893069b',
    // 4219cc93-b86a-432a-abed-8170518216db',
   password:'g8OsBf2Nd1Xx',
       // 'pd48YViqSfRN',
   //'6nuN3POfWJBm',
    url: 'https://gateway.watsonplatform.net/conversation/api',
   path: {
     // workspace_id: 'f6914549-ff9f-4c5e-9306-6cafa97964f1'
      // workspace_id:'ad7fbb8d-41fb-4487-84ab-98247601b0e9'
       workspace_id:'cad5de86-299e-4493-9b56-5501e6cf8efb'
   },
  //version_date: '2016-10-21',
    version_date: '2016-09-20',
  version: 'v1'
});

// Endpoint to be call from the client side
app.post('/api/message', function(req, res) {
 // var workspace = process.env.WORKSPACE_ID || '<workspace-id>';
  // var workspace = 'f6914549-ff9f-4c5e-9306-6cafa97964f1';
  // var workspace='ad7fbb8d-41fb-4487-84ab-98247601b0e9';
   var workspace = 'aa0b98c3-985b-4d14-96b0-a91adbc52a47';
    //console.log(""+workspace);
  if (!workspace || workspace === '<workspace-id>') {
    return res.json({
      'output': {
        'text': 'The app has not been configured with a <b>WORKSPACE_ID</b> environment variable. Please refer to the ' + '<a href="https://github.com/watson-developer-cloud/conversation-simple">README</a> documentation on how to set this variable. <br>' + 'Once a workspace has been defined the intents may be imported from ' + '<a href="https://github.com/watson-developer-cloud/conversation-simple/blob/master/training/car_workspace.json">here</a> in order to get a working application.'
      }
    });
  }
  var payload = {
    workspace_id: workspace,
     // workspace_id: process.env.WORKSPACE_ID || '<workspace-id>',
    context: req.body.context || {},
    input: req.body.input || {}
  };


  // Send the input to the conversation service
  conversation.message(payload, function(err, data) {
    if (err) {
      return res.status(err.code || 500).json(err);
    }
    return res.json(updateMessage(payload, data));
  });
});

/**
 * Updates the response text using the intent confidence
 * @param  {Object} input The request to the Conversation service
 * @param  {Object} response The response from the Conversation service
 * @return {Object}          The response with the updated message
 */
function updateMessage(input, response) {
  var responseText = null;
  if (!response.output) {
    response.output = {};
  } else {
    return response;
  }
  if (response.intents && response.intents[0]) {
    var intent = response.intents[0];
    // Depending on the confidence of the response the app can return different messages.
    // The confidence will vary depending on how well the system is trained. The service will always try to assign
    // a class/intent to the input. If the confidence is low, then it suggests the service is unsure of the
    // user's intent . In these cases it is usually best to return a disambiguation message
    // ('I did not understand your intent, please rephrase your question', etc..)
    if (intent.confidence >= 0.75) {
      responseText = 'I understood your intent was ' + intent.intent;
    } else if (intent.confidence >= 0.5) {
      responseText = 'I think your intent was ' + intent.intent;
    } else {
      responseText = 'I did not understand your intent';
    }
  }
  response.output.text = responseText;
  return response;
}

module.exports = app;


