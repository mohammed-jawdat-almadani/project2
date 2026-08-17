import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/injection.dart';
import '../bloc/activation/activation_bloc.dart';
import '../widgets/activation_center_card.dart';

class ActivationPage extends StatelessWidget {
  const ActivationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ActivationBloc>()..add(const ActivationEvent.loadCenters()),
      child: Scaffold(
        backgroundColor: const Color(0xFFFBFDF9),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              const Text(
                'تفعيل الحساب',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF002D84), // Primary Blue
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'يرجى زيارة أحد مراكزنا المعتمدة أدناه لتفعيل حسابك وإكمال عملية التسجيل.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 32),
              Expanded(
                child: BlocBuilder<ActivationBloc, ActivationState>(
                  builder: (context, state) {
                    return state.when(
                      initial: () => const SizedBox.shrink(),
                      loading: () => const Center(child: CircularProgressIndicator()),
                      loaded: (centers) {
                        if (centers.isEmpty) {
                          return const Center(child: Text('لا توجد مراكز متاحة حالياً.'));
                        }
                        return ListView.builder(
                          itemCount: centers.length,
                          itemBuilder: (context, index) {
                            return ActivationCenterCard(center: centers[index]);
                          },
                        );
                      },
                      error: (message) => Center(
                        child: Text(
                          message,
                          style: const TextStyle(color: Colors.red),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
