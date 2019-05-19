import 'package:flight_reservouir/FlightService.dart';
import 'package:flight_reservouir/bloc/BlocBase.dart';
import 'package:flight_reservouir/models/BlocModel.dart';
import 'package:flight_reservouir/models/ErrorModel.dart';
import 'package:flight_reservouir/models/SearchDataModel.dart';
import 'package:rxdart/rxdart.dart';

///
/// project: flight_reservouir
/// @package: bloc
/// @author dammyololade <damola@kobo360.com>
/// created on 2019-05-19
class SearchFlightBloc implements BlocBase
{
  
  PublishSubject<BlocModel> searchController = PublishSubject();
  Sink<BlocModel> get inBlocModel => searchController.sink;
  Stream<BlocModel> get outBlocModel => searchController.stream;
  FlightService flightService = FlightService();
  SearchDataModel searchDataModel;
  ErrorModel errorModel;
  
  search(Map<String, String> params)
  {
    /// notify listeners about the processing state
    inBlocModel.add(BlocModel(processing: true));
    flightService.searchFlights(params).then((value){
      if(value is SearchDataModel){
        searchDataModel = value;
      }else{
        errorModel = value;
      }
      print(value);
      inBlocModel.add(BlocModel(model: searchDataModel, processing: false, errorModel: errorModel));
    });
  }

  getAccessToken()
  {
    flightService.getAccessToken();
  }
  
  
  @override
  void dispose() {
    searchController.close();
  }
}