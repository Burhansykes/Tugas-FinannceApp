import 'package:flutter/material.dart';
import '../widgets/atm_card.dart';
import '../widgets/transaction_item.dart';
import '../models/transaction.dart';
import '../widgets/grid_menu_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final transactions = [
      TransactionModel(
        id: 't1',
        title: 'Coffee Shop',
        amount: 35000,
        category: 'Food',
        date: DateTime(2025, 11, 8),
        icon: 'fastfood',
      ),
      TransactionModel(
        id: 't2',
        title: 'Grab Ride',
        amount: 25000,
        category: 'Travel',
        date: DateTime(2025, 11, 7),
        icon: 'travel_explore',
      ),
      TransactionModel(
        id: 't3',
        title: 'Gym Membership',
        amount: 150000,
        category: 'Health',
        date: DateTime(2025, 11, 5),
        icon: 'health_and_safety',
      ),
      TransactionModel(
        id: 't4',
        title: 'Movie Ticket',
        amount: 60000,
        category: 'Event',
        date: DateTime(2025, 11, 4),
        icon: 'event',
      ),
      TransactionModel(
        id: 't5',
        title: 'Salary',
        amount: 5000000,
        category: 'Income',
        date: DateTime(2025, 11, 1),
        isExpense: false,
        icon: 'payments',
      ),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF141218),
      appBar: AppBar(
        title: const Text(
          'Finance Mate',
          style: TextStyle(fontWeight: FontWeight.w700, letterSpacing: 0.5),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF1E1A22),
        foregroundColor: const Color(0xFFEAEAEA),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'My Cards',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFFEAEAEA),
              ),
            ),
            const SizedBox(height: 12),

            SizedBox(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  AtmCard(
                    bankName: 'Bank A',
                    cardNumber: '**** 2345',
                    balance: 'Rp12.500.000',
                    color1: Color(0xFF7B1E2F),
                    color2: Color(0xFF141218),
                  ),
                  SizedBox(width: 16),
                  AtmCard(
                    bankName: 'Bank B',
                    cardNumber: '**** 8765',
                    balance: 'Rp5.350.000',
                    color1: Color(0xFFB3263E),
                    color2: Color(0xFF1E1A22),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 28),

            const Text(
              'Categories',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color(0xFFEAEAEA),
              ),
            ),
            const SizedBox(height: 8),

            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                GridMenuItem(icon: Icons.health_and_safety, label: 'Health'),
                GridMenuItem(icon: Icons.travel_explore, label: 'Travel'),
                GridMenuItem(icon: Icons.fastfood, label: 'Food'),
                GridMenuItem(icon: Icons.event, label: 'Event'),
              ],
            ),

            const SizedBox(height: 28),

            const Text(
              'Recent Transactions',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFFEAEAEA),
              ),
            ),
            const SizedBox(height: 8),

            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: transactions.length,
              separatorBuilder: (context, index) => const SizedBox(height: 4),
              itemBuilder: (context, index) {
                return TransactionItem(transaction: transactions[index]);
              },
            ),
          ],
        ),
      ),
    );
  }
}
