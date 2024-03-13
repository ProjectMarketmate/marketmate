import 'package:flutter/material.dart';
import 'package:marketmate/app/utils/color_extension.dart';

class ItemCounterWidget extends StatefulWidget {
  final Function(int)? onAmountChanged;
  final int initialAmount;


  const ItemCounterWidget({
    
    Key? key,
    this.onAmountChanged,  this.initialAmount = 1,
  }) : super(key: key);

  @override
  _ItemCounterWidgetState createState() => _ItemCounterWidgetState();
}

class _ItemCounterWidgetState extends State<ItemCounterWidget> {
  int amount = 1;

  @override
  void initState() {
    super.initState();
    amount = widget.initialAmount;
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        iconWidget(Icons.remove,
            iconColor: Tcolor.darkGrey, onPressed: DecrementAmount),
        SizedBox(width: 18),
        Container(
            width: 30,
            child: Center(
                child: getText(
                    text: amount.toString(), fontSize: 18, isBold: true))),
        SizedBox(width: 18),
        iconWidget(Icons.add,
            iconColor: Tcolor.primary, onPressed: incrementAmount)
      ],
    );
  }

  void incrementAmount() {
    setState(() {
      amount = amount + 1;
      updateParent();
    });
  }

  void DecrementAmount() {
    setState(() {
      amount = amount - 1;
      updateParent();
    });
  }

  // void decrementAmount() {
  //   if (amount <= 1){

  //     if (widget.cartItem == null) {
  //       return;

  //     }
  //     cartItems.value.removeWhere((element) => element.key == widget.cartItem?.key);
  //     cartItems.notifyListeners();
  //     return;
  //   }
  //   setState(() {
  //     amount = amount - 1;
  //     updateParent();
  //   });
  // }

  void updateParent() {
    if (widget.onAmountChanged != null) {
      widget.onAmountChanged!(amount);
    }
  }

  Widget iconWidget(IconData iconData, {Color? iconColor, onPressed}) {
    return GestureDetector(
      onTap: () {
        if (onPressed != null) {
          onPressed();
        }
      },
      child: Container(
        height: 45,
        width: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(17),
          border: Border.all(
            color: Color(0xffE2E2E2),
          ),
        ),
        child: Center(
          child: Icon(
            iconData,
            color: iconColor ?? Colors.black,
            size: 25,
          ),
        ),
      ),
    );
  }

  Widget getText({
    required String text,
    required double fontSize,
    bool isBold = false,
    color = Colors.black,
  }) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
        color: color,
      ),
    );
  }
}
