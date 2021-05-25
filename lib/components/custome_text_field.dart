import 'package:flutter/material.dart';

import 'package:flutter/material.dart';


Widget defaultFormField({
  @required TextEditingController controller,
  @required TextInputType textInputType,
  Function onSubmited,
  Function onChanged,
  @required Function validate,
  Function onTab,
  @required String label,
  @required IconData prefixIcon,
  bool isEnabled=true
})=> TextFormField(
  controller: controller,
  keyboardType: textInputType,
  onFieldSubmitted: onSubmited,
  onChanged: onChanged,
  validator:validate ,
  onTap: onTab,
  enabled: isEnabled,
  decoration: InputDecoration(
      labelText: label,
      prefixIcon: Icon(prefixIcon),
      border: OutlineInputBorder()
  ),

);