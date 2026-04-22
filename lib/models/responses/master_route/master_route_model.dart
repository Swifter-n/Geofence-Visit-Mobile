import 'package:freezed_annotation/freezed_annotation.dart';

part 'master_route_model.freezed.dart';
part 'master_route_model.g.dart';

@freezed
class MasterRouteModel with _$MasterRouteModel {
  const factory MasterRouteModel({
    @JsonKey(name: 'outlet_site_id') required String outletSiteId,
    @JsonKey(name: 'outlet_name') required String outletName,
    @JsonKey(name: 'rute_id') String? ruteId,
    double? latitude,
    double? longitude,
    double? radius,
  }) = _MasterRouteModel;

  factory MasterRouteModel.fromJson(Map<String, dynamic> json) =>
      _$MasterRouteModelFromJson(json);
}
