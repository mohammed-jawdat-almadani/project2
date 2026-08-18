import 'package:fpdart/fpdart.dart';
import '../../../../core/error/failures.dart';
import '../entities/technician_profile.dart';

abstract class ProfileRepository {
  Future<Either<Failure, TechnicianProfile>> getProfile();
  Future<Either<Failure, void>> logout();
}
