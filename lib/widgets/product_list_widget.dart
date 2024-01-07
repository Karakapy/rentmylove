import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:rentmylove/text_style.dart';
import 'package:rentmylove/widgets/text_field.dart';

class ProductListWidget extends StatefulWidget {
  final double width;
  final bool edit;

  const ProductListWidget({required this.width, required this.edit});

  @override
  State<ProductListWidget> createState() => _ProductListWidgetState();
}

class _ProductListWidgetState extends State<ProductListWidget> {
  String? selectedSize;
  String? selectedColor;
  int? amount;

  final List<String> sizeList = [
    'XS','S','M','L','XL','XXL'
  ];
  final List<String> colorList = [
    'ขาว',
    'ดำ',
    'ชมพู',
    'ชมพูอ่อน',
    'โอลด์โรส',
    'เหลือง',
    'เหลืองอ่อน',
    'แดง',
    'ฟ้าคราม',
    'น้ำเงิน',
    'เบจ',
    'น้ำตาล',
    'ครีม',

  ];

  @override
  void initState() {
    super.initState();
    if (widget.edit) {
      selectedColor = colorList.first;
      selectedSize = sizeList.first;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: widget.width,
      margin: EdgeInsets.only(bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                    const Text("ไซซ์", style: RmlTextStyle.normalText,),
                Container(
                  width: widget.width * 0.7,
                  child:DropdownButtonFormField2(
                    isExpanded: true,
                    value: selectedSize,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.only(left: 5, right: 10),
                      border: OutlineInputBorder( borderRadius:BorderRadius.circular(12)),
                    ),
                    dropdownStyleData: const DropdownStyleData(
                        maxHeight: 200
                    ),
                    items: sizeList.map((String size) => DropdownMenuItem<String>(
                      value: size,
                      child: Text(
                        size,
                        style: RmlTextStyle.normalText,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        selectedSize = value;
                      });
                    },
                  ),
              ),
                ]
              ),
                const SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                      const Text("สี", style: RmlTextStyle.normalText),
                      Container(
                        width: widget.width * 0.7,
                        child:DropdownButtonFormField2(
                          isExpanded: true,
                          value: selectedColor,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: EdgeInsets.only(left: 5, right: 10),
                              border: OutlineInputBorder( borderRadius:BorderRadius.circular(12)),
                          ),
                          dropdownStyleData: const DropdownStyleData(
                              maxHeight: 200
                          ),
                          items: colorList.map((String size) => DropdownMenuItem<String>(
                            value: size,
                            child: Text(
                              size,
                              style: RmlTextStyle.normalText,
                              overflow: TextOverflow.ellipsis,
                            ),
                            // overflow: TextOverflow.ellipsis,
                          ),).toList(),
                          onChanged: (String? value) {
                            setState(() {
                              selectedColor = value;
                            });
                          },
                        ),
                      )
              ],
            ),
            const SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("จำนวน",style: RmlTextStyle.normalText,),
                    widget.edit?TextFieldWidget(width: widget.width * 0.7, inputType: TextInputType.number,initialText: "2",):
                    TextFieldWidget(width: widget.width * 0.7, inputType: TextInputType.number,),

                  ],
            )

          ],
        )
    );
  }
}
