class MonitorModel {
  final String displaySize;
  final String displaTechnology;
  final String displayResolution;
  final String contrastRatio;
  final String responseTime;
  final String signalFrequency;
  final String multimediaSpeakers;
  final String ports;
  final String warranty;

  MonitorModel({
    required this.displaySize,
    required this.displaTechnology,
    required this.displayResolution,
    required this.contrastRatio,
    required this.responseTime,
    required this.signalFrequency,
    required this.multimediaSpeakers,
    required this.ports,
    required this.warranty,
  });

  Map<String, dynamic> toMap() {
    return {
      'Display_Size': displaySize,
      'Displa_Technology': displaTechnology,
      'Display_Resolution': displayResolution,
      'Contrast_Ratio': contrastRatio,
      'Response_Time': responseTime,
      'Signal_Frequency': signalFrequency,
      'Multimedia_Speakers': multimediaSpeakers,
      'Ports': ports,
      'Warranty': warranty,
    };
  }

  factory MonitorModel.fromMap(Map<String, dynamic> map) {
    return MonitorModel(
      displaySize: map['displaySize'] as String,
      displaTechnology: map['displaTechnology'] as String,
      displayResolution: map['displayResolution'] as String,
      contrastRatio: map['contrastRatio'] as String,
      responseTime: map['responseTime'] as String,
      signalFrequency: map['signalFrequency'] as String,
      multimediaSpeakers: map['multimediaSpeakers'] as String,
      ports: map['ports'] as String,
      warranty: map['warranty'] as String,
    );
  }
}