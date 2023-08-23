  import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void show_snackbar(BuildContext context, String name) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(name),
      ),
    );
  }