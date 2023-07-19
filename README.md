A Flutter plugin for iOS, Android and Web for deploy connection with RazerMS Terminal by TCP.

### Getting Started
RMS Terminal Dark TCP Hex Connection Intergration
* Encoder
* Decoder
### Installation
First, add `rms_terminal_sdk` as a [dependency in your pubspec.yaml file](https://docs.flutter.dev/packages-and-plugins/using-packages).

Run `flutter pub get`

### Example
Example available in `./example/main.dart`
```
import 'package:rms_terminal_sdk/rms_terminal_sdk.dart';
class _HomePageState extends State<HomePage> {
  final razer = RMSTerminalSDK();
  TextEditingController ipController = TextEditingController();
  TextEditingController invoiceNoController = TextEditingController();
  FieldDataResponseFormat? fieldData;

  @override
  void initState() {
    super.initState();
    ipController = TextEditingController(text: '192.168.0.52');
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
```
### Test Case
Test Case available in `./test`

### Contributing

Pull requests are welcome. For major changes, please open an issue first
to discuss what you would like to change.

Please make sure to update tests as appropriate.

### License

[MIT](https://choosealicense.com/licenses/mit/)
