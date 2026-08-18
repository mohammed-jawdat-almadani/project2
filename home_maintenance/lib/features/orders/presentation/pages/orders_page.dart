import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../../../core/theme/app_colors.dart';
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
      backgroundColor: AppColors.background(context),
      appBar: AppBar(
        backgroundColor: AppColors.surface(context),
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: Text(
            context.tr('tab_orders'),
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary(context),
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh_rounded, color: AppColors.primary(context)),
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
                    ? Center(
                        child: CircularProgressIndicator(color: AppColors.primary(context)),
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
      {'label': context.isArabic ? 'الكل' : 'All', 'value': null},
      {'label': context.isArabic ? 'المقبولة 🟢' : 'Active 🟢', 'value': 'accepted'},
      {'label': context.isArabic ? 'المعلقة ⏳' : 'Pending ⏳', 'value': 'pending'},
      {'label': context.isArabic ? 'المنتهية ⚪' : 'Completed ⚪', 'value': 'expired'},
    ];

    return Container(
      color: AppColors.surface(context),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        child: Row(
          children: filters.map((f) {
            final val = f['value'];
            final isSelected = current == val;

            return Padding(
              padding: EdgeInsets.only(
                right: context.isRtl ? 0 : 8.0,
                left: context.isRtl ? 8.0 : 0,
              ),
              child: FilterChip(
                label: Text(
                  f['label']!,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                    color: isSelected ? Colors.white : AppColors.textSecondary(context),
                  ),
                ),
                selected: isSelected,
                selectedColor: const Color(0xFF003882),
                backgroundColor: AppColors.inputFill(context),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                side: BorderSide(
                  color: isSelected ? const Color(0xFF003882) : AppColors.border(context),
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
    final isDark = AppColors.isDark(context);

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
                decoration: BoxDecoration(
                  color: isDark ? const Color(0xFF1E3A8A).withValues(alpha: 0.3) : const Color(0xFFEEF2FF),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.assignment_outlined,
                  size: 48,
                  color: AppColors.primary(context),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                context.isArabic ? 'لا توجد طلبات هنا حالياً' : 'No orders found',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary(context),
                ),
              ),
              const SizedBox(height: 6),
              Text(
                context.isArabic
                    ? 'عند استلام أو قبول طلبات صيانة جديدة ستظهر في هذه القائمة مباشرة'
                    : 'New service requests and accepted jobs will appear here',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 13, color: AppColors.textSecondary(context), height: 1.4),
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {
                  context.read<OrdersBloc>().add(const OrdersEvent.refresh());
                },
                icon: const Icon(Icons.refresh_rounded, size: 18),
                label: Text(context.tr('retry')),
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
