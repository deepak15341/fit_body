import 'package:fitbody/app/utils/color_constants.dart';
import 'package:fitbody/app/utils/widgets/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum Validator {
  phone,
  email,
  password,
  notEmpty,
  otp,
  plzSelectOne,
  cgpa,
  multiplier,
  percentage,
  duolingoDefinite,
}

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.controller,
    required this.title,
    this.hint,
    this.enabled = true,
    this.validator,
    this.obscureText = false,
    this.icon,
    this.maxLines = 1,
    this.suffixIcon,
    this.keyboardType,
    this.inputAction,
    this.boxColor,
    this.isDense = true,
    this.readOnly = false,
    this.showTitle = true,
    this.inputFormatters,
    this.onChanged,
    this.onFieldSubmitted,
    this.textCapitalization = TextCapitalization.none,
    this.borderRadius = 0.0,
    this.mandatory = false,
    this.focusNode,
    this.borderColor,
    this.autoFocus = false,
    this.titleFontWeight,
    this.titleFontSize,
    this.addPadding = false,
    this.textColor,
  });

  final TextEditingController controller;
  final double borderRadius;
  final String title;
  final String? hint;
  final bool enabled;
  final Validator? validator;
  final Color? boxColor;
  final bool obscureText;
  final int maxLines;
  final Widget? icon;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final TextInputAction? inputAction;
  final bool isDense;
  final bool readOnly;
  final bool showTitle;
  final ValueChanged<String>? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final ValueChanged<String>? onFieldSubmitted;
  final TextCapitalization textCapitalization;
  final bool mandatory;
  final FocusNode? focusNode;
  final Color? borderColor;
  final Color? textColor;
  final bool autoFocus, addPadding;
  final FontWeight? titleFontWeight;
  final double? titleFontSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showTitle)
          CustomMandatoryText(
            text: title,
            mandatory: mandatory,
            fontSize: titleFontSize ?? 16,
            fontWeight: titleFontWeight ?? FontWeight.w500,
          ),
        if (showTitle) const SizedBox(height: 8),
        Material(
          elevation: 1.8,
          shadowColor: AppColors.transparent,
          color: AppColors.transparent,
          borderRadius: BorderRadius.circular(borderRadius),
          child: TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            focusNode: focusNode,
            autofocus: autoFocus,
            cursorErrorColor: AppColors.red,
            style: TextWidgets.textStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              fontColor: textColor,
            ),
            cursorColor: AppColors.black,
            controller: controller,
            validator: (value) {
              if (Validator.phone == validator) {
                return getPhoneNumberValidation(value);
              } else if (Validator.email == validator) {
                return getEmailValidation(value);
              } else if (Validator.password == validator) {
                return validatePassword('$value');
              } else if (Validator.notEmpty == validator) {
                return getEmptyValidation(value);
              } else if (Validator.otp == validator) {
                return getOtpValidation(value);
              } else if (Validator.plzSelectOne == validator) {
                return getEmptyDropDownValidation(value);
              } else if (Validator.cgpa == validator) {
                return getCGPAValidation(value);
              } else if (Validator.multiplier == validator) {
                return getMultiplierValidation(value);
              } else if (Validator.percentage == validator) {
                return getPercentageValidation(value);
              } else {
                return null;
              }
            },
            obscureText: obscureText,
            keyboardType: keyboardType,
            maxLines: maxLines,
            textInputAction: inputAction,
            inputFormatters: inputFormatters,
            readOnly: readOnly,
            enabled: enabled,
            decoration: InputDecoration(
              isDense: isDense,
              labelText: hint,
              labelStyle: TextWidgets.textStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                fontColor: textColor,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide: BorderSide(color: borderColor ?? AppColors.black),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide: BorderSide(color: borderColor ?? AppColors.black),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide: BorderSide(color: borderColor ?? AppColors.black),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide: BorderSide(color: AppColors.red),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide: BorderSide(color: AppColors.red),
              ),
              errorStyle: TextWidgets.textStyle(
                fontWeight: FontWeight.w300,
                fontSize: 12,
                fontColor: AppColors.red,
              ),
              contentPadding:
                  addPadding
                      ? const EdgeInsets.symmetric(
                        vertical:
                            16, // Adjust vertical padding to control height
                        horizontal: 15,
                      )
                      : null,
              hintStyle: TextWidgets.textStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                fontColor: textColor,
              ),
              filled: true,
              fillColor: AppColors.white,
              prefixIcon: icon,
              suffixIcon: suffixIcon,
            ),
            onFieldSubmitted: onFieldSubmitted,
            textCapitalization: textCapitalization,
            onChanged:
                onChanged ??
                (value) {
                  controller.text = value.trim();
                },
          ),
        ),
      ],
    );
  }
}

class CustomMandatoryText extends StatelessWidget {
  final bool? textAlignCentre;
  final TextDecoration? textDecoration;
  final bool mandatory;
  final String text;
  final int? maxLines;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? textColor;

  const CustomMandatoryText({
    super.key,
    this.textAlignCentre = false,
    required this.text,
    this.maxLines,
    this.mandatory = false,
    this.fontSize,
    this.textColor,
    this.fontWeight,
    this.textDecoration,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      overflow: TextOverflow.ellipsis,
      textScaler: TextScaler.noScaling,
      textAlign: textAlignCentre == true ? TextAlign.center : TextAlign.left,
      maxLines: maxLines,
      text: TextSpan(
        children: [
          TextSpan(
            text: text,
            style: TextWidgets.textStyle(
              fontColor: textColor ?? AppColors.black,
              fontWeight: fontWeight ?? FontWeight.w400,
              fontSize: fontSize ?? 18,
              textDecoration: textDecoration,
            ),
          ),
          if (mandatory)
            TextSpan(
              text: " *",
              style: TextWidgets.textStyle(
                fontColor: AppColors.red,
                fontWeight: fontWeight ?? FontWeight.w400,
                fontSize: fontSize ?? 18,
                textDecoration: textDecoration,
              ),
            ),
        ],
      ),
    );
  }
}

getEmailValidation(String? value) {
  const pattern =
      r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
      r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
      r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
      r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
      r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
      r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
      r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
  final regex = RegExp(pattern);

  if (value == null || value == "") {
    return "Please enter email address";
  } else {
    return value.isNotEmpty && !regex.hasMatch(value)
        ? 'Enter a valid email address'
        : null;
  }
}

getPhoneNumberValidation(String? value) {
  if (value != null) {
    if (value.length != 10) {
      return 'Mobile Number must be of 10 digit';
    }
    {
      return null;
    }
  } else {
    return "Mobile Number must be of 10 digit";
  }
}

getEmptyValidation(String? value) {
  debugPrint(value);
  if (value == null) {
    return '* Required';
  } else if (value.isEmpty) {
    return '* Required';
  } else {
    return null;
  }
}

getEmptyDropDownValidation(String? value) {
  debugPrint(value);
  if (value == null || value == '') {
    return '* Please Select one Field';
  } else {
    return null;
  }
}

getOtpValidation(String? value) {
  if (value != null) {
    if (value.length != 6) {
      return 'OTP must be of 6 digit';
    } else {
      return null;
    }
  } else {
    return "OTP must be of 6 digit";
  }
}

getCGPAValidation(String? value) {
  if (getNUllChecker(value) == false) {
    if (double.parse(value!) > 11) {
      return 'CGPA in Between 0 to 10';
    } else {
      return null;
    }
  } else {
    return "CGPA in Between 0 to 10";
  }
}

getMultiplierValidation(String? value) {
  if (getNUllChecker(value) == false) {
    if (double.parse(value!) > 11) {
      return 'Multiplier in Between 0 to 10';
    } else {
      return null;
    }
  } else {
    return "Multiplier in Between 0 to 10";
  }
}

validatePassword(String password) {
  // Define the regular expression patterns for different rules
  final RegExp minLength = RegExp(r'.{8,}'); // At least 8 characters
  final RegExp hasUppercase = RegExp(r'[A-Z]'); // At least one uppercase letter
  final RegExp hasLowercase = RegExp(r'[a-z]'); // At least one lowercase letter
  final RegExp hasDigit = RegExp(r'\d'); // At least one number
  final RegExp hasSpecialChar = RegExp(
    r'[!@#$%^&*(),.?":{}|<>]',
  ); // At least one special character

  // Check if the password meets all the criteria
  if (!minLength.hasMatch(password)) {
    return "Password must be at least 8 characters long";
  }
  if (!hasUppercase.hasMatch(password)) {
    return "Password must contain at least one uppercase letter";
  }
  if (!hasLowercase.hasMatch(password)) {
    return "Password must contain at least one lowercase letter";
  }
  if (!hasDigit.hasMatch(password)) {
    return "Password must contain at least one number";
  }
  if (!hasSpecialChar.hasMatch(password)) {
    return "Password must contain at least one special character";
  }

  return null;
  // Password is strong
}

getPercentageValidation(String? value) {
  if (getNUllChecker(value) == false) {
    if (double.parse(value!) > 101) {
      return 'Percentage in Between 0 to 100';
    } else {
      return null;
    }
  } else {
    return "Percentage in Between 0 to 100";
  }
}

bool getNUllChecker(var data) {
  if (data == null) {
    return true;
  } else if (data == "null") {
    return true;
  } else if (data == "") {
    return true;
  } else if (data == "0") {
    return true;
  } else if (data == 0) {
    return true;
  } else if (data == 0.0) {
    return true;
  } else {
    return false;
  }
}
