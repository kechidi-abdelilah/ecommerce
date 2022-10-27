import 'package:ecommerce/pages/Waiting/controller/waiting_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WaitingPage extends GetWidget<WaitingControoler> {
  @override
  Widget build(BuildContext context) {
    controller;
    return Scaffold(body: Center(
      child: CircularProgressIndicator(),
    ),);
  }}