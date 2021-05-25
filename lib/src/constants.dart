import 'package:flutter/material.dart';

void navigateTo({context, screen})
{
  Navigator.push(context, MaterialPageRoute(builder: (context)=>screen));
}