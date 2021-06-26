library motion_toast;

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:motion_toast/resources/arrays.dart';
import 'package:motion_toast/resources/colors.dart';
import 'package:motion_toast/resources/heart_beat_icon.dart';

const double MOTION_TOAST_HEIGHT = 130;
const double MOTION_TOAST_SIDE_BAR_WIDTH = 15;

///Render the motion toast widget
// ignore: must_be_immutable
class MotionToast extends StatefulWidget {
  @override
  _MotionToastState createState() => _MotionToastState();

  ///Used to create a custom motion toast with given [icon], [description] and  [color]
  ///
  MotionToast(
      {required this.icon,
      required this.description,
      required this.color,
      this.title = "",
      this.descriptionStyle = const TextStyle(color: Colors.black),
      this.titleStyle = const TextStyle(color: Colors.black),
      this.iconType,
      this.width = 250,
      this.iconSize = 40,
      this.enableAnimation = true}) {
    this.motionToastType = MOTION_TOAST_TYPE.CUSTOM;
  }

  ///Render a success motion toast
  ///[color] is set to [SUCCESS_COLOR]
  ///[icon] is set to `MOTION_TOAST_ICONS_MD[MOTION_TOAST_TYPE.SUCCESS]`
  ///or `MOTION_TOAST_ICONS_CUPERTINO[MOTION_TOAST_TYPE.SUCCESS]`
  ///[description] is required 
  ///
  ///the text style by default: `TextStyle(color: Colors.black)`
  ///
  MotionToast.success(
      {required this.description,
      this.title = "",
      this.descriptionStyle = const TextStyle(color: Colors.black),
      this.titleStyle = const TextStyle(color: Colors.black),
      this.iconType = ICON_TYPE.MATERIAL_DESIGN,
      this.width = 250,
      this.iconSize = 40,
      this.enableAnimation = true}) {
    this.motionToastType = MOTION_TOAST_TYPE.SUCCESS;
    _initializeParameters();
  }


  ///Render a warning motion toast
  ///[color] is set to [WARNING_COLOR]
  ///[icon] is set to `MOTION_TOAST_ICONS_MD[MOTION_TOAST_TYPE.WARNING]`
  ///or `MOTION_TOAST_ICONS_CUPERTINO[MOTION_TOAST_TYPE.WARNING]`
  ///[description] is required 
  ///
  ///the text style by default: `TextStyle(color: Colors.black)`
  ///
  MotionToast.warning(
      {required this.description,
      this.title = "",
      this.descriptionStyle = const TextStyle(color: Colors.black),
      this.titleStyle = const TextStyle(color: Colors.black),
      this.iconType = ICON_TYPE.MATERIAL_DESIGN,
      this.width = 250,
      this.iconSize = 40,
      this.enableAnimation = true}) {
    this.motionToastType = MOTION_TOAST_TYPE.WARNING;
    _initializeParameters();
  }


  ///Render an error motion toast
  ///[color] is set to [ERROR_COLOR]
  ///[icon] is set to `MOTION_TOAST_ICONS_MD[MOTION_TOAST_TYPE.ERROR]`
  ///or `MOTION_TOAST_ICONS_CUPERTINO[MOTION_TOAST_TYPE.ERROR]`
  ///[description] is required 
  ///
  ///the text style by default: `TextStyle(color: Colors.black)`
  ///
  MotionToast.error(
      {required this.description,
      this.title = "",
      this.descriptionStyle = const TextStyle(color: Colors.black),
      this.titleStyle = const TextStyle(color: Colors.black),
      this.iconType = ICON_TYPE.MATERIAL_DESIGN,
      this.width = 250,
      this.iconSize = 40,
      this.enableAnimation = true}) {
    this.motionToastType = MOTION_TOAST_TYPE.ERROR;
    _initializeParameters();
  }


  ///Render Info motion toast
  ///[color] is set to [INFO_COLOR]
  ///[icon] is set to `MOTION_TOAST_ICONS_MD[MOTION_TOAST_TYPE.INFO]`
  ///or `MOTION_TOAST_ICONS_CUPERTINO[MOTION_TOAST_TYPE.INFO]`
  ///[description] is required 
  ///
  ///the text style by default: `TextStyle(color: Colors.black)`
  ///
  MotionToast.info(
      {required this.description,
      this.title = "",
      this.descriptionStyle = const TextStyle(color: Colors.black),
      this.titleStyle = const TextStyle(color: Colors.black),
      this.iconType = ICON_TYPE.MATERIAL_DESIGN,
      this.width = 250,
      this.iconSize = 40,
      this.enableAnimation = true}) {
    this.motionToastType = MOTION_TOAST_TYPE.INFO;
    _initializeParameters();
  }


  ///Render delete motion toast
  ///[color] is set to [DELETE_COLOR]
  ///[icon] is set to `MOTION_TOAST_ICONS_MD[MOTION_TOAST_TYPE.DELETE]`
  ///or `MOTION_TOAST_ICONS_CUPERTINO[MOTION_TOAST_TYPE.DELETE]`
  ///[description] is required 
  ///
  ///the text style by default: `TextStyle(color: Colors.black)`
  ///
  MotionToast.delete(
      {required this.description,
      this.title = "",
      this.descriptionStyle = const TextStyle(color: Colors.black),
      this.titleStyle = const TextStyle(color: Colors.black),
      this.iconType = ICON_TYPE.MATERIAL_DESIGN,
      this.width = 250,
      this.iconSize = 40,
      this.enableAnimation = true}) {
    this.motionToastType = MOTION_TOAST_TYPE.DELETE;
    _initializeParameters();
  }


  ///initialize [icon] and [color] based on the selected [motionToastType]
  ///
  void _initializeParameters() {
    if (this.iconType == ICON_TYPE.CUPERTINO) {
      this.icon = MOTION_TOAST_ICONS_CUPERTINO[motionToastType]!;
    } else {
      this.icon = MOTION_TOAST_ICONS_MD[motionToastType]!;
    }
    this.color = MOTION_TOAST_COLORS[motionToastType] ?? SUCCESS_COLOR;
  }

  ///String used as a description text
  ///
  final String description;

  ///The title of the motion toast
  ///if it's empty text it will not be rendered in the widget
  ///
  final String title;

  ///The text style that will be applied on the description text
  ///
  final TextStyle descriptionStyle;

  ///The text style that will be applied on the title text
  ///
  final TextStyle titleStyle;

  ///The motion toast type possible values:
  ///```dart
  ///{
  /// SUCCESS
  /// ERROR
  /// WARNING
  /// INFO
  /// DELETE
  /// CUSTOM
  ///}
  ///```
  late MOTION_TOAST_TYPE motionToastType;

  ///The motion toast icon, for types other than custom
  ///the icon will get the default type icon
  ///
  ///if [motionToastType] set to [MOTION_TOAST_TYPE.CUSTOM] the icon parameter is required
  late IconData icon;

  ///The motion toast background color
  ///if `motionToastType == MOTION_TOAST_TYPE.CUSTOM` color parameter is required
  ///else the color will get the default type color from [MOTION_TOAST_COLORS]
  ///
  late Color color;

  ///The design type icon (Material design or Cupertino)
  ///if [motionToastType] set to [MOTION_TOAST_TYPE.CUSTOM] [iconType] will not be used
  ///possible values
  ///```dart
  ///{
  ///MATERIAL_DESIGN,
  ///CUPERTINO
  ///}
  ///```
  final ICON_TYPE? iconType;

  ///The motion toast width by default it's set to 250
  ///
  final double width;

  ///the motion toast icon size
  ///by default it's 40
  final double iconSize;

  ///disable or enable the heartbeat animation on the icon
  ///by default the animation is enabled
  ///
  final bool enableAnimation;


  ///Display the created motion toast
  ///[context]: the actual context of the application
  ///
  show(BuildContext context) {
    showBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return this;
        });
  }
}

class _MotionToastState extends State<MotionToast> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      try {
        Navigator.pop(context);
      } catch (e) {
        print(e.toString());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MOTION_TOAST_HEIGHT,
      color: Colors.transparent,
      child: Center(
        child: Container(
          width: this.widget.width,
          height: MOTION_TOAST_HEIGHT * 0.7,
          decoration: BoxDecoration(
              color: this.widget.color.withOpacity(0.3),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: MOTION_TOAST_HEIGHT * 0.7,
                width: MOTION_TOAST_SIDE_BAR_WIDTH,
                decoration: BoxDecoration(
                    color: this.widget.color,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
              ),
              SizedBox(
                width: 20,
              ),
              Container(
                width: this.widget.iconSize,
                child: this.widget.enableAnimation
                    ? HeartBeatIcon(
                        icon: this.widget.icon,
                        color: this.widget.color,
                        size: this.widget.iconSize)
                    : Icon(
                        this.widget.icon,
                        color: this.widget.color,
                        size: this.widget.iconSize,
                      ),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  this.widget.title.isNotEmpty
                      ? Text(this.widget.title, style: this.widget.titleStyle)
                      : Container(),
                  Text(
                    this.widget.description,
                    style: this.widget.descriptionStyle,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}