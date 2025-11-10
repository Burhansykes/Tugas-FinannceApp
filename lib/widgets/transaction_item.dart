import 'package:flutter/material.dart';
import '../models/transaction.dart';

class TransactionItem extends StatelessWidget {
  final TransactionModel transaction;

  const TransactionItem({super.key, required this.transaction});

  IconData _getCategoryIcon(String iconName) {
    switch (iconName) {
      case 'fastfood':
        return Icons.fastfood;
      case 'travel_explore':
        return Icons.travel_explore;
      case 'health_and_safety':
        return Icons.health_and_safety;
      case 'event':
        return Icons.event;
      case 'payments':
        return Icons.payments;
      default:
        return Icons.receipt_long;
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorAccent = transaction.isExpense
        ? const Color(0xFFB3263E) // merah elegan (burgundy)
        : const Color(0xFF86B38C); // hijau lembut untuk income

    return Card(
      color: const Color(0xFF1E1A22),
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 10,
        ),
        leading: CircleAvatar(
          radius: 25,
          backgroundColor: colorAccent.withOpacity(0.15),
          child: Icon(
            _getCategoryIcon(transaction.icon),
            color: colorAccent,
            size: 26,
          ),
        ),
        title: Text(
          transaction.title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: Colors.white,
          ),
        ),
        subtitle: Text(
          transaction.formattedDate,
          style: TextStyle(color: Colors.grey.shade400, fontSize: 13),
        ),
        trailing: Text(
          transaction.formattedAmount,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: colorAccent,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
