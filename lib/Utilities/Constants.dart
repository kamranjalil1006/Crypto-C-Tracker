import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const kTextFieldDecoration = InputDecoration(
    filled: true,
    fillColor: Colors.white,
    border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        borderSide: BorderSide.none),
    hintText: 'Enter Currency Name',
    hintStyle: TextStyle(color: Colors.grey));

const kPriceTextStyle =
    TextStyle(fontSize: 60, fontWeight: FontWeight.w900, color: Colors.white);
