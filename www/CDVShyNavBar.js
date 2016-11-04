
/*
*
* Licensed to the Apache Software Foundation (ASF) under one
* or more contributor license agreements.  See the NOTICE file
* distributed with this work for additional information
* regarding copyright ownership.  The ASF licenses this file
* to you under the Apache License, Version 2.0 (the
* "License"); you may not use this file except in compliance
* with the License.  You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing,
* software distributed under the License is distributed on an
* "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
* KIND, either express or implied.  See the License for the
* specific language governing permissions and limitations
* under the License.
*
*/

var exec = require('cordova/exec');
var platform = require('cordova/platform');

/**
 * Provides access to notifications on the device.
 */
module.exports = {

  setTitle: function(title) {
    exec(null, null, "CDVShyNavBar", "setTitle", [title]);
  },

  setupLeftButton: function(title, image, thefunction) {
    this.leftButtonCallback = thefunction;
    exec(null, null, "CDVShyNavBar", "setupLeftButton", [title, image, thefunction]);
  },

  setupRightButton: function(title, image, thefunction) {
    this.rightButtonCallback = thefunction;
    exec(null, null, "CDVShyNavBar", "setupRightButton", [title, image, thefunction]);
  },

  setLeftButtonEnabled: function(enabled) {
    exec(null, null, "CDVShyNavBar", "setLeftButtonEnabled", [enabled]);
  },

  setRightButtonEnabled: function(enabled) {
    exec(null, null, "CDVShyNavBar", "setRightButtonEnabled", [enabled]);
  },

  leftButtonTapped: function() {
    if(typeof(this.leftButtonCallback) === "function")
      this.leftButtonCallback()
  },

  rightButtonTapped: function() {
    if(typeof(this.rightButtonCallback) === "function")
      this.rightButtonCallback()
  },
}
