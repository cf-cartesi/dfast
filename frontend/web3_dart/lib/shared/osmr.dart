class OsmrOutput {
  OsmrOutput({
    required this.code,
    required this.routes,
    required this.waypoints,
  });
  late final String code;
  late final List<Routes> routes;
  late final List<Waypoints> waypoints;

  OsmrOutput.fromJson(Map<String, dynamic> json){
    code = json['code'];
    routes = List.from(json['routes']).map((e)=>Routes.fromJson(e)).toList();
    waypoints = List.from(json['waypoints']).map((e)=>Waypoints.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['code'] = code;
    _data['routes'] = routes.map((e)=>e.toJson()).toList();
    _data['waypoints'] = waypoints.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Routes {
  Routes({
    required this.geometry,
    required this.legs,
    required this.weightName,
    required this.weight,
    required this.duration,
    required this.distance,
  });
  late final String geometry;
  late final List<Legs> legs;
  late final String weightName;
  late final int weight;
  late final int duration;
  late final double distance;

  Routes.fromJson(Map<String, dynamic> json){
    geometry = json['geometry'];
    legs = List.from(json['legs']).map((e)=>Legs.fromJson(e)).toList();
    weightName = json['weight_name'];
    weight = json['weight'];
    duration = json['duration'];
    distance = (json['distance'] as num).toDouble();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['geometry'] = geometry;
    _data['legs'] = legs.map((e)=>e.toJson()).toList();
    _data['weight_name'] = weightName;
    _data['weight'] = weight;
    _data['duration'] = duration;
    _data['distance'] = distance;
    return _data;
  }
}

class Legs {
  Legs({
    required this.steps,
    required this.summary,
    required this.weight,
    required this.duration,
    required this.distance,
  });
  late final List<Steps> steps;
  late final String summary;
  late final int weight;
  late final int duration;
  late final double distance;

  Legs.fromJson(Map<String, dynamic> json){
    steps = List.from(json['steps']).map((e)=>Steps.fromJson(e)).toList();
    summary = json['summary'];
    weight = json['weight'];
    duration = json['duration'];
    distance = (json['distance'] as num).toDouble();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['steps'] = steps.map((e)=>e.toJson()).toList();
    _data['summary'] = summary;
    _data['weight'] = weight;
    _data['duration'] = duration;
    _data['distance'] = distance;
    return _data;
  }
}

class Steps {
  Steps({
    required this.geometry,
    required this.maneuver,
    required this.mode,
    required this.drivingSide,
    required this.name,
    required this.intersections,
    required this.weight,
    required this.duration,
    required this.distance,
  });
  late final String geometry;
  late final Maneuver maneuver;
  late final String mode;
  late final String drivingSide;
  late final String name;
  late final List<Intersections> intersections;
  late final double? weight;
  late final double? duration;
  late final double? distance;

  Steps.fromJson(Map<String, dynamic> json){
    geometry = json['geometry'];
    maneuver = Maneuver.fromJson(json['maneuver']);
    mode = json['mode'];
    drivingSide = json['driving_side'];
    name = json['name'];
    intersections = List.from(json['intersections']).map((e)=>Intersections.fromJson(e)).toList();
    weight = (json['weight'] as num).toDouble();
    duration = (json['duration'] as num).toDouble();
    distance = (json['distance'] as num).toDouble();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['geometry'] = geometry;
    _data['maneuver'] = maneuver.toJson();
    _data['mode'] = mode;
    _data['driving_side'] = drivingSide;
    _data['name'] = name;
    _data['intersections'] = intersections.map((e)=>e.toJson()).toList();
    _data['weight'] = weight;
    _data['duration'] = duration;
    _data['distance'] = distance;
    return _data;
  }
}

class Maneuver {
  Maneuver({
    required this.bearingAfter,
    required this.bearingBefore,
    required this.location,
    required this.modifier,
    required this.type,
  });
  late final int bearingAfter;
  late final int bearingBefore;
  late final List<double> location;
  late final String modifier;
  late final String type;

  Maneuver.fromJson(Map<String, dynamic> json){
    bearingAfter = json['bearing_after'];
    bearingBefore = json['bearing_before'];
    location = List.castFrom<dynamic, double>(json['location']);
    modifier = json['modifier'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['bearing_after'] = bearingAfter;
    _data['bearing_before'] = bearingBefore;
    _data['location'] = location;
    _data['modifier'] = modifier;
    _data['type'] = type;
    return _data;
  }
}

class Intersections {
  Intersections({
    required this.out,
    required this.entry,
    required this.bearings,
    required this.location,
  });
  late final int out;
  late final List<bool> entry;
  late final List<int> bearings;
  late final List<double> location;

  Intersections.fromJson(Map<String, dynamic> json){
    out = json['out'];
    entry = List.castFrom<dynamic, bool>(json['entry']);
    bearings = List.castFrom<dynamic, int>(json['bearings']);
    location = List.castFrom<dynamic, double>(json['location']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['out'] = out;
    _data['entry'] = entry;
    _data['bearings'] = bearings;
    _data['location'] = location;
    return _data;
  }
}

class Waypoints {
  Waypoints({
    required this.hint,
    required this.distance,
    required this.name,
    required this.location,
  });
  late final String hint;
  late final double distance;
  late final String name;
  late final List<double> location;

  Waypoints.fromJson(Map<String, dynamic> json){
    hint = json['hint'];
    distance = json['distance'];
    name = json['name'];
    location = List.castFrom<dynamic, double>(json['location']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['hint'] = hint;
    _data['distance'] = distance;
    _data['name'] = name;
    _data['location'] = location;
    return _data;
  }
}