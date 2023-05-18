<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

# RMS Terminal SDK

## Getting started

RMS Terminal Dark TCP Hex Connection Intergration
* Encode
* Decode
## How to Use 

** Step 1 **

Download or clone this repo by using the link below:

```
https://github.com/ghaowei08/RMS-terminal-sdk.git
```

** Step 2 **

Go to "example" folder and execute the following command

```
flutter pub get 
```
## Additional information
### Example
Example in "example" folder 
### Test Case
Test Case in "test" folder
### Folder Structure
|-- CHANGELOG.md 
|-- LICENSE
|-- README.md
|-- example
|   |-- README.md 
|   |-- lib
|   |   |-- main.dart 
|   |   '-- pages
|   |       '-- homepage.dart
|-- lib
|   |-- rms_terminal_sdk.dart 
|   '-- src
|       |-- config.dart
|       |-- decode.dart
|       |-- encode.dart
|       |-- field_data
|       |   |-- custom_data
|       |   |   |-- custom_data.dart 
|       |   |   |-- custom_data_config.dart
|       |   |   |-- custom_data_decode.dart
|       |   |   '-- custom_data_encode.dart 
|       |   |-- field_data.dart 
|       |   |-- field_data_config.dart
|       |   |-- field_data_decode.dart
|       |   |-- field_data_encode.dart 
|       |   '-- payment_type.dart
|       |-- presentation_header
|       |   |-- presentation_header.dart 
|       |   |-- presentation_header_config.dart
|       |   |-- presentation_header_decode.dart 
|       |   '-- presentation_header_encode.dart 
|       '-- transport_header
|           |-- transport_header.dart 
|           |-- transport_header_config.dart 
|           |-- transport_header_decode.dart 
|           '-- transport_header_encode.dart 
|-- pubspec.yaml
'-- test
    |-- cases.dart
    '-- decode_test.dart