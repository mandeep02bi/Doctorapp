import 'package:adixion/Presentation/Prescription/data/models/medicine_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class MedicineDatabase {
  static final MedicineDatabase instance = MedicineDatabase._init();
  static Database? _database;

  MedicineDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('medicines.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE medicines (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        medicine_name TEXT NOT NULL,
        qty TEXT NOT NULL,
        frequency TEXT NOT NULL,
        route_form TEXT NOT NULL,
        no_of_days TEXT NOT NULL,
        instruction TEXT NOT NULL
      )
    ''');
  }

  // Insert
  Future<int> insertMedicine(MedicineModel medicine) async {
    final db = await instance.database;
    return await db.insert('medicines', medicine.toMap());
  }

  // Get All
  Future<List<MedicineModel>> getAllMedicines() async {
    final db = await instance.database;
    final result = await db.query('medicines', orderBy: 'id DESC');
    return result.map((map) => MedicineModel.fromMap(map)).toList();
  }

  // Delete
  Future<int> deleteMedicine(int id) async {
    final db = await instance.database;
    return await db.delete(
      'medicines',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // Close DB
  Future close() async {
    final db = await instance.database;
    db.close();
  }
}