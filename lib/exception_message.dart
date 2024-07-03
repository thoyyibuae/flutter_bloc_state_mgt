import 'dart:async';
import 'dart:io';

String handleExceptionWithMessage(dynamic error) {
  if (error is SocketException) {
    return "It seems you are not connected to the internet.";
  } else if (error is TimeoutException) {
    return "The request timed out. Ensure you have a stable internet connection";
  } else {
    return "An error occurred, please try again";
  }
}