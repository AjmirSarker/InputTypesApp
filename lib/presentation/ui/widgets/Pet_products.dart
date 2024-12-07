import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wempro/presentation/state_holders/Store_info.dart';


class PetProducts extends StatefulWidget {
  final String? type ;
final String? title ;
final List<String>? options;
  const PetProducts({super.key, this.type, this.title, this.options});

  @override
  State<PetProducts> createState() => _PetProductsState();
}

class _PetProductsState extends State<PetProducts> {
final StoreInfoController storeInfoController = Get.find<StoreInfoController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<StoreInfoController>(
      builder: (storeInfoController) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.title ?? '', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Row(children: [
            Icon(storeInfoController.PPradio.length >= 2 ? Icons.check_circle : Icons.error_outline, 
                 color: storeInfoController.PPradio.length >= 2 ? Colors.green : Colors.orange, size: 10,),
            SizedBox(width: 5),
            Text(
              'Required', 
              style: TextStyle(
                color: storeInfoController.PPradio.length >= 2 ? Colors.green : Colors.orange, 
                fontSize: 10
              )
            ),
            Text(
              ' , Select 1', 
              style: TextStyle(
                color: Colors.black, 
                fontSize: 10
              )
            ),
          ])
          ,
          
              ...?widget.options?.map((option) {
                return RadioListTile<String>(

                  title: Text(option),
                  value:  option,
                  groupValue: storeInfoController.PPradio,
                  onChanged: (value) {
                  
                     storeInfoController.setPPradio(value.toString());
                      // Clear the error when an option is selected
                    
                  },
                  contentPadding: EdgeInsets.all(0),  // Reduce padding around the RadioListTile
  dense: true,  
  visualDensity: VisualDensity.compact, 
                );
              })
            
             
            ],
          ),
        );
      },
    );
  }
}