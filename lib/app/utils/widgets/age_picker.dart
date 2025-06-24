import 'dart:math';

import 'package:flutter/material.dart';

class ItemWidget extends StatefulWidget {
  final Map curItem;
  final Color backgroundColor;
  final String suffix;
  final double? barSize;

  const ItemWidget(
    this.curItem,
    this.backgroundColor,
    this.suffix, {
    super.key,
    this.barSize,
  });

  @override
  ItemWidgetState createState() => ItemWidgetState();
}

class ItemWidgetState extends State<ItemWidget> {
  late List<String> textParts;
  late String leftText, rightText;

  @override
  void initState() {
    super.initState();
    int decimalCount = 1;
    num fac = pow(10, decimalCount);

    var mtext = ((widget.curItem["value"] * fac).round() / fac).toString();
    textParts = mtext.split(".");
    leftText = textParts.first;
    rightText = textParts.last;
  }

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
        decoration: BoxDecoration(
          color: widget.backgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: RotatedBox(
          quarterTurns: 1,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 4,
                height: widget.barSize,
                color: widget.curItem["color"],
              ),
              const SizedBox(height: 5),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: leftText,
                      style: TextStyle(
                        fontSize: widget.curItem["fontSize"],
                        color: widget.curItem["color"],
                        fontWeight:
                            rightText == "0"
                                ? FontWeight.w800
                                : FontWeight.w400,
                      ),
                    ),
                    TextSpan(
                      text: rightText == "0" ? "" : ".",
                      style: TextStyle(
                        fontSize: widget.curItem["fontSize"] - 3,
                        color: widget.curItem["color"],
                      ),
                    ),
                    TextSpan(
                      text: rightText == "0" ? "" : rightText,
                      style: TextStyle(
                        fontSize: widget.curItem["fontSize"] - 3,
                        color: widget.curItem["color"],
                      ),
                    ),
                    TextSpan(
                      text: widget.suffix.isEmpty ? "" : widget.suffix,
                      style: TextStyle(
                        fontSize: widget.curItem["fontSize"],
                        color: widget.curItem["color"],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AgePicker extends StatefulWidget {
  final double minValue, maxValue;
  final int divisions;
  final double height;
  final Function(double) onChanged;
  final Color backgroundColor;
  final bool showCursor;
  final Color cursorColor;
  final Color activeItemTextColor;
  final Color passiveItemsTextColor;
  final String suffix;
  final double? textSize;
  final double? barHeight;
  final int initialValue;

  const AgePicker({
    super.key,
    required this.minValue,
    required this.maxValue,
    required this.divisions,
    required this.height,
    required this.onChanged,
    this.backgroundColor = Colors.white,
    this.showCursor = true,
    this.cursorColor = Colors.red,
    this.activeItemTextColor = Colors.blue,
    this.passiveItemsTextColor = Colors.grey,
    this.suffix = "",
    this.barHeight,
    this.textSize,
    required this.initialValue,
  }) : assert(minValue < maxValue);

  @override
  AgePickerState createState() => AgePickerState();
}

class AgePickerState extends State<AgePicker> {
  late ScrollController _scrollController;
  List<Map> valueMap = [];
  @override
  void initState() {
    super.initState();
    double step = (widget.maxValue - widget.minValue) / widget.divisions;

    for (var i = 0; i <= widget.divisions; i++) {
      double currentValue = widget.minValue + step * i;

      valueMap.add({
        "value": currentValue,
        "fontSize": widget.textSize != null ? widget.textSize! - 1 : 14.0,
        "color": widget.passiveItemsTextColor,
        "hasBorders": false,
      });
    }

    setScrollController();
  }

  void setScrollController() {
    double step = (widget.maxValue - widget.minValue) / widget.divisions;
    int index = ((widget.initialValue - widget.minValue) / step).round();
    index = index.clamp(0, widget.divisions);
    valueMap[index]["color"] = widget.activeItemTextColor;
    valueMap[index]["fontSize"] = widget.textSize ?? 15.0;
    valueMap[index]["hasBorders"] = true;
    _scrollController = FixedExtentScrollController(initialItem: index);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      height: widget.height,
      alignment: Alignment.center,
      color: widget.backgroundColor,
      child: RotatedBox(
        quarterTurns: 3,
        child: ListWheelScrollView(
          controller: _scrollController,
          itemExtent: 60,
          physics: FixedExtentScrollPhysics(),
          onSelectedItemChanged: (item) {
            int decimalCount = 1;
            num fac = pow(10, decimalCount);
            valueMap[item]["value"] =
                (valueMap[item]["value"] * fac).round() / fac;
            widget.onChanged(valueMap[item]["value"]);
            for (var i = 0; i < valueMap.length; i++) {
              if (i == item) {
                valueMap[item]["color"] = widget.activeItemTextColor;
                valueMap[item]["fontSize"] = widget.textSize ?? 15.0;
                valueMap[item]["hasBorders"] = true;
              } else {
                valueMap[i]["color"] = widget.passiveItemsTextColor;
                valueMap[i]["fontSize"] =
                    widget.textSize != null ? widget.textSize! - 1 : 14.0;
                valueMap[i]["hasBorders"] = false;
              }
            }
            setState(() {});
          },
          children:
              valueMap.map((Map curValue) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: ItemWidget(
                    curValue,
                    widget.backgroundColor,
                    widget.suffix,
                    barSize: widget.barHeight,
                  ),
                );
              }).toList(),
        ),
      ),
    );
  }
}
