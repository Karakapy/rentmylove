import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:rentmylove/text_style.dart';
import 'package:rentmylove/widgets/text_field.dart';

class ProductListWidget extends StatefulWidget {
  final double width;

  const ProductListWidget({required this.width});

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
                    DropdownButtonHideUnderline(
                        child: DropdownButton2(
                          buttonStyleData: ButtonStyleData(
                            width: widget.width * 0.7,
                            height: 50,
                            padding: EdgeInsets.only(left: 10, right: 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: Colors.black26,
                              ),
                            ),
                          ),
                          dropdownStyleData: const DropdownStyleData(
                              maxHeight: 200,
                              width: 200,
                          ),
                          items: sizeList.map((String size) => DropdownMenuItem<String>(
                            value: size,
                            child: Text( size,
                                style: RmlTextStyle.normalText
                            ),
                            // overflow: TextOverflow.ellipsis,
                          ),).toList(),
                          onChanged: (String? value) {
                            setState(() {
                              selectedSize = value;
                              // selectedColor = null;
                            });
                            print(selectedSize);
                          },
                          value: selectedSize,
                        )
                    ),
                  ],
              ),
                const SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                      const Text("สี", style: RmlTextStyle.normalText),
                      DropdownButtonHideUnderline(
                        child: DropdownButton2(
                          isExpanded: true,
                          value: selectedColor,
                          buttonStyleData: ButtonStyleData(
                            width: widget.width * 0.7,
                            height: 50,
                            padding: EdgeInsets.only(left: 10, right: 10),
                            decoration: BoxDecoration(
                              // isDense: true,
                              color: Colors.white,
                              // contentPadding: EdgeInsets.zero,
                              // border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: Colors.black26,
                              ),
                            ),
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
                      ),
              ],
            ),
            const SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("จำนวน",style: RmlTextStyle.normalText,),
                    Container(
                      width: widget.width * 0.7,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                        ),
                      ),
                    )
                ],
            )

          ],
        )
    );
  }
}
