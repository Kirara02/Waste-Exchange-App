import 'package:waste_exchange/data/repositories/data_plan_repository.dart';
import 'package:waste_exchange/domain/entities/data_plan.dart';
import 'package:waste_exchange/domain/entities/result.dart';

class DummyDataPlanRepository implements DataPlanRepository {
  @override
  Future<Result<List<DataPlan>>> getDataPlans() async {
    await Future.delayed(const Duration(seconds: 1));

    List<DataPlan> data = [
      DataPlan(
        id: 1,
        name: "1 GB",
        price: 10000,
        expired: "1 Hari",
        desc: "Paket data 1GB dengan masa berlaku 1 hari, cocok untuk penggunaan harian ringan seperti browsing.",
      ),
      DataPlan(
        id: 2,
        name: "3 GB",
        price: 25000,
        expired: "1 Hari",
        desc: "Paket data 3GB dengan masa berlaku 1 hari, ideal untuk penggunaan media sosial dan streaming ringan.",
      ),
      DataPlan(
        id: 3,
        name: "5 GB",
        price: 30000,
        expired: "7 Hari",
        desc: "Paket data 5GB untuk masa aktif 7 hari, cocok untuk kebutuhan internet sedang.",
      ),
      DataPlan(
        id: 4,
        name: "10 GB",
        price: 50000,
        expired: "7 Hari",
        desc: "Paket data 10GB dengan masa berlaku 7 hari, ideal untuk penggunaan internet yang lebih intensif.",
      ),
      DataPlan(
        id: 5,
        name: "15 GB",
        price: 75000,
        expired: "30 Hari",
        desc: "Paket data 15GB dengan masa aktif 30 hari, cocok untuk pengguna dengan aktivitas internet cukup tinggi.",
      ),
      DataPlan(
        id: 6,
        name: "30 GB",
        price: 100000,
        expired: "30 Hari",
        desc: "Paket data besar 30GB dengan masa berlaku 30 hari, ideal untuk streaming, download, dan gaming.",
      ),
    ];

    return Result.success(data);
  }
}
