// เนื่องจากข้อมูลข้อความ error ที่ validator ต้องการเป็น FormFieldValidator<String>
// เราจึงต้องกำหนดการใช้งาน FormFieldValidator โดยใช้จาก widgets ดึงมาเฉพาะที่ต้องการโดยใช้
// คำว่า show FormFieldValidator
import 'package:flutter/widgets.dart' show FormFieldValidator;

// เนื่องจากเราไม่ได้กำหนด constructor และ property ใดๆ จึงใช้งานเป็น mixin
// เป็นรูปแบบหนึ่งของ class
mixin Validators {
  // กำหนดฟังก์ชั่น สำหรับระบุฟิลด์ที่ต้องกรอก
  static FormFieldValidator<String> required(String errMsg) {
    return (value) {
      if (value == null) {
        return errMsg;
      } else if (value.isEmpty) {
        return errMsg;
      }
    };
  }

  // กำหนดฟังก์ชั่น สำหรับระบุฟิลด์ต้องกรอกตัวเลขต่ำสุดอย่างน้อย
  static FormFieldValidator<String> min(int min, String errMsg) {
    return (value) =>
        (int.parse(value!) >= 0 && int.parse(value) < min) ? errMsg : null;
  }

  // กำหนดฟังก์ชั่น สำหรับระบุฟิลด์ต้องกรอกตัวเลขสูงสุดอย่างน้อย
  static FormFieldValidator<String> max(int max, String errMsg) {
    return (value) =>
        (int.parse(value!) >= 0 && int.parse(value) > max) ? errMsg : null;
  }

  // กำหนดฟังก์ชั่น สำหรับระบุฟิลด์ต้องกรอกตัวอักษรยาวน้อยสุด
  static FormFieldValidator<String> minLength(int minLength, String errMsg) {
    return (value) =>
        (value!.isNotEmpty && value.length < minLength) ? errMsg : null;
  }

  // กำหนดฟังก์ชั่น สำหรับระบุฟิลด์ต้องกรอกตัวอักษรยาวมากสุดไม่เกิน
  static FormFieldValidator<String> maxLength(int maxLength, String errMsg) {
    return (value) =>
        (value!.isNotEmpty && value.length > maxLength) ? errMsg : null;
  }

  // กำหนดฟังก์ชั่น สำหรับระบุฟิลด์ต้องกรอกข้อมูลตามรูปแบบ RegEex
  static FormFieldValidator<String> pattern(RegExp pattern, String errMsg) {
    return (value) =>
        (value!.isNotEmpty && !pattern.hasMatch(value)) ? errMsg : null;
  }

  // กำหนดฟังก์ชั่น สำหรับระบุฟิลด์ต้องกรอกข้อมูลอีเมลที่ถูกต้องตามรูปแบบ
  static FormFieldValidator<String> email(String errMsg) {
    final emailPattern = RegExp(
        r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])');
    return (value) =>
        (value!.isNotEmpty && !emailPattern.hasMatch(value)) ? errMsg : null;
  }

  // กำหนดฟังก์ชั่น สำหรับระบุฟิลด์ต้องใช้งานการตรวจสอบหลายๆ คำสั่งรวมกัน
  static FormFieldValidator<String> compose(
      List<FormFieldValidator<String>> validators) {
    return (value) {
      for (final validator in validators) {
        if (validator(value) != null) return validator(value);
      }
      return null;
    };
  }
}
