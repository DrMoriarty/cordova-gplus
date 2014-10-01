function GPlus() {
  // Does nothing
}
GPlus.prototype.init = function(clientID, successCallback, errorCallback) {
  cordova.exec(successCallback, errorCallback, "GPlus", "initGPlus", [clientID]);
};

GPlus.prototype.share = function(sourceURL, imageURL, title, description, successCallback, errorCallback) {
  cordova.exec(successCallback, errorCallback, "GPlus", "share", [sourceURL, imageURL, title, description]);
};
module.exports = new GPlus();
