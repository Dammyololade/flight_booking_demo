
import 'package:flight_reservouir/models/ErrorModel.dart';

///
/// project: flight_reservouir
/// @package: models
/// @author dammyololade <damola@kobo360.com>
/// created on 2019-05-19
class BlocModel<T>
{
  /// [T] any object
  T model;

  /// indicates if the stream is in a process state
  bool processing;

  ///[ErrorModel]
  ///
  ErrorModel errorModel;

  BlocModel({this.model, this.processing, this.errorModel});
}