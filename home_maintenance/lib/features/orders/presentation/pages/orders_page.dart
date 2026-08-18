import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/injection.dart';
import '../bloc/orders_bloc.dart';
import '../bloc/orders_event.dart';
import '../bloc/orders_state.dart';
import '../widgets/order_card.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<OrdersBloc>()..add(const OrdersEvent.fetchOrders()),
      child: const _OrdersView(),
    );
  }
}

class _OrdersView extends StatelessWidget {
  const _OrdersView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.0),
          child: Text(
            'طلباتي',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1E293B),
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_rounded, color: Color(0xFF003882)),
            onPressed: () {
              context.read<OrdersBloc>().add(const OrdersEvent.refresh());
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: BlocConsumer<OrdersBloc, OrdersState>(
        listener: (context, state) {
          if (state.errorMessage != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage!),
                backgroundColor: Colors.redAccent,
                behavior: SnackBarBehavior.floating,
              ),
            );
          }
        },
        builder: (context, state) {
          return Column(
            children: [
              // Filter Chips Bar
              _buildFilterChips(context, state),

              // Orders List
              Expanded(
                child: state.isLoading && state.orders.isEmpty
                    ? const Center(
                        child: CircularProgressIndicator(color: Color(0xFF003882)),
                      )
                    : RefreshIndicator(
                        color: const Color(0xFF003882),
                        onRefresh: () async {
                          context.read<OrdersBloc>().add(const OrdersEvent.refresh());
                        },
                        child: state.orders.isEmpty
                            ? _buildEmptyState(context)
                            : ListView.builder(
                                padding: const EdgeInsets.only(top: 8, bottom: 24),
                                itemCount: state.orders.length,
                                itemBuilder: (context, index) {
                                  final order = state.orders[index];
                                  return OrderCard(order: order);
                                },
                              ),
                      ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildFilterChips(BuildContext context, OrdersState state) {
    final current = state.currentFilter;

    final filters = [
      {'label': 'الكل', 'value': null},
      {'label': 'المقبولة 🟢', 'value': 'accepted'},
      {'label': 'المعلقة ⏳', 'value': 'pending'},
      {'label': 'المنتهية ⚪', 'value': 'expired'},
    ];

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        child: Row(
          children: filters.map((f) {
            final val = f['value'];
            final isSelected = current == val;

            return Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: FilterChip(
                label: Text(
                  f['label']!,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                    color: isSelected ? Colors.white : const Color(0xFF475569),
                  ),
                ),
                selected: isSelected,
                selectedColor: const Color(0xFF003882),
                backgroundColor: const Color(0xFFF1F5F9),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                side: BorderSide(
                  color: isSelected ? const Color(0xFF003882) : const Color(0xFFE2E8F0),
                ),
                showCheckmark: false,
                onSelected: (_) {
                  context.read<OrdersBloc>().add(OrdersEvent.filterChanged(val));
                },
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(24),
                decoration: const BoxDecoration(
                  color: Color(0xFFEEF2FF),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.assignment_outlined,
                  size: 48,
                  color: Color(0xFF003882),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'لا توجد طلبات هنا حالياً',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1E293B),
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'عند استلام أو قبول طلبات صيانة جديدة ستظهر في هذه القائمة مباشرة',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 13, color: Color(0xFF64748B), height: 1.4),
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {
                  context.read<OrdersBloc>().add(const OrdersEvent.refresh());
                },
                icon: const Icon(Icons.refresh_rounded, size: 18),
                label: const Text('تحديث القائمة'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF003882),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
