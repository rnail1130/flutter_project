import 'package:flutter/material.dart';
import 'package:barcode_flutter/barcode_flutter.dart';
import 'dart:math' as math;
import 'CodeBloc.dart';
import 'Inherited.dart';

class LargePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CodeBloc _counterBloc = CounterProvider.of(context).bloc;
    return GestureDetector(
      onTap: (){
        Navigator.pop(context);
      },
      child: StreamBuilder(
        initialData: '212132132',
        stream: _counterBloc.count,
        builder: (context, snapshot){
          return Scaffold(
              body: Transform.rotate(
                  angle: math.pi/2,
                  child: Center(
                    child: BarCodeImage(
                      data: '${snapshot.data}',   // Code string. (required)
                      codeType: BarCodeType.Code128,  // Code type (required)
                      lineWidth: 1.6,                // width for a single black/white bar (default: 2.0)
                      barHeight: 120.0,               // height for the entire widget (default: 100.0)
                      hasText: true,                 // Render with text label or not (default: false)
                      onError: (error) {             // Error handler
                        print('error = $error');
                      },
                    ),
                  )
              )
          );
        }
      )
    );
  }
}
