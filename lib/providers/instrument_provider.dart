import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/instrument_model.dart';
import '../services/instrument_service.dart';


final instrumentServiceProvider = Provider<InstrumentService>((ref) {
  return InstrumentService();
});


final instrumentsProvider = FutureProvider<List<Instrument>>((ref) async {
  final service = ref.watch(instrumentServiceProvider);
  return service.fetchInstruments();
});