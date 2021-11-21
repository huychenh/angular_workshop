/// <reference path="dateformatjs.js" />

/**
 * DefaultFormatDateTime:  Ex: 2020-04-30 07:16 AM
 */
 var defaultFormatDateTime = "yyyy-mm-dd HH:MM:ss TT";

 /** 
  *  The return object strcuture
  */
 var returnObject = {
   id: -1,
   notificationCode: "",
   infoMessage: "",
   errorMessage: "",
   detailErrorMessage: ""
 };
 
 /**
  * Mapping response
  * @param {any} response
  */
 var mappingResponse = function (response) {
   if (response != null && response.data != null && response.data != undefined) {
     return returnObject = {
       id: response.data.id,
       notificationCode: response.data.notificationCode,
       infoMessage: response.data.infoMessage,
       errorMessage: response.data.errorMessage,
       detailErrorMessage: response.data.detailErrorMessage
     };
   }
   return null;
 };
 
 /**
  * Mapping datetime for objects.
  * @param {any} arrJSON
  */
 var mappingDateTimeForObject = function (arrJSON) {
   for (var i = 0; i < arrJSON.length; i++) {
     arrJSON[i].createdDate = convertJsonToDateTime(arrJSON[i].createdDate, defaultFormatDateTime);
     arrJSON[i].modifiedDate = convertJsonToDateTime(arrJSON[i].modifiedDate, defaultFormatDateTime);
      
     arrJSON[i].timeStart = convertJsonToDateTime(arrJSON[i].timeStart, defaultFormatDateTime);
     arrJSON[i].timeEnd = convertJsonToDateTime(arrJSON[i].timeEnd, defaultFormatDateTime);
   }
   return arrJSON;
 };
 
 /**
  * @param {any} strValue: string JSON
  * Output: a Datetime object.
  */
 var convertJsonToDateTime = function (jsonString, dateFormat) {
   var date = new Date(jsonString);
   date = date.format(dateFormat);
   return date;
 }
 
 /**
  * 
  * @param {any} strValue
  * Output: a JSON string.
  */
 var convertDateTimeToJson = function (datetime) {
   return JSON.stringify(datetime);
 }
 
 /**
  * 
  * @param {any} str
  * Output: a string.
  */
 var generateProductCode = function () {  
   return "PR" + convertJsonToDateTime(new Date(), "yyyymmddHHMMss");
 }
 