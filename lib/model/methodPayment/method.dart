import 'package:flutter/material.dart';
class PaymentMethodCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final bool isSelected;

  const PaymentMethodCard({
    required this.icon,
    required this.label,
    required this.onTap,
    required this.isSelected,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 120,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.transparent,
            width: 2,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 40,
              color: Colors.blue,
            ),
            const SizedBox(height: 5),
            Text(
              label,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.blue : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
