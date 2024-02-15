import 'package:flutter/material.dart';

class CustomRadioButton extends StatefulWidget {
  final List<String> options;
  final Function(String) onChanged;

  const CustomRadioButton({
    required this.options,
    required this.onChanged,
  });

  @override
  _CustomRadioButtonState createState() => _CustomRadioButtonState();
}

class _CustomRadioButtonState extends State<CustomRadioButton> {
  late String _selectedOption;

  @override
  void initState() {
    super.initState();
    // Initialize selected option to the first option
    _selectedOption = widget.options.first;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: widget.options.map((option) {
        return GestureDetector(
          onTap: () {
            setState(() {
              _selectedOption = option;
            });
            widget.onChanged(option);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              children: [
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: _selectedOption == option
                          ? Theme.of(context).focusColor
                          : Colors.grey,
                    ),
                    color: _selectedOption == option
                        ? Theme.of(context).focusColor
                        : Colors.transparent,
                  ),
                ),
                SizedBox(width: 8),
                Text(
                  option,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
