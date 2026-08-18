import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:formz/formz.dart';
import '../../domain/entities/category_model.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/wizard/provider_register_wizard_bloc.dart';
import '../widgets/primary_auth_button.dart';
import '../models/password_input.dart';
import '../models/confirm_password_input.dart';
import '../../../../core/enums/user_role.dart';
import '../../../../core/enums/technician_status.dart';

class ProviderRegisterWizardPage extends StatefulWidget {
  final String ticket;
  final String phone;

  const ProviderRegisterWizardPage({super.key, required this.ticket, required this.phone});

  @override
  State<ProviderRegisterWizardPage> createState() => _ProviderRegisterWizardPageState();
}

class _ProviderRegisterWizardPageState extends State<ProviderRegisterWizardPage> {
  final PageController _pageController = PageController();
  final ImagePicker _picker = ImagePicker();
  
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProviderRegisterWizardBloc, ProviderRegisterWizardState>(
      listenWhen: (previous, current) => previous.currentStep != current.currentStep || previous.status != current.status,
      listener: (context, state) {
        if (state.status == FormzSubmissionStatus.success) {
          // Trigger the final AuthBloc submission
          context.read<AuthBloc>().add(
            AuthEvent.registerProviderSubmit(
              phone: widget.phone,
              ticket: widget.ticket,
              firstName: state.firstName.value,
              lastName: state.lastName.value,
              serviceCategoryIds: state.services.value.map((e) => e.id).toList(),
              password: state.password.value,
              passwordConfirmation: state.confirmPassword.value,
              selfiePath: state.personalPhoto.value?.path,
              idFrontPath: state.idFront.value?.path,
              idBackPath: state.idBack.value?.path,
            ),
          );
        } else {
          _pageController.animateToPage(
            state.currentStep - 1,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        }
      },
      child: Scaffold(
        backgroundColor: const Color(0xFFF9FAFB),
        appBar: AppBar(
          backgroundColor: const Color(0xFFF9FAFB),
          elevation: 0,
          centerTitle: true,
          title: const Text(
            'تسجيل مقدم الخدمة',
            style: TextStyle(color: Color(0xFF003C9E), fontSize: 22, fontWeight: FontWeight.w700),
          ),
          leading: BlocBuilder<ProviderRegisterWizardBloc, ProviderRegisterWizardState>(
            builder: (context, state) {
              return IconButton(
                icon: const Icon(Icons.arrow_back, color: Color(0xFF374151)),
                onPressed: () {
                  if (state.currentStep > 1) {
                    context.read<ProviderRegisterWizardBloc>().add(const ProviderRegisterWizardEvent.previousStep());
                  } else {
                    context.pop();
                  }
                },
              );
            },
          ),
        ),
        body: BlocListener<AuthBloc, AuthState>(
          listener: (context, authState) {
            authState.maybeWhen(
              authenticated: (user) {
                if (user.role == UserRole.technician) {
                  if (user.technicianStatus == TechnicianStatus.active ||
                      user.technicianStatus == TechnicianStatus.probation) {
                    context.go('/');
                  } else {
                    context.go('/activation');
                  }
                } else {
                  context.go('/');
                }
              },
              error: (msg) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg))),
              orElse: () {},
            );
          },
          child: Column(
            children: [
              _buildProgressBar(),
              Expanded(
                child: PageView(
                  controller: _pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    _buildStep1(),
                    _buildStep2(),
                    _buildStep3(),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: BlocBuilder<AuthBloc, AuthState>(
              builder: (context, authState) {
                final isLoadingAuth = authState.maybeWhen(loading: () => true, orElse: () => false);
                return BlocBuilder<ProviderRegisterWizardBloc, ProviderRegisterWizardState>(
                  builder: (context, state) {
                    return PrimaryAuthButton(
                      text: state.currentStep == 3 ? 'إكمال التسجيل' : 'التالي',
                      icon: state.currentStep == 3 ? Icons.check_circle_outline : null,
                      isLoading: isLoadingAuth,
                      onPressed: () {
                        if (state.currentStep == 3) {
                          context.read<ProviderRegisterWizardBloc>().add(const ProviderRegisterWizardEvent.submit());
                        } else {
                          context.read<ProviderRegisterWizardBloc>().add(const ProviderRegisterWizardEvent.nextStep());
                        }
                      },
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProgressBar() {
    return BlocBuilder<ProviderRegisterWizardBloc, ProviderRegisterWizardState>(
      buildWhen: (p, c) => p.currentStep != c.currentStep,
      builder: (context, state) {
        String stepTitle = '';
        if (state.currentStep == 1) stepTitle = 'المعلومات الشخصية والمهنية';
        if (state.currentStep == 2) stepTitle = 'توثيق الهوية';
        if (state.currentStep == 3) stepTitle = 'أمان الحساب';

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(stepTitle, style: const TextStyle(color: Color(0xFF6B7280), fontSize: 14)),
                  Text('الخطوة ${state.currentStep} من 3', style: const TextStyle(color: Color(0xFF0056D2), fontSize: 14, fontWeight: FontWeight.w600)),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: List.generate(3, (index) {
                  return Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: index < 2 ? 4 : 0),
                      height: 6,
                      decoration: BoxDecoration(
                        color: index < state.currentStep ? const Color(0xFF0056D2) : const Color(0xFFE5E7EB),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildStep1() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: BlocBuilder<ProviderRegisterWizardBloc, ProviderRegisterWizardState>(
        builder: (context, state) {
          final bloc = context.read<ProviderRegisterWizardBloc>();
          final showErrors = state.showStep1Errors;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('المعلومات الأساسية', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFF111827))),
              const SizedBox(height: 8),
              const Text('يرجى إدخال بياناتك الشخصية والمهنية بدقة.', style: TextStyle(fontSize: 16, color: Color(0xFF6B7280))),
              const SizedBox(height: 32),
              
              const Text('الاسم الأول', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xFF374151))),
              const SizedBox(height: 8),
              _buildTextField(
                hint: 'أدخل اسمك الأول',
                prefixIcon: Icons.person_outline,
                onChanged: (val) => bloc.add(ProviderRegisterWizardEvent.firstNameChanged(val)),
                errorText: showErrors && state.firstName.isNotValid ? 'الاسم الأول مطلوب' : null,
              ),
              
              const SizedBox(height: 24),
              const Text('الاسم الأخير', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xFF374151))),
              const SizedBox(height: 8),
              _buildTextField(
                hint: 'أدخل اسم العائلة',
                prefixIcon: Icons.badge_outlined,
                onChanged: (val) => bloc.add(ProviderRegisterWizardEvent.lastNameChanged(val)),
                errorText: showErrors && state.lastName.isNotValid ? 'الاسم الأخير مطلوب' : null,
              ),
              
              const SizedBox(height: 32),
              const Divider(),
              const SizedBox(height: 32),
              
              const Text('التخصص', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Color(0xFF111827))),
              const SizedBox(height: 16),
              DropdownButtonFormField<CategoryModel>(
                initialValue: state.specialization.value,
                decoration: InputDecoration(
                  hintText: 'اختر مجال تخصصك الأساسي',
                  prefixIcon: const Icon(Icons.handyman_outlined, color: Color(0xFF9CA3AF)),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Color(0xFFD1D5DB))),
                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Color(0xFFD1D5DB))),
                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Color(0xFF0056D2))),
                  errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Colors.red)),
                  errorText: showErrors && state.specialization.isNotValid ? 'يجب اختيار تخصص' : null,
                  filled: true,
                  fillColor: Colors.white,
                ),
                items: state.categories.map((spec) => DropdownMenuItem(value: spec, child: Text(spec.name))).toList(),
                onChanged: (val) {
                  if (val != null) bloc.add(ProviderRegisterWizardEvent.specializationChanged(val));
                },
              ),
              
              const SizedBox(height: 32),
              const Text('الخدمات المقدمة', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xFF111827))),
              const SizedBox(height: 8),
              const Text('اختر الخدمات المحددة التي تقدمها بناءً على تخصصك.', style: TextStyle(fontSize: 14, color: Color(0xFF6B7280))),
              const SizedBox(height: 16),
              
              if (state.isCategoriesLoading)
                const Center(child: CircularProgressIndicator())
              else if (state.specialization.value != null && state.specialization.value!.children.isNotEmpty)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(
                      spacing: 8,
                      runSpacing: 12,
                      children: state.specialization.value!.children.map((service) {
                        final isSelected = state.services.value.any((s) => s.id == service.id);
                        return ChoiceChip(
                          label: Text(service.name),
                          selected: isSelected,
                          selectedColor: const Color(0xFFDBEAFE),
                          backgroundColor: Colors.white,
                          labelStyle: TextStyle(
                            color: isSelected ? const Color(0xFF1E40AF) : const Color(0xFF374151),
                            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: BorderSide(color: isSelected ? const Color(0xFF93C5FD) : const Color(0xFFD1D5DB)),
                          ),
                          onSelected: (selected) {
                            if (selected) {
                              bloc.add(ProviderRegisterWizardEvent.serviceAdded(service));
                            } else {
                              bloc.add(ProviderRegisterWizardEvent.serviceRemoved(service));
                            }
                          },
                        );
                      }).toList(),
                    ),
                    if (showErrors && state.services.isNotValid)
                      const Padding(
                        padding: EdgeInsets.only(top: 8.0),
                        child: Text('يجب اختيار خدمة واحدة على الأقل', style: TextStyle(color: Colors.red, fontSize: 12)),
                      )
                  ],
                )
              else if (state.specialization.value != null)
                const Text('لا توجد خدمات متاحة لهذا التخصص', style: TextStyle(color: Color(0xFF6B7280))),
            ],
          );
        },
      ),
    );
  }

  Future<void> _pickImage(ImageSource source, Function(XFile?) onPicked) async {
    final XFile? image = await _picker.pickImage(
      source: source,
      maxWidth: 1200,
      maxHeight: 1200,
      imageQuality: 80,
    );
    if (image != null) onPicked(image);
  }

  Widget _buildStep2() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: BlocBuilder<ProviderRegisterWizardBloc, ProviderRegisterWizardState>(
        builder: (context, state) {
          final bloc = context.read<ProviderRegisterWizardBloc>();
          final showErrors = state.showStep2Errors;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('توثيق الهوية', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFF111827))),
              const SizedBox(height: 8),
              const Text('يرجى رفع المستندات التالية لإكمال عملية التسجيل.', style: TextStyle(fontSize: 16, color: Color(0xFF6B7280))),
              const SizedBox(height: 32),
              
              // Personal Photo
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: const Color(0xFFE5E7EB),
                  borderRadius: BorderRadius.circular(16),
                  border: showErrors && state.personalPhoto.isNotValid ? Border.all(color: Colors.red) : null,
                ),
                child: Column(
                  children: [
                    const Text('الصورة الشخصية', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xFF374151))),
                    const SizedBox(height: 24),
                    GestureDetector(
                      onTap: () => _pickImage(ImageSource.gallery, (file) => bloc.add(ProviderRegisterWizardEvent.personalPhotoChanged(file))),
                      child: Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF3F4F6),
                          shape: BoxShape.circle,
                          image: state.personalPhoto.value != null ? DecorationImage(image: FileImage(File(state.personalPhoto.value!.path)), fit: BoxFit.cover) : null,
                        ),
                        child: state.personalPhoto.value == null
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(Icons.account_circle, size: 40, color: Color(0xFF0056D2)),
                                  SizedBox(height: 8),
                                  Text('إضافة صورة', style: TextStyle(color: Color(0xFF0056D2), fontSize: 14)),
                                ],
                              )
                            : null,
                      ),
                    ),
                    if (showErrors && state.personalPhoto.isNotValid)
                      const Padding(padding: EdgeInsets.only(top: 8), child: Text('الصورة الشخصية مطلوبة', style: TextStyle(color: Colors.red, fontSize: 12))),
                    const SizedBox(height: 24),
                    const Text('يجب أن تكون الصورة واضحة وتظهر الوجه بالكامل.', style: TextStyle(fontSize: 12, color: Color(0xFF6B7280))),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // ID Front
              _buildIdUploader(
                title: 'الوجه الأمامي للهوية',
                icon: Icons.badge,
                file: state.idFront.value,
                showError: showErrors && state.idFront.isNotValid,
                onGallery: () => _pickImage(ImageSource.gallery, (file) => bloc.add(ProviderRegisterWizardEvent.idFrontChanged(file))),
                onCamera: () => _pickImage(ImageSource.camera, (file) => bloc.add(ProviderRegisterWizardEvent.idFrontChanged(file))),
              ),
              const SizedBox(height: 24),

              // ID Back
              _buildIdUploader(
                title: 'الوجه الخلفي للهوية',
                icon: Icons.credit_card,
                file: state.idBack.value,
                showError: showErrors && state.idBack.isNotValid,
                onGallery: () => _pickImage(ImageSource.gallery, (file) => bloc.add(ProviderRegisterWizardEvent.idBackChanged(file))),
                onCamera: () => _pickImage(ImageSource.camera, (file) => bloc.add(ProviderRegisterWizardEvent.idBackChanged(file))),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildIdUploader({
    required String title,
    required IconData icon,
    required XFile? file,
    required bool showError,
    required VoidCallback onGallery,
    required VoidCallback onCamera,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFFE5E7EB),
        borderRadius: BorderRadius.circular(16),
        border: showError ? Border.all(color: Colors.red) : null,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xFF374151))),
              const SizedBox(width: 8),
              Icon(icon, color: const Color(0xFF0056D2), size: 20),
            ],
          ),
          const SizedBox(height: 24),
          DottedBorder(
            options: const RoundedRectDottedBorderOptions(
              color: Color(0xFF9CA3AF),
              strokeWidth: 1,
              dashPattern: [8, 4],
              radius: Radius.circular(12),
            ),
            child: Container(
              width: double.infinity,
              height: 120,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: file != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.file(File(file.path), fit: BoxFit.cover, width: double.infinity),
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.cloud_upload_outlined, color: Color(0xFF9CA3AF), size: 32),
                        SizedBox(height: 8),
                        Text('لم يتم رفع ملف', style: TextStyle(color: Color(0xFF6B7280), fontSize: 14)),
                      ],
                    ),
            ),
          ),
          if (showError)
            const Padding(padding: EdgeInsets.only(top: 8), child: Text('الملف مطلوب', style: TextStyle(color: Colors.red, fontSize: 12))),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: onGallery,
                  icon: const Icon(Icons.photo_library_outlined, size: 20, color: Color(0xFF0056D2)),
                  label: const Text('الاستوديو', style: TextStyle(color: Color(0xFF0056D2))),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    elevation: 0,
                    side: const BorderSide(color: Color(0xFFD1D5DB)),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: onCamera,
                  icon: const Icon(Icons.camera_alt_outlined, size: 20, color: Color(0xFF0056D2)),
                  label: const Text('تصوير', style: TextStyle(color: Color(0xFF0056D2))),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    elevation: 0,
                    side: const BorderSide(color: Color(0xFFD1D5DB)),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStep3() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: BlocBuilder<ProviderRegisterWizardBloc, ProviderRegisterWizardState>(
        builder: (context, state) {
          final bloc = context.read<ProviderRegisterWizardBloc>();
          final showErrors = state.showStep3Errors;

          return Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: const Color(0xFFE5E7EB)),
            ),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(color: Color(0xFFDBEAFE), shape: BoxShape.circle),
                  child: const Icon(Icons.shield_outlined, color: Color(0xFF1E40AF), size: 32),
                ),
                const SizedBox(height: 24),
                const Text('أمان الحساب', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF111827))),
                const SizedBox(height: 8),
                const Text(
                  'الخطوة الأخيرة! قم بتعيين كلمة مرور آمنة لحسابك للمتابعة.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, color: Color(0xFF6B7280)),
                ),
                const SizedBox(height: 32),
                Align(
                  alignment: Alignment.centerRight,
                  child: const Text('كلمة المرور', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xFF374151))),
                ),
                const SizedBox(height: 8),
                _buildTextField(
                  hint: 'أدخل كلمة المرور',
                  prefixIcon: Icons.visibility_outlined,
                  obscureText: _obscurePassword,
                  onPrefixIconTap: () => setState(() => _obscurePassword = !_obscurePassword),
                  onChanged: (val) => bloc.add(ProviderRegisterWizardEvent.passwordChanged(val)),
                  errorText: showErrors && state.password.isNotValid
                      ? (state.password.error == PasswordValidationError.empty 
                          ? 'كلمة المرور مطلوبة' 
                          : state.password.error == PasswordValidationError.tooShort 
                              ? 'كلمة المرور قصيرة جداً (8 أحرف على الأقل)' 
                              : 'كلمة المرور يجب أن تحتوي على حروف، أرقام، ورموز')
                      : null,
                ),
                const SizedBox(height: 24),
                Align(
                  alignment: Alignment.centerRight,
                  child: const Text('تأكيد كلمة المرور', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xFF374151))),
                ),
                const SizedBox(height: 8),
                _buildTextField(
                  hint: 'أعد إدخال كلمة المرور',
                  prefixIcon: Icons.visibility_off_outlined,
                  obscureText: _obscureConfirmPassword,
                  onPrefixIconTap: () => setState(() => _obscureConfirmPassword = !_obscureConfirmPassword),
                  onChanged: (val) => bloc.add(ProviderRegisterWizardEvent.confirmPasswordChanged(val)),
                  errorText: showErrors && state.confirmPassword.isNotValid
                      ? (state.confirmPassword.error == ConfirmPasswordValidationError.empty ? 'تأكيد كلمة المرور مطلوب' : 'كلمات المرور غير متطابقة')
                      : null,
                ),
                const SizedBox(height: 32),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF3F4F6),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: showErrors && state.termsAccepted.isNotValid ? Colors.red : const Color(0xFFE5E7EB)),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        height: 24,
                        width: 24,
                        child: Checkbox(
                          value: state.termsAccepted.value,
                          onChanged: (val) => bloc.add(ProviderRegisterWizardEvent.termsAcceptedChanged(val ?? false)),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: RichText(
                          text: const TextSpan(
                            text: 'أوافق على ',
                            style: TextStyle(color: Color(0xFF374151), fontSize: 14, fontFamily: 'Tajawal'),
                            children: [
                              TextSpan(
                                text: 'سياسة التطبيق والشروط والأحكام',
                                style: TextStyle(color: Color(0xFF0056D2), fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                if (showErrors && state.termsAccepted.isNotValid)
                  const Padding(padding: EdgeInsets.only(top: 8), child: Text('يجب الموافقة على الشروط والأحكام', style: TextStyle(color: Colors.red, fontSize: 12))),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildTextField({
    required String hint,
    required IconData prefixIcon,
    bool obscureText = false,
    VoidCallback? onPrefixIconTap,
    ValueChanged<String>? onChanged,
    String? errorText,
  }) {
    return TextFormField(
      obscureText: obscureText,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hint,
        errorText: errorText,
        hintStyle: const TextStyle(color: Color(0xFF9CA3AF)),
        prefixIcon: InkWell(
          onTap: onPrefixIconTap,
          child: Icon(prefixIcon, color: const Color(0xFF6B7280)),
        ),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Color(0xFFD1D5DB))),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Color(0xFFD1D5DB))),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Color(0xFF0056D2))),
        errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Colors.red)),
      ),
    );
  }
}
