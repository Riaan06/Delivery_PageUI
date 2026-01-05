import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EarningsSummaryPage extends StatefulWidget {
  const EarningsSummaryPage({super.key});

  @override
  State<EarningsSummaryPage> createState() => _EarningsSummaryPageState();
}

class _EarningsSummaryPageState extends State<EarningsSummaryPage> {
  String _selectedPeriod = 'All Time';
  bool _isLoading = true;
  List<Map<String, dynamic>> _earnings = [];

  @override
  void initState() {
    super.initState();
    _loadEarnings();
  }

  Future<void> _loadEarnings() async {
    setState(() => _isLoading = true);
    
    // Simulate API call
    await Future.delayed(const Duration(milliseconds: 500));
    
    // Sample earnings data
    setState(() {
      _earnings = [
        {
          'orderId': 'DEL1001',
          'customerName': 'Rajesh Kumar',
          'address': '123 MG Road, Mumbai',
          'date': DateTime.now().subtract(const Duration(hours: 2)).toIso8601String(),
          'amount': 85.50,
          'distance': 3.5,
          'status': 'Delivered',
        },
        {
          'orderId': 'DEL1002',
          'customerName': 'Priya Sharma',
          'address': '456 Linking Road, Bandra',
          'date': DateTime.now().subtract(const Duration(hours: 5)).toIso8601String(),
          'amount': 120.00,
          'distance': 5.2,
          'status': 'Delivered',
        },
        {
          'orderId': 'DEL1003',
          'customerName': 'Amit Patel',
          'address': '789 Carter Road, Bandra West',
          'date': DateTime.now().subtract(const Duration(days: 1, hours: 2)).toIso8601String(),
          'amount': 95.75,
          'distance': 4.1,
          'status': 'Delivered',
        },
        {
          'orderId': 'DEL1004',
          'customerName': 'Sneha Desai',
          'address': '321 Hill Road, Bandra',
          'date': DateTime.now().subtract(const Duration(days: 1, hours: 6)).toIso8601String(),
          'amount': 110.25,
          'distance': 6.0,
          'status': 'Delivered',
        },
        {
          'orderId': 'DEL1005',
          'customerName': 'Vikram Singh',
          'address': '654 SV Road, Andheri',
          'date': DateTime.now().subtract(const Duration(days: 2, hours: 3)).toIso8601String(),
          'amount': 78.00,
          'distance': 2.8,
          'status': 'Delivered',
        },
        {
          'orderId': 'DEL1006',
          'customerName': 'Meera Joshi',
          'address': '987 JP Road, Versova',
          'date': DateTime.now().subtract(const Duration(days: 3, hours: 1)).toIso8601String(),
          'amount': 105.50,
          'distance': 7.3,
          'status': 'Delivered',
        },
        {
          'orderId': 'DEL1007',
          'customerName': 'Rahul Mehta',
          'address': '147 Western Express Highway, Goregaon',
          'date': DateTime.now().subtract(const Duration(days: 4, hours: 4)).toIso8601String(),
          'amount': 92.00,
          'distance': 8.5,
          'status': 'Delivered',
        },
        {
          'orderId': 'DEL1008',
          'customerName': 'Anjali Reddy',
          'address': '258 LBS Marg, Mulund',
          'date': DateTime.now().subtract(const Duration(days: 5, hours: 2)).toIso8601String(),
          'amount': 135.75,
          'distance': 12.1,
          'status': 'Delivered',
        },
        {
          'orderId': 'DEL1009',
          'customerName': 'Karan Kapoor',
          'address': '369 Eastern Express Highway, Thane',
          'date': DateTime.now().subtract(const Duration(days: 6, hours: 5)).toIso8601String(),
          'amount': 88.50,
          'distance': 4.7,
          'status': 'Delivered',
        },
        {
          'orderId': 'DEL1010',
          'customerName': 'Pooja Nair',
          'address': '741 Ghodbunder Road, Thane',
          'date': DateTime.now().subtract(const Duration(days: 7, hours: 3)).toIso8601String(),
          'amount': 115.25,
          'distance': 9.2,
          'status': 'Delivered',
        },
        {
          'orderId': 'DEL1011',
          'customerName': 'Suresh Gupta',
          'address': '852 Mira Road, Mira-Bhayandar',
          'date': DateTime.now().subtract(const Duration(days: 8, hours: 1)).toIso8601String(),
          'amount': 98.00,
          'distance': 15.3,
          'status': 'Delivered',
        },
        {
          'orderId': 'DEL1012',
          'customerName': 'Divya Iyer',
          'address': '963 Malad Link Road, Malad',
          'date': DateTime.now().subtract(const Duration(days: 10, hours: 6)).toIso8601String(),
          'amount': 125.50,
          'distance': 6.8,
          'status': 'Delivered',
        },
        {
          'orderId': 'DEL1013',
          'customerName': 'Arjun Shah',
          'address': '159 Andheri Kurla Road, Andheri',
          'date': DateTime.now().subtract(const Duration(days: 12, hours: 2)).toIso8601String(),
          'amount': 82.75,
          'distance': 3.9,
          'status': 'Delivered',
        },
        {
          'orderId': 'DEL1014',
          'customerName': 'Kavita Deshmukh',
          'address': '753 Powai Lake Road, Powai',
          'date': DateTime.now().subtract(const Duration(days: 14, hours: 4)).toIso8601String(),
          'amount': 108.00,
          'distance': 5.6,
          'status': 'Delivered',
        },
        {
          'orderId': 'DEL1015',
          'customerName': 'Rohit Bhatt',
          'address': '486 Goregaon Link Road, Goregaon',
          'date': DateTime.now().subtract(const Duration(days: 16, hours: 3)).toIso8601String(),
          'amount': 95.25,
          'distance': 7.1,
          'status': 'Delivered',
        },
      ];
      _isLoading = false;
    });
  }

  List<Map<String, dynamic>> _getFilteredEarnings() {
    final now = DateTime.now();

    switch (_selectedPeriod) {
      case 'Today':
        return _earnings.where((e) {
          final date = DateTime.parse(e['date']);
          return date.year == now.year &&
              date.month == now.month &&
              date.day == now.day;
        }).toList();

      case 'This Week':
        final startOfWeek = now.subtract(Duration(days: now.weekday - 1));
        return _earnings.where((e) {
          final date = DateTime.parse(e['date']);
          return date.isAfter(startOfWeek.subtract(const Duration(days: 1)));
        }).toList();

      case 'This Month':
        return _earnings.where((e) {
          final date = DateTime.parse(e['date']);
          return date.year == now.year && date.month == now.month;
        }).toList();

      case 'All Time':
      default:
        return _earnings;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Scaffold(
        backgroundColor: Colors.grey[50],
        appBar: AppBar(
          title: const Text(
            'Earnings Summary',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    final filteredEarnings = _getFilteredEarnings();
    final totalEarnings = filteredEarnings.fold<double>(
      0,
      (sum, earning) => sum + earning['amount'],
    );
    final totalDeliveries = filteredEarnings.length;

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text(
          'Earnings Summary',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Column(
        children: [
          // Summary Card
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF4CAF50), Color(0xFF45a049)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.green.withOpacity(0.3),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              children: [
                const Text(
                  'Total Earnings',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '₹ ${totalEarnings.toStringAsFixed(2)}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildSummaryStat(
                      'Deliveries',
                      totalDeliveries.toString(),
                      Icons.delivery_dining,
                    ),
                    Container(
                      height: 40,
                      width: 1,
                      color: Colors.white30,
                    ),
                    _buildSummaryStat(
                      'Avg/Delivery',
                      totalDeliveries > 0
                          ? '₹${(totalEarnings / totalDeliveries).toStringAsFixed(0)}'
                          : '₹0',
                      Icons.trending_up,
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Period Filter
          Container(
            height: 50,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildPeriodChip('All Time'),
                _buildPeriodChip('This Month'),
                _buildPeriodChip('This Week'),
                _buildPeriodChip('Today'),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Deliveries List Header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'All Deliveries',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
                Text(
                  '${filteredEarnings.length} orders',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 12),

          // Deliveries List
          Expanded(
            child: filteredEarnings.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.inbox_outlined,
                          size: 64,
                          color: Colors.grey[400],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'No deliveries found',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: filteredEarnings.length,
                    itemBuilder: (context, index) {
                      final earning = filteredEarnings[index];
                      return _buildDeliveryCard(earning);
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryStat(String label, String value, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: Colors.white, size: 24),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _buildPeriodChip(String period) {
    final isSelected = _selectedPeriod == period;
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: FilterChip(
        label: Text(period),
        selected: isSelected,
        onSelected: (selected) {
          if (selected) {
            setState(() {
              _selectedPeriod = period;
            });
          }
        },
        backgroundColor: Colors.white,
        selectedColor: Colors.green,
        labelStyle: TextStyle(
          color: isSelected ? Colors.white : Colors.black87,
          fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
        ),
        checkmarkColor: Colors.white,
        elevation: isSelected ? 2 : 0,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      ),
    );
  }

  Widget _buildDeliveryCard(Map<String, dynamic> earning) {
    final date = DateTime.parse(earning['date']);
    final dateStr = DateFormat('MMM dd, yyyy').format(date);
    final timeStr = DateFormat('hh:mm a').format(date);

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.green.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.shopping_bag,
                        color: Colors.green,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Order #${earning['orderId']}',
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          earning['customerName'],
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '₹ ${earning['amount'].toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.green.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        earning['status'],
                        style: const TextStyle(
                          fontSize: 11,
                          color: Colors.green,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Icon(Icons.location_on, size: 14, color: Colors.grey[600]),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    earning['address'],
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey[700],
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.access_time, size: 14, color: Colors.grey[600]),
                const SizedBox(width: 4),
                Text(
                  '$dateStr • $timeStr',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
                const Spacer(),
                Icon(Icons.local_shipping, size: 14, color: Colors.grey[600]),
                const SizedBox(width: 4),
                Text(
                  '${earning['distance']} km',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
